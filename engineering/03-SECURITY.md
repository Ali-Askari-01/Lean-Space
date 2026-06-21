# LeanSpace — Security & Access Document

**Scope:** Authentication, authorization (RLS policies), invite-link security, data privacy, secrets handling, and abuse prevention.
**Source of truth:** `source/LeanSpace_Product_Engineering_Doc.docx` (esp. tier matrix, invite rules)
**Companion docs:** `engineering/02-TRD.md`

---

## Assumptions Made

| # | Assumption | Why |
|---|---|---|
| S1 | Email/password is the primary auth method; Google Sign-In is offered as a secondary frictionless option. | Source doc says "Supabase Auth" without naming providers. Google is the obvious second on Android. |
| S2 | Invite tokens expire after 14 days even if unused (see TRD T4). | Source doc only specifies single-use; an expiry is added as standard hygiene. |
| S3 | No GDPR/data-residency requirements explicitly called out — but app is global, so a basic privacy policy & data-export flow are needed before public launch. | Standard for any global app on Google Play. |
| S4 | RLS is enforced as the **only** authorization layer (no application-side checks duplicated on the server). | Single source of truth = simpler for a solo dev to reason about. |

---

## 1. Authentication

### 1.1 Provider
- **Supabase Auth (GoTrue)** with:
  - Email + password (verification email enabled).
  - Google Sign-In (Android native, via Supabase OAuth flow with the Google provider).

### 1.2 Session handling
- Supabase issues JWT access tokens (1h default) + refresh tokens (long-lived).
- `supabase_flutter` SDK handles refresh transparently.
- Tokens stored in `flutter_secure_storage` (encrypted on Android using Keystore).
- On sign-out, all tokens are wiped from secure storage.

### 1.3 Account row provisioning
- A Postgres trigger on `auth.users` creates the matching `public.users` row on signup:

```sql
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.users (id, email, tier, timezone)
  VALUES (NEW.id, NEW.email, 'free', 'UTC');
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE TRIGGER on_auth_user_created
AFTER INSERT ON auth.users
FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();
```

