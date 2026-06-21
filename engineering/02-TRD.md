# LeanSpace — Technical Requirements Document (TRD)

**Stack:** Flutter (Android-first) ↔ Supabase (Auth + Postgres + Storage) + Google Play Billing + AdMob
**Owner:** Ali Askari (solo)
**Source of truth:** `source/LeanSpace_Product_Engineering_Doc.docx` §3, §4
**Companion docs:** `product/01-PRD.md`, `engineering/03-SECURITY.md`

---

## Assumptions Made

| # | Assumption | Why |
|---|---|---|
| T1 | Day-rollover is implemented as a **scheduled Postgres function (pg_cron)** running hourly, processing users whose local midnight has just passed — NOT a client-side trigger. Justification in §4. | Source doc says "midnight, user's local time" but doesn't specify implementation. A server-side approach is necessary because the client may not be open at midnight. |
| T2 | User's local timezone is stored on the `users` row (`timezone TEXT`, IANA name) and updated on each app launch. | Required to compute "their local midnight" server-side. |
| T3 | Invite tokens are **stateless signed JWTs** (HS256 with a server secret stored in Supabase Edge Function env), with a `jti` (token ID) tracked in a `consumed_invites` table for single-use enforcement. | Source doc says "signed, single-use-per-recipient"; this is the cleanest implementation. |
| T4 | Invite token expiry default = **14 days**. Not specified in source; chosen as a reasonable security default. | Reduces stale-link attack surface. |
| T5 | Crash reporting via **Sentry Flutter** SDK; analytics via **Supabase Postgres event table** (no Firebase Analytics needed). | Source doc doesn't mention crash reporting; Sentry has a generous free tier and works well with Flutter. |
| T6 | Google Play Billing SKU naming: `com.leanspace.pro_monthly` and `com.leanspace.pro_yearly`. | Source doc doesn't specify SKU names. |

---

## 1. System Architecture

```
┌─────────────────────────────┐
│  Flutter App (Android)      │
│  - Riverpod state mgmt      │
│  - supabase_flutter SDK     │
│  - in_app_purchase (Play)   │
│  - google_mobile_ads        │
│  - sentry_flutter           │
└──────────────┬──────────────┘
               │ HTTPS (PostgREST + GoTrue)
               │ + Realtime WS (NOT used in v1)
               ▼
┌─────────────────────────────────────────┐
│  Supabase Project                       │
│  ┌─────────────┐  ┌──────────────────┐  │
│  │ Auth (GoTrue)│  │ Postgres (RLS on)│  │
│  └─────────────┘  └──────────────────┘  │
│  ┌─────────────┐  ┌──────────────────┐  │
│  │ Storage (—) │  │ Edge Functions   │  │
│  │ (unused v1) │  │ - invite-redeem  │  │
│  │             │  │ - rollover-cron  │  │
│  └─────────────┘  └──────────────────┘  │
│  pg_cron extension: hourly rollover     │
└─────────────────────────────────────────┘
               │
               ▼
       ┌───────────────────┐
       │ Google Play       │
       │ Billing (RTDN     │
       │ webhook → Edge Fn)│
       └───────────────────┘
```

**Layer responsibilities:**
- **Flutter client:** UI, local-time computation for "today", optimistic UI updates, Play Billing flow, AdMob banner rendering, Sentry crash capture.
- **Supabase Auth (GoTrue):** Email/password + Google sign-in (recommended; reduces friction on Android).
- **Supabase Postgres:** All persistent data. Row-Level Security (RLS) is the primary authorization mechanism — see `engineering/03-SECURITY.md`.
- **Supabase Edge Functions:** Two functions: `invite-redeem` (validates JWT, checks cap, inserts membership atomically) and `rollover-cron` (the scheduled function described in §4).
- **Google Play Billing:** Source of truth for subscription status. Server-side validation via Real-Time Developer Notifications (RTDN) hitting a webhook Edge Function that updates `users.tier`.
- **AdMob:** Banner unit on My Day for Free tier only.

---

## 2. Data Model (DDL-style)

All tables live in schema `public`. RLS enabled on every table (policies in `engineering/03-SECURITY.md`).

### 2.1 `users`

```sql
CREATE TABLE public.users (
  id           UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email        TEXT NOT NULL UNIQUE,
  tier         TEXT NOT NULL DEFAULT 'free' CHECK (tier IN ('free', 'pro')),
  timezone     TEXT NOT NULL DEFAULT 'UTC',  -- IANA name, e.g. 'America/New_York'
  pro_since    TIMESTAMPTZ,                  -- set when tier first becomes 'pro'
  pro_until    TIMESTAMPTZ,                  -- subscription expiry from Play Billing RTDN
  created_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX idx_users_tier ON public.users(tier);
```

