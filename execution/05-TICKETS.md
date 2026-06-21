# LeanSpace — Feature Ticket List

**Format:** Engineering-ready tickets, grouped by Phase (0–5 from source doc).
**Sizing:** S ≈ ≤ 0.5 day, M ≈ 0.5–2 days, L ≈ 2–5 days (solo-dev calendar).
**Status field:** All tickets start as `Todo`.
**Source of truth:** `source/LeanSpace_Product_Engineering_Doc.docx` §6 Execution Plan
**Companion docs:** `product/01-PRD.md`, `engineering/02-TRD.md`, `engineering/03-SECURITY.md`, `engineering/04-FRONTEND.md`

---

## Assumptions Made

- Tickets assume the assumptions from PRD (A1–A5), TRD (T1–T6), Security (S1–S4) and Frontend (F1–F5) are accepted.
- Phase 0 includes one explicit user-validation ticket (P0-01); if you skip it, mark it as such — don't silently drop it.

---

## Phase 0 — Validation & Foundations

| ID | Title | Description | Acceptance Criteria | Size | Depends on |
|---|---|---|---|---|---|
| P0-01 | Validate with 5–10 indie devs / freelancers | Reach out, demo the spec, collect blunt feedback on tier matrix + pricing | Notes captured in a single doc; pricing and 8-collaborator cap either confirmed or revised | M | — |
| P0-02 | Create Supabase project (free tier) | Region chosen; project named `leanspace-prod`. Note connection string. | Project exists; `.env.example` has placeholder keys | S | — |
| P0-03 | Create Flutter project skeleton | `flutter create leanspace`, set package id `com.leanspace`, set min SDK = 26 | Empty app boots on Android emulator | S | — |
| P0-04 | Wire `supabase_flutter`, `flutter_dotenv`, `flutter_secure_storage` | Add deps, configure `.env` loading, init Supabase in `main` | App connects to Supabase; `supabase.auth.currentUser` returns null cleanly | S | P0-02, P0-03 |
| P0-05 | Wire `riverpod`, `go_router` | Set up `ProviderScope`, declare router with `/auth`, `/my-day`, `/our-space`, `/settings` shells | App navigates between empty placeholder screens | S | P0-03 |
| P0-06 | Set up Google Play Developer account | $25 one-time payment; internal-testing-only app entry created | Console shows the leanspace app stub | S | — |
| P0-07 | Wireframe My Day + Our Space (paper or Figma) | Resolves the open ad-banner placement question (top vs bottom) | Wireframes attached to repo `/docs/wireframes/`; banner-placement decision recorded | M | — |
| P0-08 | Finalize collaborator cap | Pick 5, 6, 7, 8, or 10 (default assumption: 8) | Decision recorded in PRD / Risk Log | S | P0-01 |
| P0-09 | Decide pricing reversal | Confirm $3.99/mo & $39.99/yr or revise downward | Decision recorded in PRD / Risk Log | S | P0-01 |

---

## Phase 1 — My Day Core

| ID | Title | Description | Acceptance Criteria | Size | Depends on |
|---|---|---|---|---|---|
| P1-01 | DDL migration: all 7 tables | Create `users`, `habits`, `todos`, `projects`, `project_members`, `daily_logs`, `consumed_invites` per TRD §2 | Migration applied; all tables visible in Supabase | M | P0-02 |
| P1-02 | DB triggers: `handle_new_user`, `enforce_daily_task_cap` | Create both triggers from SECURITY §1.3 and §2.3 | New auth.users row → public.users row; 6th INSERT into todos raises | M | P1-01 |
| P1-03 | RLS policies on all tables | Apply every policy from SECURITY §2 | Auth'd user A cannot see auth'd user B's rows (integration test) | M | P1-01 |
| P1-04 | Auth screen + Supabase sign up/in flows | Email/password + Google OAuth, error handling | New account can be created, signed in, signed out | M | P0-04, P0-05 |
| P1-05 | Persist timezone on app launch | On every cold start, write device IANA timezone to `users.timezone` | DB shows accurate timezone after launch from different timezones (manual test or device emulator with simulated zone) | S | P1-04 |
| P1-06 | My Day shell screen with bottom nav | Empty My Day + Our Space tabs, top app bar, settings entry | App opens to My Day after auth | S | P1-04 |
| P1-07 | Habit tracker UI + CRUD | Up to 5 slots; Free shows 3 + 2 locked; tap to toggle | All acceptance from PRD §5.2 | L | P1-03, P1-06 |
| P1-08 | Habit streak increment logic (client) | Per TRD §4.4 | Edge-cases (toggle off same day, gap of 1, gap of 2+) verified | M | P1-07 |
| P1-09 | Daily task list UI + CRUD | Up to 5 tasks, add/done/delete; cap enforced by trigger too | All acceptance from PRD §5.1 | L | P1-03, P1-06 |
| P1-10 | Left Behind nudge + expanded sheet | Show banner if any missed tasks in window; expand → list + re-add | All acceptance from PRD §5.3; re-added row has `is_carried_forward=true` | M | P1-09 |
| P1-11 | Rollover Edge Function (`rollover-cron`) | Per TRD §4.3; deploy to Supabase; schedule hourly | After advancing system clock past midnight in a test user's tz, open tasks become `missed` and habits with stale `last_completed_date` reset | L | P1-01, P1-05 |
| P1-12 | Task streak header (read-time computation) | Walk backward through `original_date`s; stop at first day with `missed > 0` | Header shows correct streak across 5 hand-crafted DB states | M | P1-09, P1-11 |
| P1-13 | Empty / loading / error states for My Day | Skeleton shimmer, retry banner, empty illustration | All three states reachable in dev | S | P1-09 |
| P1-14 | **MILESTONE:** Personal discipline app installable | Internal install on personal device; daily-use dogfooding starts | App used by Ali daily for 7+ days without breakage | — | P1-01..P1-13 |