### 1.4 Password policy
- Minimum 8 characters (Supabase default).
- No custom complexity rules in v1 (don't over-engineer).
- Password reset via Supabase magic link to email.

---

## 2. Authorization — Row-Level Security (RLS) Policies

**RLS is enabled on every public table.** All policies use `auth.uid()` to identify the calling user.

### 2.1 `users`

```sql
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;

-- A user can SELECT only their own row.
CREATE POLICY users_select_self
ON public.users FOR SELECT
USING (id = auth.uid());

-- A user can UPDATE only their own row, and CANNOT change `tier` themselves.
CREATE POLICY users_update_self
ON public.users FOR UPDATE
USING (id = auth.uid())
WITH CHECK (
  id = auth.uid()
  AND tier = (SELECT tier FROM public.users WHERE id = auth.uid())
);

-- Inserts only happen via the auth trigger (SECURITY DEFINER); no INSERT policy needed.
```

> `tier` mutations happen only through the `play-billing-webhook` Edge Function using the `service_role` key.

### 2.2 `habits`

```sql
ALTER TABLE public.habits ENABLE ROW LEVEL SECURITY;

CREATE POLICY habits_owner_all
ON public.habits FOR ALL
USING (user_id = auth.uid())
WITH CHECK (user_id = auth.uid());

-- Free-tier write gate: a Free user cannot insert habits into slot_index 3 or 4.
CREATE POLICY habits_free_slot_cap
ON public.habits FOR INSERT
WITH CHECK (
  user_id = auth.uid()
  AND (
    slot_index < 3
    OR (SELECT tier FROM public.users WHERE id = auth.uid()) = 'pro'
  )
);
```

### 2.3 `todos`

```sql
ALTER TABLE public.todos ENABLE ROW LEVEL SECURITY;

CREATE POLICY todos_owner_all
ON public.todos FOR ALL
USING (user_id = auth.uid())
WITH CHECK (user_id = auth.uid());
```

**Hard 5-task/day cap — enforced by trigger (defense in depth):**

```sql
CREATE OR REPLACE FUNCTION public.enforce_daily_task_cap()
RETURNS TRIGGER AS $$
DECLARE
  cnt INTEGER;
BEGIN
  SELECT COUNT(*) INTO cnt
  FROM public.todos
  WHERE user_id = NEW.user_id
    AND original_date = NEW.original_date;
  IF cnt >= 5 THEN
    RAISE EXCEPTION 'daily_task_cap_exceeded';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_enforce_daily_task_cap
BEFORE INSERT ON public.todos
FOR EACH ROW EXECUTE FUNCTION public.enforce_daily_task_cap();
```

### 2.4 `projects`

```sql
ALTER TABLE public.projects ENABLE ROW LEVEL SECURITY;

-- Members (incl. owner) can read the project metadata.
CREATE POLICY projects_member_select
ON public.projects FOR SELECT
USING (
  id IN (SELECT project_id FROM public.project_members WHERE user_id = auth.uid())
);

-- Only Pro users may insert (create) projects.
CREATE POLICY projects_pro_create
ON public.projects FOR INSERT
WITH CHECK (
  owner_id = auth.uid()
  AND (SELECT tier FROM public.users WHERE id = auth.uid()) = 'pro'
  AND collaborator_cap BETWEEN 2 AND 8
);

-- Only the owner can update collaborator_cap / name / invite token.
CREATE POLICY projects_owner_update
ON public.projects FOR UPDATE
USING (owner_id = auth.uid())
WITH CHECK (owner_id = auth.uid());

-- Only the owner can delete.
CREATE POLICY projects_owner_delete
ON public.projects FOR DELETE
USING (owner_id = auth.uid());
```

### 2.5 `project_members`

```sql
ALTER TABLE public.project_members ENABLE ROW LEVEL SECURITY;

-- Members of a project can see the membership list of that project.
CREATE POLICY pm_member_select
ON public.project_members FOR SELECT
USING (
  project_id IN (SELECT project_id FROM public.project_members WHERE user_id = auth.uid())
);

-- Direct INSERTs are blocked at the policy level; joining happens via the
-- `invite-redeem` Edge Function which uses the service_role key.
-- (No INSERT/UPDATE policy => denied by RLS default.)

-- A user can remove themselves; the owner can remove anyone.
CREATE POLICY pm_self_or_owner_delete
ON public.project_members FOR DELETE
USING (
  user_id = auth.uid()
  OR project_id IN (SELECT id FROM public.projects WHERE owner_id = auth.uid())
);
```

### 2.6 `daily_logs`

```sql
ALTER TABLE public.daily_logs ENABLE ROW LEVEL SECURITY;

-- Members of a project may read logs for that project.
CREATE POLICY logs_member_select
ON public.daily_logs FOR SELECT
USING (
  project_id IN (SELECT project_id FROM public.project_members WHERE user_id = auth.uid())
);

-- Users may insert/update only their own logs, and only for projects they are a member of.
CREATE POLICY logs_self_write
ON public.daily_logs FOR INSERT
WITH CHECK (
  user_id = auth.uid()
  AND project_id IN (SELECT project_id FROM public.project_members WHERE user_id = auth.uid())
);

CREATE POLICY logs_self_update
ON public.daily_logs FOR UPDATE
USING (user_id = auth.uid())
WITH CHECK (user_id = auth.uid());

-- Users may delete only their own logs.
CREATE POLICY logs_self_delete
ON public.daily_logs FOR DELETE
USING (user_id = auth.uid());
```

### 2.7 `consumed_invites`

RLS enabled with **no policies** — only Edge Functions using `service_role` can touch this table. Clients have zero access.

---

## 3. Invite-Link Security

### 3.1 Token format (signed JWT)

```json
{
  "iss": "leanspace",
  "sub": "<project_id>",
  "jti": "<random UUID>",
  "iat": <unix>,
  "exp": <unix iat + 14 days>
}
```

Signed HS256 with `INVITE_JWT_SECRET` (stored only in Supabase Edge Function env).

The deeplink format is:

```
https://leanspace.app/invite?t=<jwt>
```

### 3.2 Generation flow (`generate-invite` Edge Function)
1. Verify caller is the project's owner.
2. Generate a new `jti` (UUID).
3. Sign the JWT.
4. UPDATE `projects.current_invite_jti` to the new value (this **automatically invalidates** any previously issued token whose `jti` is no longer the active one — see redemption rule).
5. Return the URL to the client.

### 3.3 Redemption flow (`invite-redeem` Edge Function)
Runs as a single atomic transaction:
1. Verify JWT signature and that `exp` is in the future.
2. Check `consumed_invites` — if `jti` already exists → reject ("already used").
3. Look up `projects` — if `current_invite_jti != jti` → reject ("link revoked"). This is what makes regeneration revoke old tokens.
4. Check `count(project_members WHERE project_id = sub) < collaborator_cap`; if not → reject ("project full").
5. INSERT into `project_members (project_id, user_id, joined_at)`.
6. INSERT into `consumed_invites (jti, project_id, consumed_by)`.
7. COMMIT.

### 3.4 Why this design defends against the obvious attacks

| Attack | Defense |
|---|---|
| Replay a used link | `consumed_invites.jti` PK + the existence check in step 2. |
| Crafted/forged token | HS256 signature with server-only secret. |
| Stolen-then-stale link (owner regenerated) | Step 3: `current_invite_jti` mismatch rejects. |
| Bypass cap with concurrent redemptions | Single transaction wrapping count + insert; concurrent attempts collide on the PK or fail the count check after lock. |
| Joining a project the user doesn't know about by enumerating IDs | Redemption requires a signed token; you can't fabricate one without the secret. |

---

## 4. Data Privacy

### 4.1 What is collected
- Email address (for auth).
- Habit names, task text, daily-log free-text (user-generated).
- Timezone (IANA name).
- Subscription state (from Google Play, no card data ever touches our servers).
- Crash reports (Sentry, scrubbed of PII).

### 4.2 What is **not** collected
- No real names, location, contacts, photos, microphone, files, or device identifiers beyond what Google Play assigns.
- No third-party analytics SDKs (no Firebase Analytics, no Mixpanel, no Amplitude in v1).

### 4.3 Storage location
- All in Supabase's chosen region (recommend `eu-central-1` or `us-east-1` based on developer preference — for global English-only, either is fine).
- Document the chosen region in the Privacy Policy.

### 4.4 User rights (must support before Play Store public launch)
- **Account deletion:** Settings → Delete Account → cascades via `ON DELETE CASCADE` on the FK from `public.users` to `auth.users`.
- **Data export:** A "Download my data" button that calls an Edge Function returning a JSON dump of the user's `habits`, `todos`, `daily_logs`, and `projects owned`. (Required by Google Play policy as of 2024; cheap to implement.)
- **Privacy Policy URL** linked from Play Store listing and in-app Settings.

---

## 5. API Keys & Secrets Handling

| Secret | Where | Never |
|---|---|---|
| `SUPABASE_ANON_KEY` | `.env` (client) — safe because RLS is the real gate | hardcoded in `.dart` files |
| `SUPABASE_SERVICE_ROLE_KEY` | Supabase Edge Function env only | shipped in the Flutter binary |
| `INVITE_JWT_SECRET` | Supabase Edge Function env only | shipped in the Flutter binary |
| `PLAY_BILLING_SERVICE_ACCOUNT_JSON` | Supabase Edge Function env only | committed to git |
| `ADMOB_BANNER_UNIT_ID_ANDROID` | `.env` (client) | committed in plaintext to public repo (use a separate test ID for dev) |
| `SENTRY_DSN` | `.env` (client) | committed |

**Rules:**
- `.env` is in `.gitignore`.
- A `.env.example` with placeholder values **is** committed.
- Production secrets never touch a developer laptop except via Supabase dashboard.
- Rotate `INVITE_JWT_SECRET` if leaked — this invalidates all outstanding invites (acceptable blast radius).

---

## 6. Abuse & Edge-Case Handling

| Scenario | Mitigation |
|---|---|
| Free user bypasses 5-task UI cap by hitting PostgREST directly | `enforce_daily_task_cap` trigger raises an exception on the 6th insert (§2.3). |
| Free user tries to create a 4th habit by direct API call | `habits_free_slot_cap` RLS policy rejects the INSERT (§2.2). |
| Free user tries to create a project by direct API call | `projects_pro_create` RLS policy rejects the INSERT (§2.4). |
| Free user tries to read Left Behind older than 7 days by removing the `gte` filter | **Currently NOT enforced server-side** because the source doc specifies read-time client filtering for history. Acceptable risk — older data is not sensitive (it's the user's own task text), this is purely a "value-add" Pro feature. If we wanted to enforce, we'd need a `users.tier`-aware view. **Recommended:** add this as a tier-aware view in Phase 2 if tier abuse is observed. |
| User tries to read another user's data (any table) | All RLS policies are `user_id = auth.uid()` or membership-scoped. Zero rows returned. |
| Spam project creation (Pro user opening many empty projects) | Out of scope for v1; revisit if abuse is observed. |
| Mass invite generation / link guessing | Tokens are JWT-signed; brute-forcing the signature is infeasible. Rate-limit `generate-invite` to 10/hour per project at the Edge Function level. |
| Replay attack on invite link via shoulder-surfing | Single-use per `jti` + 14-day expiry (§3.3). |
| Webhook spoofing (fake "Pro" upgrade) | Play Billing RTDN uses a Google Pub/Sub subscription with auth; the webhook verifies the JWT in the Pub/Sub request. |
| Tier downgrade race (user cancels Pro mid-session and keeps writing as Pro) | Tier is checked server-side via RLS on every write. As soon as the webhook flips `users.tier` to `'free'`, the next request gates correctly. Brief client-side stale state is acceptable. |
| Self-XSS in daily-log text fields | All text is rendered as plain text in Flutter (no HTML rendering). N/A on a native client. |

---

## 7. Pre-Launch Security Checklist

- [ ] RLS enabled on **every** table in `public` schema (verify with `SELECT relname, relrowsecurity FROM pg_class WHERE relnamespace = 'public'::regnamespace`).
- [ ] All policies covered with at least one integration test (signed-in user A cannot see user B's data).
- [ ] Invite redemption tested for: success, expired token, already consumed, full project, revoked (regenerated).
- [ ] `enforce_daily_task_cap` tested via direct PostgREST call without going through the UI.
- [ ] Google Play Billing webhook verified end-to-end on a sandbox license testing account.
- [ ] Sentry sample event captured and PII scrubbing confirmed.
- [ ] Privacy Policy URL live before Play Store submission.
- [ ] "Delete my account" tested — confirms cascading deletion across all six tables.
- [ ] `.env` is in `.gitignore` and **not** present in any committed history.