### 2.2 `habits`

```sql
CREATE TABLE public.habits (
  id                    UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id               UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  name                  TEXT NOT NULL CHECK (char_length(name) BETWEEN 1 AND 80),
  slot_index            SMALLINT NOT NULL CHECK (slot_index BETWEEN 0 AND 4),  -- 0..4 = 5 slots
  streak_count          INTEGER NOT NULL DEFAULT 0,
  last_completed_date   DATE,                                                   -- user's local date
  created_at            TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (user_id, slot_index)
);
CREATE INDEX idx_habits_user ON public.habits(user_id);
```

### 2.3 `todos`

```sql
CREATE TABLE public.todos (
  id                    UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id               UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  text                  TEXT NOT NULL CHECK (char_length(text) BETWEEN 1 AND 200),
  status                TEXT NOT NULL DEFAULT 'open'
                          CHECK (status IN ('open', 'done', 'missed')),
  original_date         DATE NOT NULL,                            -- the local day this task belongs to
  completed_date        DATE,                                     -- local date when marked done
  is_carried_forward    BOOLEAN NOT NULL DEFAULT FALSE,
  created_at            TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX idx_todos_user_date ON public.todos(user_id, original_date DESC);
CREATE INDEX idx_todos_user_status ON public.todos(user_id, status);
```

> **Cap enforcement** (5 per `original_date` per `user_id`) is enforced both client-side **and** by a `BEFORE INSERT` trigger — see §5 of `engineering/03-SECURITY.md` for the abuse-prevention rationale.

### 2.4 `projects`

```sql
CREATE TABLE public.projects (
  id                    UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  owner_id              UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  name                  TEXT NOT NULL CHECK (char_length(name) BETWEEN 1 AND 60),
  collaborator_cap      SMALLINT NOT NULL CHECK (collaborator_cap BETWEEN 2 AND 8),
  current_invite_jti    UUID,                                     -- the active token's JWT ID
  created_at            TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX idx_projects_owner ON public.projects(owner_id);
```

### 2.5 `project_members`

```sql
CREATE TABLE public.project_members (
  project_id  UUID NOT NULL REFERENCES public.projects(id) ON DELETE CASCADE,
  user_id     UUID NOT NULL REFERENCES public.users(id)    ON DELETE CASCADE,
  joined_at   TIMESTAMPTZ NOT NULL DEFAULT now(),
  PRIMARY KEY (project_id, user_id)
);
CREATE INDEX idx_pm_user ON public.project_members(user_id);
```

### 2.6 `daily_logs`

```sql
CREATE TABLE public.daily_logs (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  project_id      UUID NOT NULL REFERENCES public.projects(id) ON DELETE CASCADE,
  user_id         UUID NOT NULL REFERENCES public.users(id)    ON DELETE CASCADE,
  done_today      TEXT CHECK (char_length(done_today)     <= 500),
  blockers        TEXT CHECK (char_length(blockers)       <= 500),
  plan_tomorrow   TEXT CHECK (char_length(plan_tomorrow)  <= 500),
  log_date        DATE NOT NULL,    -- author's local date
  created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (project_id, user_id, log_date),
  CHECK (
    coalesce(done_today,'')     <> '' OR
    coalesce(blockers,'')       <> '' OR
    coalesce(plan_tomorrow,'')  <> ''
  )
);
CREATE INDEX idx_logs_project_date ON public.daily_logs(project_id, log_date DESC);
```

### 2.7 `consumed_invites` (supporting table for invite single-use enforcement)

```sql
CREATE TABLE public.consumed_invites (
  jti          UUID PRIMARY KEY,             -- the JWT ID of the consumed token
  project_id   UUID NOT NULL REFERENCES public.projects(id) ON DELETE CASCADE,
  consumed_by  UUID NOT NULL REFERENCES public.users(id),
  consumed_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);
```

---

## 3. Query Patterns per Feature

All client-side data access is via `supabase-flutter` PostgREST queries. Sensitive operations (invite redemption, billing webhook) go through Edge Functions.

