# LeanSpace — Support & Operations Runbook

**Scope:** A one-page-in-spirit reference for you, post-launch — what breaks, where to look, and how to fix it without re-deriving the answer from scratch under stress.
**Source of truth:** `execution/06-RISKS.md`, `engineering/03-SECURITY.md`
**Companion docs:** `operations/08-RELEASE-PLAN.md` §2 (rollback criteria)

---

## Assumptions Made

| # | Assumption | Why |
|---|---|---|
| SR1 | You are the sole support channel (no support team, no ticketing system) — issues arrive via Play Store reviews, a support email, or an in-app "Settings" contact link. | Solo-dev reality; matches `00-README.md`'s "you, post-launch" framing. |
| SR2 | The 15 min/day check cadence applies for the **first 2 weeks post-launch only**; afterward, fold into the weekly KPI review (`operations/09-ANALYTICS-PLAN.md`) unless an active incident is happening. | Avoids an indefinite daily-ops burden for a solo dev who also has coursework. |

---

## 1. Daily Check Cadence (First 2 Weeks Post-Launch)

A 15-minute routine, ideally same time each day:

1. **Play Console → Reviews** — any new reviews? Read them. 1-star reviews mentioning data loss or broken purchases get triaged immediately, not at the next daily check (see `operations/08-RELEASE-PLAN.md` §2).
2. **Sentry dashboard** — any new crash groups? Sort by frequency, not recency — a crash hitting 1 user repeatedly matters more than 5 different one-off crashes.
3. **Supabase logs** (Database → Logs, and Edge Functions → Logs) — any error spikes, especially on `rollover-cron` or `play-billing-webhook`.
4. **AdMob console** — just a glance; impressions/revenue not expected to mean much yet, mainly confirming ads are actually serving.

After week 2, drop to the weekly cadence unless something's actively on fire.

---

## 2. Where to Find What

| Need | Location |
|---|---|
| Crash reports / stack traces | Sentry dashboard (DSN configured per `engineering/03-SECURITY.md` §5) |
| Database errors, slow queries, RLS denials | Supabase Dashboard → Logs → Postgres Logs |
| Edge Function execution logs (`rollover-cron`, `play-billing-webhook`, `generate-invite`, `invite-redeem`) | Supabase Dashboard → Edge Functions → [function name] → Logs |
| Subscription status, payment disputes/refunds | Google Play Console → Monetization → Subscriptions |
| Billing webhook delivery history (RTDN) | Google Play Console → Monetization setup → Real-time developer notifications, or Google Cloud Pub/Sub console if you need raw delivery logs |
| User reviews | Play Console → Ratings and reviews |
| Ad performance | AdMob console |
| Raw user data lookup (for support requests) | Supabase Table Editor — direct read access; use the `service_role`-equivalent dashboard access, never expose this to the client |

---

## 3. Common Issues & Resolution Playbooks

### 3.1 "I paid but I'm still on Free"

This is the single most likely real-world support request — `execution/06-RISKS.md` B.4 already flagged this as the top billing risk. Playbook:

1. Ask the user for their Play Store purchase email/receipt (or order ID, visible in their Play Store → Order history).
2. Cross-check in **Play Console → Monetization → Subscriptions** that the purchase is real and active.
3. Cross-check **Supabase `users` table** for that user's `tier` value.
4. If Play Console shows active but `users.tier` is still `'free'`: the webhook didn't fire or failed. Check Edge Function logs for `play-billing-webhook` around the purchase timestamp for the error.
5. **Manual reconciliation (acceptable for the first ~100 customers per `execution/06-RISKS.md` B.4):**
   ```sql
   UPDATE public.users
   SET tier = 'pro', pro_until = '<expiry from Play Console>'
   WHERE id = '<user's UUID>';
   ```
6. Reply to the user, apologize for the delay, confirm it's fixed.
7. **If this happens more than 2-3 times,** stop treating it as a one-off — go fix the webhook reliability itself (check RTDN delivery retry settings, confirm the Pub/Sub subscription is healthy) rather than continuing to patch it manually forever.

