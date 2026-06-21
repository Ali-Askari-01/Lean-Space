# LeanSpace — Release & Rollout Plan

**Scope:** How LeanSpace moves from internal testing to public availability on Google Play, with explicit rollback criteria so a bad release doesn't sit live while you figure out what to do.
**Source of truth:** `execution/05-TICKETS.md` Phase 4 & 5, `execution/06-RISKS.md`
**Companion docs:** `00-README.md` (build philosophy), `engineering/03-SECURITY.md` §7 (pre-launch checklist), `operations/07-TEST-PLAN.md`

---

## Assumptions Made

| # | Assumption | Why |
|---|---|---|
| RP1 | Google Play's standard testing tracks (**Internal → Closed → Open → Production**) are used as named, with staged percentage rollout on Production. | Standard Play Console mechanism; source doc doesn't specify an alternative. |
| RP2 | Rollback for a solo dev means **halting the staged rollout percentage and/or publishing a hotfix**, not a full unpublish — unpublishing is a last resort. | Matches solo-dev operational reality; full unpublish is reputationally costly and rarely necessary if caught early. |
| RP3 | "Closed testing" track is used for the 5-10 validation users from Phase 0, if any remain engaged by launch time. | Reuses people who already showed interest rather than recruiting fresh testers. |

---

## 1. Stage-by-Stage Rollout

| Stage | Who | Purpose | Exit criteria to advance |
|---|---|---|---|
| **Internal testing** | You + up to ~10 invited testers (your own devices, friends) | Catch crashes, broken flows, obviously wrong UI before anyone outside your control sees it | All P0/P1 bugs from `operations/07-TEST-PLAN.md` §3 E2E script pass; no crash on cold start across 2+ real devices |
| **Closed testing** | The 5-10 Phase 0 validation users (Ticket P0-01), if willing | Real-world daily use by people who aren't you, under realistic conditions (different phones, networks, timezones) | At least 3-5 testers use it for 5+ consecutive days; rollover/streak logic confirmed correct across at least 2 real timezones; at least one real Play Billing sandbox-to-production purchase completes cleanly |
| **Open testing** *(optional — skip if you want fewer hoops)* | Anyone with the opt-in link | Wider, lower-touch validation before full production | Not mandatory for a solo personal-project launch — use your judgment; skipping straight to staged production is acceptable if Closed testing went well |
| **Production — staged rollout** | Public Play Store | Real launch, with a safety valve | Advance 5% → 20% → 50% → 100%, each held for at least 24-48 hours, advancing only if rollback criteria (§2) are not triggered |

**Practical note for a solo dev:** don't over-engineer this. The meaningful gate is Internal → Closed (did real strangers use it without it breaking) and the staged percentage rollout on Production (a safety net, not a marketing strategy). Open testing is the most skippable stage if you want to move faster — Closed testing already gives you real, non-you usage data.

---

## 2. Rollback Criteria

