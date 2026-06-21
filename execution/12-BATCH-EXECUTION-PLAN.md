# LeanSpace — Batch Execution Plan

**Scope:** How to sequence the 59 tickets in `execution/05-TICKETS.md` into batches — units of work defined by "what becomes independently testable and demoable," not by phase label alone. Phase numbers tell you *what* to build; this doc tells you *what order, in what groupings* to actually execute it.
**Source of truth:** `execution/05-TICKETS.md` (ticket IDs and dependency graph)
**Companion docs:** `operations/07-TEST-PLAN.md` (what to verify at the end of each batch), `execution/11-DEV-SETUP.md` (environment this assumes)

---

## Why Batch This Way, Not Just "Do Phase 1, Then Phase 2"

Phases in `execution/05-TICKETS.md` are the right grouping for *planning* (they map to your source doc's roadmap). But executing strictly in ticket-ID order within a phase risks getting stuck mid-phase with nothing working end-to-end for days — which is demoralizing and makes it hard to tell if you're actually on track.

Each batch below is sized so that **at the end of it, something is genuinely true that wasn't true before** — the app boots, or auth works, or habits work end-to-end. That gives you real checkpoints, not just a ticket-count progress bar.

**Rule for every batch:** don't start the next batch until the current one passes its checkpoint. This is the single highest-leverage discipline in this whole plan — skipping it is how bugs compound silently (you build Batch 4 on top of a Batch 2 that "mostly" works, and three batches later you can't tell which layer the bug is in).

---

## Phase 0 Batches

### Batch 0.1 — Environment & Accounts
**Tickets:** `P0-02, P0-03, P0-06` + everything in `execution/11-DEV-SETUP.md` §1
**Checkpoint:** `flutter doctor` is clean, Supabase project exists, Play Developer account is active.
**Note:** This has zero ambiguity — pure setup, no decisions to make. Good first session.

### Batch 0.2 — Decisions
**Tickets:** `P0-08, P0-09` (+ `execution/06-RISKS.md` B.10 owner-deletion behavior, pulled forward — see note below)
**Checkpoint:** Collaborator cap, pricing, and account-deletion-cascade behavior are written down as final decisions, not "TBD," before any schema is created.
**Why this batch exists on its own:** these are decisions, not engineering tasks — bundling them with setup tickets makes them easy to skip past without really deciding. Isolating them forces an actual choice.

> **Note on B.10:** the original risk log scheduled this decision for "before P4-04," but it's actually a schema-level question (`ON DELETE CASCADE` vs. an ownership-transfer flow) that's far cheaper to decide before Batch 2 creates the tables than to migrate later. Recommend resolving it here, not in Phase 4.

### Batch 0.3 — Wireframes
**Tickets:** `P0-07`
**Checkpoint:** My Day + Our Space wireframes exist (paper is fine), ad placement decided.
**Can run in parallel with 0.1/0.2** if you want — no dependency either direction.

---

## Phase 1 Batches

### Batch 1.1 — Boots and Talks to the Backend
**Tickets:** `P0-04, P0-05`
**Checkpoint:** Empty Flutter app launches on your device, connects to Supabase, navigates between blank placeholder screens for `/auth`, `/my-day`, `/our-space`, `/settings`.
**No business logic yet** — pure plumbing. Fast, confidence-building.

### Batch 1.2 — Data Model + Locked-Down Access
**Tickets:** `P1-01, P1-02, P1-03` + the new `app_opens` table (from `operations/09-ANALYTICS-PLAN.md` §4)
**Checkpoint:** All 8 tables exist (7 original + `app_opens`), both triggers fire correctly, and **all 14 RLS checks from `operations/07-TEST-PLAN.md` §2 pass** using your two seeded test accounts (`execution/11-DEV-SETUP.md` §4).
**Do not skip the RLS tests to move faster.** This is the batch where rushing creates a security bug, not a cosmetic one — the one category of bug serious enough to warrant a full unpublish per `operations/08-RELEASE-PLAN.md` §2.