### 3.2 "My streak disappeared / is wrong"

1. Ask for their account email and roughly when they noticed it.
2. Pull their `todos` rows for the relevant date range from Supabase Table Editor, ordered by `original_date`.
3. Manually walk the streak logic (per `product/01-PRD.md` §5.4): was there a `missed` task on a day they thought they completed everything?
4. Most likely causes, in order of probability: (a) a genuine missed task they forgot about, (b) a timezone edge case per `execution/06-RISKS.md` B.1 (check their `users.timezone` value against where they actually were), (c) an actual bug in the rollover function.
5. If (a) or (b): explain clearly and kindly — this is working as designed, even if it doesn't feel good to the user. Consider whether their case reveals a UX gap worth addressing (see `execution/06-RISKS.md` B.7) rather than just closing the ticket.
6. If (c): this is a P0 — pause rollout per `operations/08-RELEASE-PLAN.md` §2 and fix the underlying function, don't just patch their individual row.

### 3.3 "I can't join a project / invite link doesn't work"

1. Ask for the exact error message shown (per `engineering/04-FRONTEND.md` §2.6, errors are mapped to specific strings: `already_used`, `expired`, `project_full`, `revoked`).
2. The message itself tells you the cause — no DB digging needed for the common cases.
3. If `project_full`: confirm with the project owner whether they want to upgrade or remove an inactive member.
4. If `revoked`: the owner likely regenerated the link — ask the owner to send the new one.
5. If the user reports a *different* behavior than any of the four mapped errors, that's a real bug — check `invite-redeem` Edge Function logs for that `jti`.

### 3.4 App is unreachable for everyone

1. First check: has the Supabase free-tier project auto-paused (`execution/06-RISKS.md` B.2)? Check Supabase Dashboard — a paused project shows clearly in the project list.
2. If paused: unpause manually from the dashboard. Takes effect within a minute or two.
3. If not paused: check Supabase status page for a platform-wide incident before assuming it's your code.
4. If you've outgrown the free tier's actual usage limits (not just the inactivity auto-pause), this is your signal to evaluate Supabase Pro (~$25/mo) — referenced as the natural next step in the original cost analysis.

### 3.5 Negative review citing a bug you can't reproduce

1. Reply publicly and politely, ask them to email support with their account email and device model — don't ask for this in the public review reply if it risks looking defensive; keep the public reply short and warm, take details to email.
2. If they don't respond, leave it — don't over-invest chasing a single unreproducible report. Note it in your weekly KPI log as a flagged item and move on; revisit if a pattern emerges.

---

## 4. Escalation — When to Stop and Fix vs. Patch and Move On

A simple rule to avoid both extremes (panicking over every report, and ignoring real patterns):

- **One-off, explainable by design (e.g., a genuine missed task):** explain to the user, move on.
- **One-off, genuinely a bug, low blast radius (affects 1 user):** manual fix for that user (like §3.1 step 5), log it, fix the root cause when you next touch that area of code — doesn't need to interrupt whatever you're currently building.
- **Pattern (2-3+ reports of the same thing):** stop what you're doing, fix the root cause now. This is what separates a healthy solo project from one that slowly accumulates manual workarounds nobody ever circles back to fix.
- **Data isolation / security issue, even a single report:** drop everything, see `operations/08-RELEASE-PLAN.md` §2 — this is the one category that's always urgent regardless of how isolated it seems.

---

## 5. Support Contact Surface

- In-app: Settings → "Support email" link (per `engineering/04-FRONTEND.md` §2.8), opens the device's mail client pre-addressed.
- Public: Play Store listing should also list a support email (required by Play Console anyway).
- No live chat, no ticketing system, no SLA promises in v1 — set expectations accordingly in any auto-reply or FAQ copy ("we typically respond within 2-3 days" is honest and sustainable for a solo dev still in school).