---

## Phase 2 — Monetization Plumbing

| ID | Title | Description | Acceptance Criteria | Size | Depends on |
|---|---|---|---|---|---|
| P2-01 | Create Play Console subscription products | `com.leanspace.pro_monthly` ($3.99 + $1 intro) and `com.leanspace.pro_yearly` ($39.99) | Both visible in Console; license-tested account can see them | S | P0-06 |
| P2-02 | Integrate `in_app_purchase` plugin | Init, query products, launch purchase, listen for updates | Sandbox purchase completes in dev build | M | P0-04 |
| P2-03 | Paywall screen | Per FRONTEND §2.7; two plan buttons; loading + error states | Tapping a plan opens Play sheet | M | P2-02 |
| P2-04 | Play Billing webhook Edge Function | `play-billing-webhook` verifies Pub/Sub JWT, updates `users.tier` and `pro_until` | Sandbox purchase flips DB `tier` to `pro`; cancellation flips back at expiry | L | P2-02, P1-01 |
| P2-05 | Client-side tier read + cache | `tierProvider` reads `users.tier`, cached for session, refreshed on app foreground | UI gates (locked habit slots, paywall on Create Project) react to tier within 5s of webhook update | M | P2-04 |
| P2-06 | Tier-gated UI in My Day | Lock habit slots 4–5 visually for Free; tap → paywall | Verified for both Free and Pro | S | P2-05, P1-07 |
| P2-07 | Tier-gated history filtering (Left Behind) | `gte('original_date', today - 7)` for Free | Free user with 30 days of missed tasks sees only last 7 | S | P2-05, P1-10 |
| P2-08 | AdMob integration on My Day | Banner unit only; hide for Pro | Banner shown for Free, hidden for Pro | M | P2-05, P0-07 |
| P2-09 | End-to-end free → pro upgrade QA | Walk through full purchase, verify ad disappears, slots unlock, history opens | Manual QA checklist passes; recorded | M | P2-06..P2-08 |
| P2-10 | End-to-end downgrade behavior QA | Cancel sub in Play, wait for expiry, confirm ads return and slots re-lock | Manual QA checklist passes | S | P2-09 |

---

## Phase 3 — Our Space