### Batch 1.3 — Auth + Identity
**Tickets:** `P1-04, P1-05`
**Checkpoint:** Sign up, sign in, sign out all work; `users.timezone` is correctly written on every cold start.

### Batch 1.4 — Habits, End to End
**Tickets:** `P1-06, P1-07, P1-08`
**Checkpoint:** Habit CRUD + streak logic complete; test cases **T-H1 through T-H5** (`operations/07-TEST-PLAN.md` §1.2) all pass.
**This is your first genuinely demoable feature.** Good natural point to pause and feel a real win — you have a working, installable sliver of the app.

### Batch 1.5 — Tasks, End to End (Minus Rollover)
**Tickets:** `P1-09`
**Checkpoint:** 5-task cap enforced (both client UI and the `enforce_daily_task_cap` trigger — test the trigger directly via raw API call, not just the UI, per `engineering/03-SECURITY.md` §6), add/complete/delete all work.
**Deliberately excludes Left Behind/rollover** — isolating it lets the next batch get your full, undivided attention.

### Batch 1.6 — The Hard One: Rollover + Left Behind
**Tickets:** `P1-10, P1-11, P1-12`
**Checkpoint:** Test cases **T-S1 through T-S7** and **T-R1 through T-R5** (`operations/07-TEST-PLAN.md` §1.1, §1.3) all pass, using the `perform_rollover(target_date)` testing approach from `execution/11-DEV-SETUP.md` §3.
**Budget more real time here than the ticket sizes suggest.** Every other doc in this package — Risks, Tickets, Test Plan, Support Runbook — independently flags this as the highest-risk logic in the app. That convergence is the strongest signal in the whole package about where care matters most. Don't compress this batch just because earlier batches went fast.

### Batch 1.7 — Milestone Checkpoint
**Tickets:** `P1-13, P1-14`
**Checkpoint:** Full E2E script (`operations/07-TEST-PLAN.md` §3) passes on your real device. Tag the commit (`execution/11-DEV-SETUP.md` §5, e.g. `v0.1-mydaymvp`). **Dogfood it for several real consecutive days before moving to Phase 2** — this is the foundation Phases 2 and 3 build directly on top of (tier state, auth state); a shaky foundation here compounds downstream.

---

## Phase 2 Batches

### Batch 2.1 — Billing Plumbing (the risky one)
**Tickets:** `P2-01, P2-02, P2-04`
**Checkpoint:** Sandbox purchase completes; webhook correctly flips `users.tier`. Run **PF-1 through PF-7** (`operations/07-TEST-PLAN.md` §4) before calling this done — including PF-4 (the webhook-failure fallback case), since `execution/06-RISKS.md` B.4 flags this as your second-highest risk concentration after rollover.

### Batch 2.2 — UI Gating
**Tickets:** `P2-03, P2-05, P2-06, P2-07, P2-08`
**Checkpoint:** Paywall renders correctly; tier-gated UI (habit slots, Left Behind history window, ads) all react correctly to both Free and Pro state.
**Mostly mechanical once 2.1 works** — this batch should move fast if billing plumbing is solid.

### Batch 2.3 — QA
**Tickets:** `P2-09, P2-10`
**Checkpoint:** Full free→Pro upgrade and Pro→Free downgrade flows verified manually end to end.

---

## Phase 3 Batches

### Batch 3.1 — Project Creation + Invite Generation
**Tickets:** `P3-02, P3-03`
**Checkpoint:** Pro user can create a project; invite link generates correctly; old tokens are invalidated on regeneration.

### Batch 3.2 — Invite Redemption (security-critical, isolate it)
**Tickets:** `P3-04, P3-05`
**Checkpoint:** All five redemption error paths (`already_used`, `expired`, `project_full`, `revoked`, network error — `engineering/04-FRONTEND.md` §2.6) tested individually, plus the happy path. This is flagged in `execution/05-TICKETS.md`'s own dependency notes as "security-critical" — treat it with the same isolated focus as Batch 1.6.

