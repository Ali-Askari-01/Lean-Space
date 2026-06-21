# LeanSpace — Risk & Open Questions Log

**Purpose:** Single living list of anything that could derail or compromise v1, plus the two explicit open items flagged in the source doc.
**Source of truth:** `source/LeanSpace_Product_Engineering_Doc.docx`
**Companion docs:** `product/01-PRD.md`, `engineering/02-TRD.md`, `engineering/03-SECURITY.md`, `engineering/04-FRONTEND.md`, `execution/05-TICKETS.md`.

Each item has: **What it is → Why it matters → Recommended resolution / next step.**

---

## Section A — Open Items Carried From the Source Doc

### A.1 Pro-tier collaborator cap not finalized
- **What:** Source doc lists Pro collaborator cap as "5–10" and explicitly flags it as open. PRD currently assumes **8** (Assumption A1).
- **Why it matters:** This number ships in the DB schema (`collaborator_cap` CHECK constraint, 2–8). Changing it later means a migration + UI tweak + Play Store re-screenshot.
- **Resolution / next step:** Decide during Phase 0 user-validation calls (Ticket P0-08). Ask 5–10 indie-team users what feels right. If decision is 10, change the CHECK constraint and PRD before P1-01 ships.

### A.2 Pricing reversal to $3.99/mo
- **What:** Doc currently lists $3.99/mo, $39.99/yr (with $1 first-month intro) but notes there was an original lower instinct that was reversed.
- **Why it matters:** Wrong price tanks conversion or, worse, anchors the product as too cheap to sustain. Hard to raise prices after launch.
- **Resolution / next step:** Validate with users in Phase 0 (Ticket P0-09). If users push back, consider $2.99/mo + $24.99/yr as fallback. Lock in BEFORE creating Play Console SKUs (Ticket P2-01) — SKU price can be edited but post-launch it's awkward.

### A.3 Banner ad placement (top vs bottom of My Day)
- **What:** Source doc explicitly defers this to Phase 1 wireframing.
- **Why it matters:** Bottom feels more "discreet" but competes with bottom nav. Top can disrupt the streak/header. Either is fine, but it should be intentional.
- **Resolution / next step:** Decide during P0-07 wireframing. Recommendation: **bottom**, just above the bottom nav, so it never sits next to the streak number (the emotional core of the screen).

---

## Section B — New Risks Identified During Planning

### B.1 Day-rollover correctness across timezones
- **What:** The rollover is scheduled hourly server-side (TRD §4) and relies on `users.timezone`. If timezone is stale (user travels and doesn't open the app), rollover may stamp `missed` against the wrong day.
- **Why it matters:** Streaks visibly break. The streak is the emotional core of the product — bugs here = churn.
- **Resolution:** (a) Update `users.timezone` on every app foreground. (b) Add a Phase 1 test matrix covering 3 timezones + DST transitions. (c) Document the behavior in the Privacy Policy / FAQ: "Days are based on the timezone of your last app launch."

### B.2 Supabase free-tier auto-pause after 7 days inactivity
- **What:** Already noted in TRD §7, but worth a risk callout: during pre-launch/Phase 0 testing, you may not open the app daily, and the project gets paused, breaking demos.
- **Why it matters:** Friction at exactly the moment you're pitching the app to validation users (A.1).
- **Resolution:** The hourly rollover Edge Function already keeps the DB warm. Until that ships in P1-11, set a calendar reminder to touch the project at least every 5 days, or use a free uptime monitor (UptimeRobot) hitting the Supabase REST endpoint.

### B.3 Solo-dev timeline drift
- **What:** Six-phase plan totals **59 tickets**; realistic solo throughput is 3–5 quality tickets/week. That's a 12–20 week calendar to launch, longer if dogfooding reveals scope expansion.
- **Why it matters:** Indie projects die from scope creep + burnout, not from technical impossibility.
- **Resolution:** (a) Treat Phase 0 as a hard 2-week timebox. (b) Refuse to add any v1 feature beyond the source doc — defer everything to a v1.1 backlog. (c) Set a "ship internal testing track by week 10" personal deadline; if missed, cut Phase 4 polish items, not v1 features.

### B.4 Play Billing webhook is a single point of failure for tier correctness
- **What:** TRD §6.1 makes `users.tier` flip dependent on the Play Billing RTDN webhook. If the webhook is misconfigured or temporarily down, a user pays and is stuck on Free.
- **Why it matters:** The first such complaint on Play Store = 1-star review.
- **Resolution:** (a) Have the client poll `users.tier` for ~5 seconds after a successful Play purchase callback, with a fallback "Activating Pro — this can take up to a minute" message. (b) Add a manual "I paid but I'm still Free" support form in Settings linking to your email; reconcile manually for the first 100 customers. (c) Sentry-alert any 5xx from the webhook Edge Function.

### B.5 Invite token leak / shared link via social media
- **What:** A single-use invite is fine, but the "first person who clicks wins" model means the intended invitee might lose their seat to a random clicker if the link is shared publicly.
- **Why it matters:** Edge case, but a confusing user-experience and a vector for project-cap exhaustion griefing.
- **Resolution:** (a) In the UI, show owners a per-recipient invite UX: "Copy a fresh link for each person." (b) Optionally, in v1.1, require the owner to enter the invitee's email and bind the JWT's `aud` claim to that email at generation time. **For v1, ship as-is** and watch for abuse.

### B.6 No iOS at v1 = TAM ceiling
- **What:** Source doc is explicit: Android only. But the target persona (indie creators, freelancers) skews iOS in some markets.
- **Why it matters:** Validation calls (A.1/A.2) may surface that 60% of would-be users are on iPhone.
- **Resolution:** Don't rebuild plans. But ASK during Phase 0 calls what device the user is on, and capture an "iOS waitlist" email list. If it crosses ~500 names by launch + 1 month, prioritize an iOS build using the same Flutter codebase (mostly a Play Billing → StoreKit2 swap).

### B.7 Streak math edge cases not all covered by spec
- **What:** Several edge cases need explicit decisions:
  - User adds 1 task at 11:55 PM, doesn't complete it by midnight — does that single missed task fail streak extension for "today"? Per spec yes — but UX could feel harsh.
  - User completes all 3 of today's tasks, then adds a 4th later in the same day and misses it — streak extension lost?
  - Habit completed at 11:58 PM local then opens the app at 00:02 — is `last_completed_date` "yesterday" already?
- **Why it matters:** A user who feels the app cheated them out of a streak quits.
- **Resolution:** (a) Document the rules in an in-app FAQ. (b) Add a Phase 1 ticket "Streak math edge-case test suite" if not already covered by P1-08/P1-12. (c) Consider a soft "Done for the day?" confirmation modal at the user's typical wind-down time (defer to v1.1 — don't expand scope now).

