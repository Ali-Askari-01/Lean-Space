# LeanSpace — Pre-Build Planning Package

This folder is the complete pre-build planning package for **LeanSpace**, a Flutter Android app combining personal habit/task tracking with lightweight async team check-ins, backed by Supabase.

**Author:** Senior product + engineering lead, on behalf of Ali Askari (solo dev)
**Source:** `source/LeanSpace_Product_Engineering_Doc.docx` (single source of truth)
**Date:** June 21, 2026

---

## Folder structure

| Folder | What it contains | When to read it |
|---|---|---|
| `source/` | Original Word spec — the contract everything else derives from | When you need the raw source; otherwise use the markdown docs |
| `product/` | Product requirements — what we're building and why | First; before any code |
| `engineering/` | Technical specs — architecture, security, UI | Before writing Flutter or Supabase code |
| `execution/` | Work planning — tickets, risks, dev setup, batch order | When you're ready to build |
| `operations/` | Quality & launch — testing, rollout, analytics, support | Before each milestone gate and post-launch |
| `leanspace/` | **Flutter app** — run `flutter run` from here | Daily during implementation |
| `supabase/` | DB migrations + Edge Functions | Batch 1.2 onward |
| `docs/wireframes/` | Sketches + branding notes | Phase 0 wireframing |
| `scripts/` | Dev helpers (seed SQL, etc.) | RLS / rollover testing |

---

## Files in this package

| # | File | Audience | Purpose |
|---|---|---|---|
| 0 | `00-README.md` | You | This index + "what's missing / how to start" |
| — | `product/00-EXECUTIVE-SUMMARY.md` | Anyone | One-page product overview |
| — | `execution/00-IMPLEMENTATION-READINESS.md` | You | Pre-code checklist — start here before Batch 1.2 |
| — | `docs/GETTING-STARTED.md` | You | Run the app on your phone (USB, `.env`, `flutter run`) |
| — | `source/LeanSpace_Product_Engineering_Doc.docx` | All | Original source-of-truth spec |
| 1 | `product/01-PRD.md` | Product / stakeholders | What we're building, for whom, with acceptance criteria |
| 2 | `engineering/02-TRD.md` | Engineers / AI coding agents | Architecture, schema (DDL), query patterns, rollover logic |
| 3 | `engineering/03-SECURITY.md` | Engineer / security review | Auth, RLS policies, invite security, secrets, abuse |
| 4 | `engineering/04-FRONTEND.md` | Flutter engineer | Screens, components, state mgmt, navigation, states |
| 5 | `execution/05-TICKETS.md` | You / Linear / Jira import | 59 engineering-ready tickets, grouped by Phase 0–5 |
| 6 | `execution/06-RISKS.md` | You | Open questions + risk log, decisions you owe yourself |
| 7 | `operations/07-TEST-PLAN.md` | You / QA | Streak/rollover tests, RLS checklist, E2E script, purchase QA |
| 8 | `operations/08-RELEASE-PLAN.md` | You | Rollout stages, rollback criteria, pre-launch checklist |
| 9 | `operations/09-ANALYTICS-PLAN.md` | You | KPI definitions, SQL views, weekly review cadence |
| 10 | `operations/10-SUPPORT-RUNBOOK.md` | You (post-launch) | Common issues, where to look, daily ops routine |
| 11 | `execution/11-DEV-SETUP.md` | You / AI agents | Toolchain, local dev loop, git conventions |
| 12 | `execution/12-BATCH-EXECUTION-PLAN.md` | You | How to sequence tickets into testable batches |

Each file is self-contained — readable on its own without the others.

---

## What additional plans are recommended (and weren't in your original request)

You asked for 6 docs. Here are 4 more I would write **before scaling beyond launch**. They are NOT required for v1 ship — but they're the natural next layer. Skim now, build when relevant.