| Feature | Operation | Query / RPC |
|---|---|---|
| Sign up | Auth | `supabase.auth.signUp(email, password)` → trigger creates row in `public.users` |
| Sign in | Auth | `supabase.auth.signInWithPassword(...)` or `signInWithOAuth('google')` |
| Load today's tasks | Read | `from('todos').select().eq('user_id', uid).eq('original_date', today_local).order('created_at')` |
| Add task | Write | `from('todos').insert({user_id, text, original_date: today_local, status:'open'})` — trigger blocks if 5 already exist |
| Mark task done | Write | `from('todos').update({status:'done', completed_date: today_local}).eq('id', taskId)` |
| Load habits | Read | `from('habits').select().eq('user_id', uid).order('slot_index')` (client slices first 3 for Free) |
| Tap habit | Write | `from('habits').update({last_completed_date: today_local, streak_count: <computed>}).eq('id', habitId)` |
| Load Left Behind | Read | Free: `from('todos').select().eq('user_id',uid).eq('status','missed').gte('original_date', today_local - 7).order(original_date DESC)`. Pro: same without the `gte`. |
| Re-add Left Behind | Write | `from('todos').insert({user_id, text, original_date: today_local, status:'open', is_carried_forward: true})` |
| Create project | Write | Pro-tier only (RLS). `from('projects').insert({owner_id, name, collaborator_cap: 8})` then insert self into `project_members`. |
| Generate invite | RPC | Edge Function `generate-invite(project_id)` → returns JWT |
| Redeem invite | RPC | Edge Function `invite-redeem(token)` → validates, checks cap, inserts into `project_members`, writes `consumed_invites` row, all in a transaction |
| Post daily log | Write (upsert) | `from('daily_logs').upsert({project_id, user_id, log_date, done_today, blockers, plan_tomorrow}, onConflict='project_id,user_id,log_date')` |
| Load feed | Read | Free: `from('daily_logs').select('*, users(email)').eq('project_id', pid).gte('log_date', today_local - 7).order('log_date DESC, created_at DESC')`. Pro: same without `gte`. |

---

## 4. Day-Rollover & Streak Calculation — Implementation-Ready Spec

### 4.1 What needs to happen at rollover

For each user, at their local midnight:
1. Any `todos` row with `original_date < today_local AND status = 'open'` → set `status = 'missed'`.
2. For each habit, if `last_completed_date < today_local - 1 day`, set `streak_count = 0`.

### 4.2 Why scheduled server-side function, not client-side cron or DB trigger

| Option | Pros | Cons | Decision |
|---|---|---|---|
| Client-side cron at app launch | Simple | If user doesn't open the app for days, missed status never gets stamped, breaking streak math and Left Behind log. | ❌ |
| Postgres `BEFORE SELECT` trigger | Always fresh | Triggers don't exist on SELECT; would need a view that recomputes — expensive at scale and brittle. | ❌ |
| `pg_cron` scheduled function | Runs reliably whether user is online or not; testable; one place to change. | Requires `pg_cron` extension (available on Supabase paid plans; free plan can use Supabase Scheduled Edge Functions instead). | ✅ |

**Recommendation:** Use **Supabase Scheduled Edge Functions** (no paid tier required) — invoke `rollover-cron` every hour. Inside it, the function selects users whose `timezone` makes "now" between 00:00 and 00:59 local, and runs the rollover SQL for that batch. This is the path of least resistance for a solo dev on the Supabase free tier.

### 4.3 Rollover SQL (executed inside `rollover-cron`)

```sql
-- For users whose local hour is currently 0 (just past midnight):
WITH eligible_users AS (
  SELECT id, timezone
  FROM public.users
  WHERE EXTRACT(HOUR FROM (now() AT TIME ZONE timezone)) = 0
)
-- 1. Stamp missed tasks
UPDATE public.todos t
SET status = 'missed'
FROM eligible_users u
WHERE t.user_id = u.id
  AND t.status = 'open'
  AND t.original_date < (now() AT TIME ZONE u.timezone)::date;

-- 2. Reset broken habit streaks
UPDATE public.habits h
SET streak_count = 0
FROM eligible_users u
WHERE h.user_id = u.id
  AND (h.last_completed_date IS NULL
       OR h.last_completed_date < ((now() AT TIME ZONE u.timezone)::date - INTERVAL '1 day'));
```

### 4.4 Habit streak increment (client-side, on tap)

When user taps a habit:

```
let today    = local date now
let lastDone = habits.last_completed_date

if lastDone == today:
    // toggle off (undo)
    streak_count = max(0, streak_count - 1)
    last_completed_date = (today - 1) if streak_count > 0 else null
else if lastDone == today - 1:
    streak_count += 1
    last_completed_date = today
else:
    // gap, reset and start new
    streak_count = 1
    last_completed_date = today
```

Submit as a single UPDATE.

### 4.5 Task streak (read-time, no stored value)

Computed on demand in My Day's header:

```sql
-- Returns a count of consecutive prior days (excluding today) where the user
-- had >= 1 task and 0 of them were missed.
WITH day_summary AS (
  SELECT original_date,
         COUNT(*) AS total,
         COUNT(*) FILTER (WHERE status = 'missed') AS missed
  FROM public.todos
  WHERE user_id = :uid
    AND original_date < :today_local
  GROUP BY original_date
)
-- Walk backwards from yesterday; stop at first day with missed > 0
-- (Implemented in Dart, not SQL, for simplicity — see Ticket TRD-12.)
```

---

## 5. Tier Gating — Read-Time Query Filtering

Per the source doc, tier gating uses **read-time WHERE-clause filtering**, NOT data deletion. Implementation:

- The Flutter client reads `users.tier` at app start (cached for the session).
- For Free tier reads on `todos` (Left Behind) and `daily_logs` (feed), the client appends `.gte('original_date', today - 7)` / `.gte('log_date', today - 7)`.
- Pro tier omits this filter.
- For write-time gates (create habit slot 4/5, create project), the client checks tier BEFORE attempting the write; RLS policies enforce the same rule server-side to prevent bypass.

> **Do not redesign this.** The source doc explicitly chose this approach. Single source of truth = the `users.tier` column.

---

## 6. Third-Party Integrations

### 6.1 Google Play Billing
- Flutter package: `in_app_purchase` (official).
- Two subscription products in Play Console:
  - `com.leanspace.pro_monthly` — $3.99/mo with a $1 introductory offer for first month (Assumption T6, A3).
  - `com.leanspace.pro_yearly` — $39.99/yr.
- **Server-side verification:** Configure Real-Time Developer Notifications (RTDN) → Pub/Sub → Cloud Function (or direct webhook to a Supabase Edge Function `play-billing-webhook`) → updates `users.tier`, `users.pro_until`.
- **DO NOT trust client purchase state alone.** Tier flip happens only after webhook confirmation.
- On Pro → Free downgrade (expiry/cancel), existing project memberships are preserved per PRD §6.1; new joins blocked via RLS.

### 6.2 AdMob
- Flutter package: `google_mobile_ads`.
- Single banner ad unit, fixed position on My Day tab only.
- **Banner only — no interstitials** (source doc rule).
- Hide entirely for Pro users (check `users.tier` before instantiating the ad).
- Placement (top vs bottom) decided during Phase 1 wireframing.

### 6.3 Sentry (Assumption T5)
- Flutter package: `sentry_flutter`.
- DSN in `.env`, loaded via `flutter_dotenv`.
- Capture unhandled exceptions and Flutter framework errors only — no PII.

---

## 7. Platform Constraints to Design Around

| Constraint | Mitigation |
|---|---|
| **Supabase free-tier auto-pauses projects after 7 days of inactivity.** During Phase 0/1 dev, this can interrupt testing. | Schedule a no-op `SELECT 1` heartbeat via the same Scheduled Edge Function that runs rollover (it runs hourly anyway, so the project will never be idle). |
| Supabase free tier has 500 MB DB + 1 GB egress / month. | The data model is tiny (text only, no media). Estimated < 1 KB per active user per day. Comfortably within free tier for the first ~50k MAU. |
| Play Billing on a personal Google account requires $25 one-time fee. | Budgeted in Phase 0. |
| Android background restrictions (Doze/App Standby) | Rollover is server-side, so the app does NOT need to wake on a schedule. No issue. |
| Local timezone drift (user travels) | `timezone` column updated to device's IANA zone on every app launch. Rollover always uses the latest. |
| Single device per account (no v1 sync conflicts) | All writes go through Supabase, so multi-device works naturally with last-write-wins semantics. No additional design needed. |

---

## 8. Environment & Secrets

All keys live in environment variables, never in source:

| Variable | Used by | Loaded via |
|---|---|---|
| `SUPABASE_URL`, `SUPABASE_ANON_KEY` | Flutter client | `flutter_dotenv` from `.env` (not committed) |
| `SUPABASE_SERVICE_ROLE_KEY` | Edge Functions only | Supabase env vars dashboard |
| `INVITE_JWT_SECRET` | Edge Functions (invite generate/redeem) | Supabase env vars dashboard |
| `PLAY_BILLING_SERVICE_ACCOUNT_JSON` | `play-billing-webhook` Edge Function | Supabase env vars dashboard |
| `ADMOB_BANNER_UNIT_ID_ANDROID` | Flutter client | `flutter_dotenv` |
| `SENTRY_DSN` | Flutter client | `flutter_dotenv` |

See `engineering/03-SECURITY.md` §5 for full handling rules.