| ID | Title | Description | Acceptance Criteria | Size | Depends on |
|---|---|---|---|---|---|
| P3-01 | Our Space empty state | Per FRONTEND §2.3 | Renders for users in zero projects | S | P1-06 |
| P3-02 | Project creation flow | Pro-gated; FRONTEND §2.5 | Pro user can create; Free user sees paywall | M | P2-05, P1-03 |
| P3-03 | `generate-invite` Edge Function | Per SECURITY §3.2; returns signed JWT URL | Owner can generate link; old token revoked on regenerate | M | P3-02 |
| P3-04 | `invite-redeem` Edge Function | Per SECURITY §3.3 — full transactional cap check | All five error paths return the right message; happy path inserts membership | L | P3-03 |
| P3-05 | Invite/Join UI + deeplink (`/invite?t=…`) | FRONTEND §2.6 | Deeplink from outside the app opens the join screen | M | P3-04 |
| P3-06 | Daily log editor sheet | Three free-text fields, validation (≥1 non-empty), upsert per FRONTEND §2.4 | Save creates a row; saving again same day updates it | M | P3-02 |
| P3-07 | Feed view with reverse-chronological cards | `DailyLogCard` list + pull-to-refresh | Feed renders newest-first; PTR works | M | P3-06 |
| P3-08 | Tier-gated history filtering on feed | 7-day window for Free; full for Pro | Free user with 14 logs sees last 7; footer upsell banner shown | S | P3-07, P2-05 |
| P3-09 | Project settings (owner only) | Member list, regenerate invite, kick member, delete project | All owner-only actions gated by RLS + UI | M | P3-04 |
| P3-10 | Project switcher chip | When user is in >1 project, allows switching | Switching loads the new feed | S | P3-07 |
| P3-11 | Empty / loading / error states for Our Space | Per FRONTEND §4 | All three states reachable in dev | S | P3-07 |
| P3-12 | **MILESTONE:** Full v1 feature set complete | Hand to one or two beta testers for a week of dogfooding | No P0/P1 bugs surfaced | — | P3-01..P3-11 |

---

## Phase 4 — Polish & Launch Prep

| ID | Title | Description | Acceptance Criteria | Size | Depends on |
|---|---|---|---|---|---|
| P4-01 | App icon + launch screen | Final icon, adaptive icon, splash | Renders correctly on Android 8+ | M | — |
| P4-02 | Visual polish pass (typography, spacing, colors) | Take one full day to clean up rough edges | No visible inconsistencies in any of the 8+ screens | M | P3-12 |
| P4-03 | Sentry integration | DSN in .env, init in main, sample event captured | One crash visible in Sentry dashboard | S | — |
| P4-04 | "Delete my account" flow | SECURITY §4.4 | Account + cascading rows gone after confirmation | M | P1-03 |
| P4-05 | "Export my data" flow | Edge function returns JSON of all user rows | Download works end-to-end | M | P1-03 |
| P4-06 | Privacy Policy + Terms pages | Host on a simple static URL; link from Settings + Play listing | URLs reachable; pages cover data we collect | S | — |
| P4-07 | Play Store listing copy + screenshots | 8 screenshots, feature graphic, store description | Listing draft saved in Play Console | M | P4-01, P4-02 |
| P4-08 | Internal QA checklist run | All happy paths + the SECURITY §7 pre-launch checklist | Checklist signed off | M | P4-02..P4-07 |
| P4-09 | Submit to Google Play **internal testing track** | Upload AAB, define testers, run on 2+ real devices | App installs on 2 devices via internal testing link | S | P4-08 |
| P4-10 | (Optional) Dark theme | If time allows, add a dark M3 theme | Toggles correctly with system | S | P4-02 |

---

## Phase 5 — Launch & Iterate

| ID | Title | Description | Acceptance Criteria | Size | Depends on |
|---|---|---|---|---|---|
| P5-01 | Promote to **closed testing** then **production** | Stage rollout: closed → 20% production → 100% | Live on Play Store | M | P4-09 |
| P5-02 | KPI dashboard | Simple SQL views in Supabase: D1 retention, D7 retention, free→pro conversion, Left Behind re-add rate | All 4 metrics queryable | M | P5-01 |
| P5-03 | First-week support cadence | Daily check Play reviews, Sentry, KPIs | Logged daily for 7 days | M | P5-01 |
| P5-04 | First-iteration backlog | Triage feedback, choose next 5 tickets | Backlog ordered | S | P5-03 |

---

## Cross-Phase Dependencies Quick View

```
P0-02 → P0-04 → P1-04 → (everything auth-gated)
P1-01 → P1-02 / P1-03 → (all data features)
P1-09 → P1-10 → P1-12  (task streak depends on todos + rollover)
P1-11 (rollover) is the keystone for streak correctness — do not skip or stub
P2-04 (billing webhook) is the keystone for tier correctness — do not stub for launch
P3-04 (invite-redeem Edge Function) is the keystone for Our Space — security-critical
```

---

## Counts at a glance

| Phase | Tickets |
|---|---|
| Phase 0 | 9 |
| Phase 1 | 14 |
| Phase 2 | 10 |
| Phase 3 | 12 |
| Phase 4 | 10 |
| Phase 5 | 4 |
| **Total** | **59** |