### 7. **Test Plan** → `operations/07-TEST-PLAN.md`
- Unit tests for streak math + rollover SQL (the two highest-risk pieces of logic).
- Integration tests for RLS policies (User A cannot see User B's data — write one test per table).
- An E2E happy-path script (signup → add task → mark done → rollover → see streak).
- A purchase-flow QA checklist (Play Billing sandbox).
- Performance smoke test: 1000 todos / 90 days of logs, P95 load time under 2s.

### 8. **Release / Rollout Plan** → `operations/08-RELEASE-PLAN.md`
- Internal → Closed → Open testing → Production stage rollout (5%, 20%, 100%).
- Rollback criteria: crash rate > 2%, conversion < 0.5%, 1-star reviews mentioning data loss.
- Pre-launch checklist: Play Store listing, screenshots, Privacy Policy URL, Data Safety form, Account Deletion URL.
- Post-launch comms plan: ProductHunt? Indie Hackers? Reddit? Capture which channel drove install attribution if you can.

### 9. **Analytics & KPI Tracking Plan** → `operations/09-ANALYTICS-PLAN.md`
- Source doc already names the four KPIs: D1 retention, D7 retention, free→Pro conversion, Left Behind re-add rate.
- The Plan needs to spell out: how each is computed in SQL, the dashboard format (SQL views in Supabase + a single Notion page is sufficient for v1), and the review cadence (weekly).
- Define decision thresholds: e.g. "if D7 retention < 15% after 30 days live, pause new features and run interviews."

### 10. **Support & Operations Runbook** → `operations/10-SUPPORT-RUNBOOK.md`
- A one-page document for **you, post-launch**.
- Common user issues + how to resolve (e.g. "I paid but I'm Free" → reconcile via Play Console + manual `UPDATE users SET tier='pro'`).
- Where to find what: Sentry dashboard, Supabase logs, Play Console RTDN, AdMob console.
- Personal cadence: 15 min/day check for the first 2 weeks post-launch.

### Also added during planning review:
- **Dev Setup** → `execution/11-DEV-SETUP.md` — toolchain and local dev loop without Android Studio.
- **Batch Execution Plan** → `execution/12-BATCH-EXECUTION-PLAN.md` — how to sequence the 59 tickets into independently testable batches.

### Other things worth mentioning (don't necessarily need a doc):
- **Branding kit** — colors, icon variations, store assets. Phase 4 work.
- **Legal pages hosting** — Privacy Policy + ToS need a public URL. Use a free GitHub Pages site.
- **Domain `leanspace.app`** — needed for the invite deeplink. Buy in Phase 0; cheap.
- **Backup strategy** — Supabase has automatic point-in-time recovery on paid tiers. For free tier, schedule a weekly `pg_dump` to your own storage. Not critical at zero users but get it in place before you have meaningful production data.

---

## How to start building, today

This is the order. Don't deviate. **Don't write Flutter code before you have a Supabase project and one RLS policy verified.**

### Day 1–2 (Phase 0 kickoff — admin)
1. Read all core docs end-to-end (`product/`, `engineering/`, `execution/05-TICKETS.md`, `execution/06-RISKS.md`). Push back on anything that feels wrong **now**.
2. **Decide:** collaborator cap (A.1), final pricing (A.2). Don't ship without these.
3. Buy `leanspace.app` domain (~$15/yr).
4. Pay the $25 Google Play Developer fee.
5. Create the Supabase project. Save the URL + anon key into a local `.env`.
6. Create the Flutter project skeleton: `flutter create leanspace --org com.leanspace`.
7. Push the empty repo to GitHub. Commit `.env.example`, NOT `.env`.

### Day 3–7 (Phase 0 — validation, not code)
8. **Talk to 5–10 real indie devs / freelancers.** Show them the wireframes (paper is fine). Ask: "Would you pay $3.99/mo for this?" and "Is 8 collaborators enough?" Capture verbatim quotes.
9. Decide ad-banner placement (A.3). Sketch My Day wireframe.
10. Update `execution/06-RISKS.md` with the decisions. Lock the PRD.

### Week 2–5 (Phase 1)
11. Follow `execution/12-BATCH-EXECUTION-PLAN.md` batches 1.1–1.7. Start with **DDL + RLS + auth** (Tickets P1-01, P1-02, P1-03, P1-04) — this is the foundation. Don't skip RLS testing.
12. Then **habits, then todos**. Dogfood from week 3 onwards.
13. Build the **rollover Edge Function (P1-11) early enough** that you can test it for at least 3 days of real day-changes.

### Week 6–8 (Phase 2)
14. Play Billing first, paywall second, AdMob last. Each one is a half-week.

### Week 9–11 (Phase 3)
15. Project creation → invite flow → daily logs → feed. The invite Edge Function is the trickiest piece — give it a full day.

### Week 12–14 (Phase 4)
16. Polish. Visual pass. Account deletion, data export, privacy policy, icon, screenshots.
17. Submit to internal testing. Install on a second physical device.

### Week 15+ (Phase 5)
18. Staged rollout. Watch KPIs daily for 2 weeks.

---

## Build philosophy (read once, then ignore at your peril)

1. **The source doc is the contract. Don't deviate without updating the docs first.** If you change something while coding, update the markdown in the same PR.
2. **Server-side correctness > client-side correctness.** Every rule that matters (cap, tier, ownership) is enforced by RLS or a trigger. Client UI is *just* the friendly face.
3. **Defer ruthlessly.** Source doc §2.3 already lists what's deferred. If a Phase 1 feature feels tempting that's not in the PRD, write it down for v1.1 and move on.
4. **Dogfood from week 3.** Use your own broken app daily. You'll find more bugs in your first week of real use than any test suite will.
5. **Ship internal testing track by week 10. Hard deadline.** If you're behind, cut polish (Phase 4), not features.
6. **One paid user > 100 testers.** Once one stranger has paid $3.99, you have product-market fit signal. Until then, you have nothing.

Good luck. Ship it.
