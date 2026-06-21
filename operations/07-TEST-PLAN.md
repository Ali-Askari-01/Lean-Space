# LeanSpace — Test Plan

**Scope:** What gets tested, how, and when — focused on the two highest-risk logic areas (streak/rollover math, RLS authorization) plus a minimal E2E and purchase-flow check.
**Source of truth:** `source/LeanSpace_Product_Engineering_Doc.docx`, `engineering/02-TRD.md`, `engineering/03-SECURITY.md`
**Companion docs:** `product/01-PRD.md` §5.4 (task streak), `execution/05-TICKETS.md` (P1-08, P1-11, P1-12, P1-03)
**When to use this doc:** Start applying §1 as soon as P1-11 (rollover) and P1-08 (habit streak) exist. Don't wait for "test phase" — there isn't one in a solo build; tests get written alongside the ticket that introduces the risk.

---

## Assumptions Made

| # | Assumption | Why |
|---|---|---|
| TP1 | Tests are written in **Dart (`flutter_test`/`mocktail`)** for client logic and **plain SQL scripts run via `psql` or Supabase SQL editor** for DB-side logic (triggers, RLS). No dedicated CI test runner assumed for v1 — manual/local execution is acceptable for a solo dev. | Matches solo-dev maintainability principle already stated in `00-README.md` build philosophy. |
| TP2 | "Unit test" for streak/rollover means a **deterministic, hand-constructed DB state** fed into the logic, not a fuzzer or property-based test. | Property-based testing is valuable but disproportionate effort for a 2-person engineering surface (you, and whichever AI agent helps you). |
| TP3 | Performance smoke test target (1000 todos / 90 days, P95 < 2s) is a **manual one-time check**, not an ongoing benchmark suite. | Source doc doesn't specify scale targets; this is a sanity check, not a perf program. |

---

## 1. Streak & Rollover Logic — Test Matrix (Highest Priority)

This is the single most bug-prone area in the entire spec (per `execution/06-RISKS.md` B.1 and B.7). Test before trusting it, not after a user complains.

### 1.1 Task streak — required test cases

| # | Scenario | Setup | Expected result |
|---|---|---|---|
| T-S1 | All tasks completed | 3 tasks created, all marked `done` before rollover | Streak extends by 1 |
| T-S2 | One task missed | 5 tasks created, 4 `done`, 1 left `pending` at rollover | Task stamped `missed`; streak does **not** extend that day; previous days' streak unaffected |
| T-S3 | Zero tasks created | No tasks created for the day | Streak neither extends nor breaks (no-op day) |
| T-S4 | Late-night task, same-day completion | Task added 11:55 PM local, marked `done` at 11:58 PM | Counts toward that day; streak extends normally |
| T-S5 | Late-night task, missed by seconds | Task added 11:55 PM, rollover hits at midnight before user marks it done | Task stamped `missed`; streak does not extend — **this is correct per spec**, but verify the UI doesn't feel broken (see Frontend note below) |
| T-S6 | Re-added (Left Behind) task completed same day | Yesterday's missed task re-added today via Left Behind, then marked `done` | Counts as a normal task for *today's* streak eligibility; does **not** retroactively fix yesterday's broken streak |
| T-S7 | Historical streak read after gap | DB has: Day 1 success, Day 2 missed, Day 3 success | Streak counter, read backward from today, correctly stops counting at the first `missed` day encountered (per `P1-12` read-time computation) |

### 1.2 Habit streak — required test cases

| # | Scenario | Setup | Expected result |
|---|---|---|---|
| T-H1 | Consecutive days | Habit completed Day 1, Day 2, Day 3 | Streak = 3 |
| T-H2 | One day gap | Habit completed Day 1, skipped Day 2, completed Day 3 | Streak resets to 1 on Day 3 |
| T-H3 | Same-day toggle off | Habit marked complete, then un-marked, same local day | Streak does not increment; `last_completed_date` reverts |
| T-H4 | Boundary completion | Habit completed 11:58 PM local, app re-opened 00:02 local (4 min later, now "tomorrow") | `last_completed_date` reflects the day it was actually completed, not the day it was viewed — confirm this against device timezone at write time, not read time |
| T-H5 | No retroactive completion | Attempt to mark a habit complete "for yesterday" | Rejected / not exposed in UI — there is no path to backdate |

### 1.3 Rollover Edge Function — required test cases