Define these **before** launch, not while panicking during it. If any of these trigger during a staged rollout, **pause the rollout percentage immediately** (don't advance further) and assess before deciding whether to roll back the release entirely.

| Trigger | Threshold | Action |
|---|---|---|
| Crash rate | > 2% of sessions (visible in Play Console's pre-launch + production stats, or Sentry) | Halt rollout. Diagnose via Sentry. Hotfix and re-roll, or roll back to previous version if the fix isn't fast. |
| Free → Pro conversion | Tier flip fails for any sandbox-confirmed purchase (i.e., user paid, `users.tier` never updates) | **Treat as a P0 incident regardless of rollout %.** This is a billing-trust issue — halt rollout, fix the webhook, manually reconcile affected users (see `execution/06-RISKS.md` B.4 and the Support Runbook). |
| 1-star reviews mentioning data loss | Any review explicitly describing lost streaks, lost tasks, or lost project data | Halt rollout. Investigate whether it's the timezone/rollover edge case (`execution/06-RISKS.md` B.1/B.7) or something new. |
| RLS / data leak report | Any report (even informal, e.g. a tester DMs you) that one user can see another user's data | **Immediate halt + unpublish if confirmed.** This is the one class of bug worth a full unpublish — data isolation is non-negotiable, re-test against `operations/07-TEST-PLAN.md` §2 before re-releasing. |
| Supabase free-tier auto-pause mid-rollout | App goes fully unreachable for all users | Not a code rollback — this is the `execution/06-RISKS.md` B.2 risk materializing. Touch the project / check UptimeRobot. Consider this your trigger to evaluate moving to Supabase Pro if it happens more than once at real user volume. |

**What rollback does *not* mean here:** for most non-critical bugs (a misaligned button, a typo, a non-blocking UI glitch), the right move is "fix it in the next release," not halting the rollout. Reserve halts for the table above.

---

## 3. Pre-Launch Checklist (Production Stage Gate)

Carried forward and consolidated from `engineering/03-SECURITY.md` §7 and `execution/05-TICKETS.md` Phase 4 — do not advance to Production until every item is checked, regardless of how excited you are to ship:

- [ ] All RLS integration tests (`operations/07-TEST-PLAN.md` §2) pass with two real test accounts.
- [ ] E2E happy path (`operations/07-TEST-PLAN.md` §3) run successfully on a real device, not just emulator.
- [ ] Purchase flow QA (`operations/07-TEST-PLAN.md` §4) completed including the webhook-failure fallback case (PF-4).
- [ ] Play Store listing copy, screenshots (8), and feature graphic finalized (`P4-07`).
- [ ] Privacy Policy URL live and reachable (`P4-06`).
- [ ] Google Play **Data Safety form** completed accurately (what's collected: email, user-generated text, timezone — see `engineering/03-SECURITY.md` §4.1).
- [ ] **Account Deletion URL** live and functioning end-to-end (`P4-04`) — Google Play requires this be reachable even from outside the app for apps that support account creation.
- [ ] "Export my data" flow tested end-to-end (`P4-05`).
- [ ] Sentry capturing real events with PII scrubbing confirmed (`P4-03`).
- [ ] App tested on at least 2 different physical Android devices (`P4-09`).
- [ ] `.env` confirmed absent from git history (`engineering/03-SECURITY.md` §5).

---

## 4. Post-Launch Communications (Optional, Low-Pressure)

Source doc's original "Western Marketing Strategy" named Product Hunt, Hacker News, and freelance/indiehacker subreddits as channels. Treat this as optional and low-stakes for a first solo release — you don't owe yourself a big launch.

| Channel | Notes |
|---|---|
| Product Hunt | Decent for visibility; works best with a polished listing and a few days of advance "coming soon" teasing — skip if that prep time isn't worth it to you right now. |
| r/indiehackers, r/freelance | Lower-effort, more honest audience for this specific product. A simple "I built this, here's why, would love feedback" post tends to outperform a polished pitch. |
| Your own network (Habib classmates, ICPC/Codeforces circles, Karachi dev community) | Often the highest-quality first users — they'll actually tell you what's broken instead of just downloading and vanishing. |
| Attribution tracking | If you do post anywhere, note which channel drove installs (Play Console gives basic acquisition source data) — useful signal for where to spend effort next time, not required for launch itself. |

**The actual point of this section:** none of this is required to "launch." Publishing to Production at even 5% rollout with zero marketing is a completely legitimate, real launch. Marketing is a separate, optional follow-up — don't let it block shipping.

---

## 5. Versioning Convention

Simple semantic-ish scheme, since this is a solo project with no team coordination overhead to justify anything heavier:

- **v1.0.0** — first Production release (My Day + Our Space, full spec per `product/01-PRD.md`).
- **v1.0.x** — bug fixes only, no new features.
- **v1.1.0** — first post-launch feature release, pulling from the deferred list (`product/01-PRD.md` §8) based on real usage data from the KPI dashboard (`operations/09-ANALYTICS-PLAN.md`).