### B.8 No crash reporting in the source spec
- **What:** Source doc doesn't mention Sentry/Crashlytics. The TRD added Sentry (Assumption T5) but it's not free risk-free — it's a third-party dependency carrying its own privacy implications.
- **Why it matters:** Without crash reporting, you're flying blind once outside your own device.
- **Resolution:** Adopt Sentry as planned (Ticket P4-03), with PII scrubbing on. Disclose in Privacy Policy.

### B.9 Data export / account deletion required by Google Play but not in source doc
- **What:** Google Play Data Safety section requires both, and account deletion has been a mandatory disclosure since 2024.
- **Why it matters:** Submission can be rejected; it'll surprise a solo dev under time pressure.
- **Resolution:** Already added as Tickets P4-04 and P4-05. Don't drop them under pressure.

### B.10 Spec doesn't address what happens to a project when the owner deletes their account
- **What:** `ON DELETE CASCADE` from `users` → `projects` means deleting the owner blows away the project AND every collaborator's history.
- **Why it matters:** A team of 5 loses all their daily logs because the owner rage-quit.
- **Resolution:** Two options — pick before P4-04 ships:
  1. **Soft option (recommended for v1):** When the owner initiates deletion, show "Deleting your account will delete X projects affecting Y collaborators. Transfer ownership or proceed?" Implement an "Owner transfer" minimal flow: pick a member and reassign `owner_id`. Add as Ticket P4-04a if accepted.
  2. **Hard option:** Cascade-delete and call it documented behavior.

### B.11 Tier-gated history relies on client-side filter only
- **What:** SECURITY §6 notes that a Free user could theoretically bypass the 7-day history filter by hitting PostgREST without the `gte` clause. This is acceptable per the source doc's design.
- **Why it matters:** Low real-world risk (data is the user's own), but worth a watch.
- **Resolution:** Monitor. If abuse is observed or if a Pro feature becomes more sensitive, introduce a tier-aware SQL view. **No action in v1.**

---

## Section C — Status Summary

| ID | Item | Owner | Decision needed by |
|---|---|---|---|
| A.1 | Collaborator cap finalized | Ali | End of Phase 0 |
| A.2 | Pricing locked | Ali | End of Phase 0 (before P2-01) |
| A.3 | Ad placement | Ali | End of Phase 0 (wireframes) |
| B.1 | Timezone test matrix | Ali | Phase 1 |
| B.2 | Free-tier uptime mitigation | Ali | Phase 0 (low effort) |
| B.3 | Timeline / scope discipline | Ali | Ongoing |
| B.4 | Billing webhook fallback UX | Ali | Phase 2 |
| B.5 | Invite-link sharing UX | Ali | Phase 3 (ship-as-is acceptable) |
| B.6 | iOS waitlist tracking | Ali | Phase 0 (capture emails) |
| B.7 | Streak edge-case decisions | Ali | Phase 1 (before P1-12) |
| B.8 | Crash reporting | Ali | Phase 4 |
| B.9 | Data export / deletion | Ali | Phase 4 (Play submission gate) |
| B.10 | Owner-deletes-account behavior | Ali | Before P4-04 |
| B.11 | History bypass — monitor | Ali | Post-launch |