| # | Scenario | Expected result |
|---|---|---|
| T-R1 | Normal midnight rollover, single timezone | Open tasks for that user's local "yesterday" become `missed`; habits with stale `last_completed_date` are left as-is (habit streak resets are computed at read-time per T-H2, not by the rollover function) |
| T-R2 | Three different user timezones in the same DB | Each user's tasks roll over according to *their own* `users.timezone`, not server time or each other's |
| T-R3 | DST transition | Pick a date where the user's region springs-forward or falls-back; verify rollover still fires once, not zero or twice, for that calendar day |
| T-R4 | Stale timezone (user traveled, didn't reopen app) | Document actual behavior (rollover uses last-known `users.timezone`) — this is accepted behavior per `execution/06-RISKS.md` B.1, not a bug; test exists to confirm it fails *predictably*, not silently corrupt data |
| T-R5 | Hourly cron runs but no users have hit local midnight yet | No rows are touched; function is a safe no-op |

**Frontend note (tie-back to T-S5):** even though missing-by-seconds is spec-correct, consider whether the UI should ever show "so close!" messaging — explicitly **out of scope for v1** (see `execution/06-RISKS.md` B.7 resolution), but flag it here so it isn't forgotten when v1.1 planning happens.

---

## 2. RLS / Authorization — Integration Test Checklist

One test per table, minimum. Run these manually against two real Supabase-authenticated test users (User A, User B) before trusting any RLS policy in production.

| # | Table | Test | Expected |
|---|---|---|---|
| RLS-1 | `users` | User A attempts `SELECT * FROM users WHERE id = <UserB's id>` | 0 rows returned |
| RLS-2 | `users` | User A attempts `UPDATE users SET tier = 'pro' WHERE id = auth.uid()` | Rejected — `tier` is immutable to the user themselves |
| RLS-3 | `habits` | User A attempts to read User B's habits | 0 rows |
| RLS-4 | `habits` | Free-tier User A attempts `INSERT` with `slot_index = 3` | Rejected by `habits_free_slot_cap` |
| RLS-5 | `todos` | User A attempts to read User B's todos | 0 rows |
| RLS-6 | `todos` | User A attempts a 6th `INSERT` for the same `original_date` | Rejected by `enforce_daily_task_cap` trigger |
| RLS-7 | `projects` | Free-tier User A attempts `INSERT` into `projects` | Rejected by `projects_pro_create` |
| RLS-8 | `projects` | Non-owner project member attempts to `UPDATE` project name | Rejected — owner-only |
| RLS-9 | `project_members` | User A (not a member) attempts to read a project's member list | 0 rows |
| RLS-10 | `project_members` | Non-owner member attempts to `DELETE` another member's row | Rejected — self or owner only |
| RLS-11 | `daily_logs` | User A (not a project member) attempts to read that project's logs | 0 rows |
| RLS-12 | `daily_logs` | User A attempts to insert a log for a project they're not a member of | Rejected |
| RLS-13 | `daily_logs` | User A attempts to edit User B's log within the same project | Rejected |
| RLS-14 | `consumed_invites` | Any authenticated client (anon key) attempts direct read/write | Rejected — zero client policies, service-role only |

**How to run these fast:** open two browser tabs against the Supabase SQL editor logged in as two different test accounts (or use `supabase-js`/`curl` with two different JWTs), and work down the list. Budget ~1 hour total — this is cheap insurance against the worst class of bug (one user seeing another user's data).

---

## 3. End-to-End Happy Path (Manual Script)

Run this top-to-bottom on a real device before considering Phase 1 "done," and again before any Play Store submission.

1. Fresh install → sign up with a new email → verify email-required state shows correctly.
2. Confirm email → land on My Day, confirm empty states render (no tasks, 3 empty habit slots).
3. Add 1 habit, tap to complete it → streak shows "1".
4. Add 5 tasks → confirm 6th add is blocked with the cap message.
5. Mark 4 of 5 tasks done, leave 1 pending.
6. Force rollover (advance device/test clock, or manually invoke the Edge Function for that test user) → confirm the pending task is now `missed` and appears in the Left Behind log, and that the streak did **not** extend.
7. Open the app "next day" → confirm the Left Behind nudge appears, expand it, re-add the missed task → confirm it now counts against today's 5-slot cap.
8. Repeat steps 4-6 for several consecutive days, this time completing everything → confirm streak increments correctly each day.

---

## 4. Purchase Flow QA (Play Billing Sandbox)

Required before Phase 2 is considered complete — do not skip, this is the other keystone risk area per `execution/06-RISKS.md` B.4.

| # | Step | Expected |
|---|---|---|
| PF-1 | License-test account taps "Monthly $3.99" on Paywall | Play purchase sheet opens with $1 intro price shown |
| PF-2 | Complete sandbox purchase | Client shows "Activating Pro…" within 1s |
| PF-3 | Wait up to ~5s | `users.tier` flips to `'pro'` via webhook; UI unlocks (habit slots, ads disappear, project creation enabled) |
| PF-4 | Force a webhook failure (temporarily disable the Edge Function) and repeat PF-1–PF-2 | Client falls back to the "this can take up to a minute" message instead of hanging indefinitely or erroring |
| PF-5 | Cancel subscription from Play Store sandbox UI | `users.tier` reverts to `'free'` at the natural expiry, not immediately — confirm this matches your intended grace-period behavior |
| PF-6 | Re-subscribe after cancellation | Tier flips back to `'pro'` correctly, no duplicate rows or stuck states |
| PF-7 | Annual plan purchase | Same checks as PF-1–PF-3 for the `$39.99/yr` SKU |

---

## 5. Performance Smoke Test (One-Time Sanity Check)

Not an ongoing benchmark — just confirm the app doesn't fall over at modest scale before you have real users to find out the hard way.

| # | Setup | Target |
|---|---|---|
| PS-1 | Seed one test user with 1,000 historical `todos` rows and 90 days of `daily_logs` across one project | My Day initial load: P95 < 2s |
| PS-2 | Same seeded user | Our Space feed load (Pro tier, full history): P95 < 2s |
| PS-3 | Same seeded user, Free tier | Confirm the 7-day filter actually limits the query (check via Supabase query logs, not just UI) — this also doubles as a correctness check, not just performance |

---

## 6. What's Explicitly NOT in v1 Test Scope

Stated plainly so it isn't accidentally treated as a gap later:

- Automated CI pipeline running tests on every commit — manual local runs are acceptable for v1.
- Load testing beyond the single-user smoke test in §5 (no concurrent-user load testing planned pre-launch).
- Cross-device matrix testing beyond "2+ real Android devices" already required by `execution/05-TICKETS.md` P4-09.
- Accessibility automated testing — `engineering/04-FRONTEND.md` §8 minimum bar is manually verified, not automated.