### Batch 3.3 — Daily Logs + Feed
**Tickets:** `P3-01, P3-06, P3-07, P3-08, P3-09, P3-10, P3-11`
**Checkpoint:** Log editor, feed rendering, tier-gated history (7-day vs full), and project settings all work. This is the largest single batch in Phase 3 but the least individually risky — mostly straightforward CRUD + UI once 3.1/3.2 are solid.

### Batch 3.4 — Milestone Checkpoint
**Tickets:** `P3-12`
**Checkpoint:** Hand to 1-2 beta testers for a week of real dogfooding. No P0/P1 bugs surfaced before moving to Phase 4.

---

## Phase 4 Batches

### Batch 4.1 — Required Compliance Items
**Tickets:** `P4-04, P4-05, P4-06`
**Checkpoint:** Account deletion (with the ownership-transfer or cascade behavior decided back in Batch 0.2), data export, and Privacy Policy are all live and tested.
**Grouped together deliberately** — these are the items `execution/06-RISKS.md` B.9 warns are easy to drop under time pressure because they're not "features." Treat this batch as non-negotiable, same priority tier as security work.

### Batch 4.2 — Observability + Polish
**Tickets:** `P4-01, P4-02, P4-03, P4-10`
**Checkpoint:** Sentry capturing real events with PII scrubbing confirmed; visual pass complete; app icon/splash done.

### Batch 4.3 — Store Submission Prep
**Tickets:** `P4-07, P4-08, P4-09`
**Checkpoint:** Run the full pre-launch checklist (`operations/08-RELEASE-PLAN.md` §3) — every box checked, not just "mostly done." Submit to internal testing.

---

## Phase 5 — Not Batched (Sequential by Nature)

Phase 5 (`P5-01` through `P5-04`) is inherently sequential — staged rollout, then KPI monitoring, then support cadence, then backlog triage — and follows the stage gates already defined in `operations/08-RELEASE-PLAN.md` §1-2. No additional batching needed here; just follow the rollback criteria already documented.

---

## Quick-Reference: All Batches in Order

```
0.1 Environment & Accounts        →  0.2 Decisions  →  0.3 Wireframes (parallel-OK)
1.1 Boots & Talks to Backend
1.2 Data Model + Locked-Down Access      ← RLS tests mandatory, don't skip
1.3 Auth + Identity
1.4 Habits End to End                     ← first demoable win
1.5 Tasks End to End (no rollover)
1.6 Rollover + Left Behind                 ← highest risk, budget real time
1.7 MILESTONE: My Day complete             ← tag + dogfood before continuing
─────────────────────────────────────────
2.1 Billing Plumbing                       ← second-highest risk
2.2 UI Gating
2.3 QA
─────────────────────────────────────────
3.1 Project Creation + Invites
3.2 Invite Redemption                      ← security-critical, isolate
3.3 Daily Logs + Feed
3.4 MILESTONE: Full v1 feature-complete    ← beta dogfood week
─────────────────────────────────────────
4.1 Compliance (deletion/export/privacy)   ← don't skip under pressure
4.2 Observability + Polish
4.3 Store Submission Prep
─────────────────────────────────────────
5.x Staged rollout (see 08-RELEASE-PLAN.md, not re-batched here)
```

---

## How to Use This Day to Day

- Pick **one batch at a time**. Don't context-switch between batches mid-stream — the whole point of batching is finishing a coherent unit before the next one, so partial progress never piles up across multiple unfinished fronts at once.
- At the end of every batch, run its checkpoint **before** moving on, even if you're confident it's fine. The checkpoints are cheap; a bug discovered three batches later, buried under new code, is not.
- If a batch is taking much longer than expected (especially 1.6 or 2.1/3.2), that's expected, not a sign you're doing something wrong — these are independently flagged as the hard parts across every doc in this package. Slow down here, not later.
