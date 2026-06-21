# LeanSpace — Product Requirements Document (PRD)

**Working title:** LeanSpace
**Platform:** Flutter (Android first, via Google Play Store)
**Backend:** Supabase (Postgres + Auth + Storage)
**Owner:** Ali Askari (solo developer)
**Document date:** June 21, 2026
**Status:** Pre-build — specification locked, ready for Phase 0
**Source of truth:** `source/LeanSpace_Product_Engineering_Doc.docx`

---

## Assumptions Made

These are reasonable assumptions filled in where the source doc is silent. Flag for confirmation before Phase 1 build.

| # | Assumption | Why it was needed |
|---|------------|-------------------|
| A1 | Pro-tier collaborator cap fixed at **8** (midpoint of stated 5–10 range) | Source doc flags this as open question; PRD needs a concrete number for acceptance criteria. |
| A2 | "Today" boundary is the **device's local timezone** at the moment a task is created; rollover triggers at the device's local midnight | Source doc says "midnight, user's local time" but doesn't define what happens if the user travels timezones. Assume timezone is resolved per-day from the device. |
| A3 | First-month $1 offer is implemented as an **introductory price** on the monthly Play Billing SKU, not a separate SKU | Cleanest Play Billing pattern; source doc doesn't specify. |
| A4 | "Left Behind" log is **per-user and personal** (not shared with team) | Source doc places it under My Day. Tab separation implies private. |
| A5 | A user can be a **collaborator on multiple projects** simultaneously, but can only **own** projects if they are Pro (Free = own 1) | Source doc says Pro users create projects; Free tier matrix shows "1 project, 2 collaborators". Interpreted as ownership cap, not membership cap. |

---

## 1. Problem Statement

Indie creators, freelancers, and small teams (2–5 people) juggle separate apps for personal discipline (habits, daily to-dos) and lightweight team coordination (status updates). Enterprise tools like Jira or Asana are overkill — expensive, bloated, and built for large teams, not solo operators or micro-agencies. The result is either redundant sync status meetings or skipped personal tracking altogether.

## 2. Solution Summary

LeanSpace bundles two things into one lightweight Flutter app:

1. A **personal daily discipline system** — a hard-capped 5-task to-do list + 5-slot habit tracker, with a "Left Behind" log for missed items.
2. A **lightweight async team check-in feed** — "Our Space" — a 60-second read that replaces sync status meetings.

The differentiator versus plain habit trackers (e.g. "Don't Break the Chain") is the bundled team layer. The differentiator versus Asana/Jira is the discipline-first framing and the 5-task cap.

## 3. Target Users

- **Primary:** Solo freelancers and indie creators who want personal discipline tooling.
- **Secondary:** 2–5 person fully-remote micro-agencies / small teams who want async status updates without standups.
- **Geography:** Global, English-only at v1, USD pricing.

## 4. Goals & Non-Goals

### 4.1 Goals (v1)
- Ship an Android-only Flutter MVP that supports the full feature set in this document.
- Hit a credible free→Pro conversion mechanic via tier-gated history, habit slots, and project creation.
- Keep solo-dev maintainability paramount — every feature in v1 must be implementable by one person.

### 4.2 Non-Goals (v1)
- iOS, Web, PWA, or desktop builds.
- Realtime sync — pull-to-refresh is sufficient.
- Enterprise features (SSO, roles, permissions, audit logs).
- Multi-language support.

---

## 5. Feature Breakdown — Tab 1: My Day (Personal)

### 5.1 Daily To-Do List

**User story:**
> As a solo freelancer, I want a hard-capped 5-task daily to-do list, so that I am forced to prioritize and never overcommit.

**Behavior:**
- User can add up to 5 tasks per day. The 6th add is blocked with a clear UI message.
- Tasks belong to a specific calendar day (in the user's local timezone at creation time).
- Tasks are not auto-carried forward to the next day.
- At local midnight rollover, incomplete tasks are stamped `status = missed` and surface in the Left Behind log.

**Acceptance criteria:**
- [ ] Adding a 6th task on the same local day is rejected with the message "You've hit today's 5-task cap."
- [ ] A task created at 11:59 PM local time still belongs to that day; at 00:00 local time it rolls over.
- [ ] A task marked `done` before rollover stays `done` permanently.
- [ ] A task not marked `done` by rollover is stamped `missed` and no longer appears in today's list.
- [ ] Completed tasks contribute to that day's task-streak eligibility (see §5.4).

---

### 5.2 Habit Tracker

**User story:**
> As a user building daily habits, I want one-tap habit completion with streak counters, so that I get instant feedback and feel momentum.

**Behavior:**
- Up to 5 habit slots total in the data model; **Free tier sees 3 slots, Pro tier sees up to 5 (effectively "unlimited" within the v1 5-slot data ceiling)**.
- One tap marks today's habit complete. Tap again to undo (only on the same local day).
- Streak counter increments by 1 on first completion of a calendar day.
- Missing a day (no completion before local midnight) resets the streak to 0.

**Acceptance criteria:**
- [ ] Free users see exactly 3 habit slots; the 4th and 5th are visually shown as locked with an upgrade prompt.
- [ ] Pro users can use all 5 habit slots.
- [ ] Tapping a habit toggles its `last_completed_date` to today's local date.
- [ ] Streak resets to 0 if a user opens the app the next day with `last_completed_date` < (today − 1).
- [ ] No retroactive completion is allowed for prior days.

---

### 5.3 "Left Behind" Log

**User story:**
> As a user who missed yesterday's tasks, I want a gentle, dismissible nudge showing what I left behind, so that I can consciously decide whether to re-add or let it go.

**Behavior:**
- On app open, if any tasks from prior days have `status = missed`, show a dismissible nudge banner above the My Day list.
- Tapping the nudge expands a read-only list of missed items.
- User can manually re-add any missed item as a **new** task for today. Re-adding **consumes one of today's 5 slots**.
- Re-added tasks carry `is_carried_forward = true` for analytics; otherwise they behave identically.
- **Free tier:** Left Behind log shows last 7 days only (read-time filter, no data deletion).
- **Pro tier:** Full history.

**Acceptance criteria:**
- [ ] If 0 missed tasks exist in the visible window, no nudge is shown.
- [ ] Dismissing the nudge hides it for the current app session only; it returns on next launch if still applicable.
- [ ] Re-adding when 5 tasks already exist for today is blocked with the same cap message as a normal add.
- [ ] Re-added tasks have `is_carried_forward = true` in the DB.
- [ ] Free users querying older than 7 days return an empty result with no error.

---

### 5.4 Task Streak (implicit, supports My Day mechanics)

**User story:**
> As a disciplined user, I want my task-completion streak to extend only on days where I completed everything I committed to, so that the streak number genuinely reflects discipline.

**Behavior:**
- A day "counts" for the task streak only if all tasks created that day were marked `done` by rollover.
- Missed tasks do **not** retroactively break previous streak days — they simply fail to extend it on the current day.
- A day with 0 tasks created neither extends nor breaks the streak (it's a no-op).

**Acceptance criteria:**
- [ ] Streak extends only when `count(missed tasks for day) == 0 AND count(tasks for day) > 0`.
- [ ] Adding zero tasks on a given day leaves the previous streak intact.
- [ ] Streak value is computed deterministically from the `todos` table (no separate streak column needed at user level for tasks).

---

## 6. Feature Breakdown — Tab 2: Our Space (Team / Project)

### 6.1 Project Creation

**User story:**
> As a Pro user, I want to create a project space where my small team can post daily updates, so that we can stop doing sync standups.

**Behavior:**
- Only Pro users can **create** projects. Free users see Our Space in a locked/empty state with an upgrade CTA.
- A project has: name, owner (= creator), collaborator cap (derived from owner's tier), and an invite token.
- Free owner: 1 project, 2 collaborators max (including owner).
- Pro owner: multiple projects, up to **8 collaborators** per project (Assumption A1).

**Acceptance criteria:**
- [ ] A Free user tapping "Create Project" sees a paywall, not the creation form.
- [ ] A project's `collaborator_cap` is set from the owner's current tier at creation.
- [ ] If a Pro owner downgrades to Free with more than 2 collaborators, existing memberships are preserved but **no new joins** are allowed until they upgrade back (see §6.3 acceptance).

---

### 6.2 Daily Log (3 Prompts)

**User story:**
> As a project collaborator, I want to post a short daily log answering three prompts, so that my team knows my status without a meeting.

**Behavior:**
- Each daily log has three free-text fields: **Done Today**, **Blockers**, **Plan for Tomorrow**.
- One log per user per day per project. Subsequent edits the same day update the existing log.
- Logs are visible to all current members of the project.

**Acceptance criteria:**
- [ ] A user can save a daily log with any combination of the three fields filled (any field may be empty, but at least one must be non-empty).
- [ ] Saving twice the same day updates the existing row, not creates a new one.
- [ ] A user who is no longer a member of the project cannot read or write logs for that project.

---

### 6.3 Invite & Join Flow

**User story:**
> As a project owner, I want to send an invite link to a teammate, so that they can join my project without me typing their email.

**Behavior:**
- Owner generates a signed, single-use-per-recipient invite token tied to `project_id`.
- Recipient opens the link → if not signed in, prompted to sign up/sign in → on accept, added to `project_members` if cap allows.
- Token is consumed on successful redemption; same token cannot be reused by another user.
- If `collaborator_cap` would be exceeded, redemption fails with a clear error.

**Acceptance criteria:**
- [ ] Generating an invite produces a deeplinkable URL containing a signed token.
- [ ] A token, once successfully redeemed, returns a "this invite has been used" error on subsequent attempts.
- [ ] Attempting to join when project is at cap returns "this project is full" without leaking project details.
- [ ] Owner can revoke / regenerate a project's invite token at any time (regeneration invalidates the old one).

---

### 6.4 Feed View

**User story:**
> As a team member, I want a reverse-chronological feed of everyone's daily logs in a project, so that I can catch up in under 60 seconds.

**Behavior:**
- Reverse-chronological listing of all daily logs in the project.
- Pull-to-refresh updates the feed (no realtime).
- **Free tier:** 7-day history window.
- **Pro tier:** Full history.

**Acceptance criteria:**
- [ ] Feed renders newest-first.
- [ ] Free user querying older than 7 days gets no rows, no error.
- [ ] Pull-to-refresh re-fetches and re-renders in <2s on a typical network.

---

## 7. Free vs Pro Tier Matrix

| Capability | Free | Pro |
|---|---|---|
| Daily tasks | 5/day (hard cap) | 5/day (same cap — discipline-first design) |
| Habit slots | 3 | 5 ("unlimited" within v1 ceiling) |
| Left Behind history | Last 7 days | Full |
| Our Space feed history | Last 7 days | Full |
| Project ownership | 0 (cannot create) — *see note* | Yes |
| Projects owned | — | Multiple |
| Collaborators per project | 2 (legacy/edge case if downgraded) | 8 (Assumption A1, range was 5–10) |
| Banner ads on My Day | Yes (banner only, no interstitials) | No |
| Pricing | $0, ad-supported | $3.99/mo ($1 first month) or $39.99/yr |

> **Note on "Free projects = 1":** Source doc lists "1 project, 2 collaborators" under Free. Interpretation: a Free user **cannot create** new projects (creation is Pro-gated), but a Free user who previously created a project as Pro and then downgraded retains 1 project / 2 collaborators of legacy access. This is also the cap a Free user would have if we ever relaxed the create-gate in future.

---

## 8. Out-of-Scope / Deferred (carried verbatim from source §2.3)

Deliberately deferred from v1:

- **Realtime sync / live updates** on the Our Space feed — pull-to-refresh is sufficient for a 3-line daily log; true realtime adds complexity with no v1 payoff.
- **Project boards / kanban view.**
- **"Streak recovery" mechanic** (retroactively healing a streak by completing a Left Behind item within 48 hours) — good v2 retention idea, adds real complexity to streak calculation, defer.
- **File attachments, comments, or reactions** on daily logs.
- **Web/PWA version** — Flutter mobile only for v1.

Additional explicit non-goals:
- iOS build at v1.
- Multi-language support.
- Streak repair purchases or any "freemium consumable" pattern.

---

## 9. Success Metrics (v1)

| Metric | Target / Why it matters |
|---|---|
| Day-1 retention | Validates the My Day daily-open habit. |
| Day-7 retention | Validates habit-stickiness, the core thesis. |
| Free → Pro conversion rate | Validates the monetization design. |
| Left Behind re-add rate | Proxy for whether the carry-over mechanic is being used as intended. |

---

## 10. Open Questions Carried Forward

1. **Pro-tier collaborator cap** — assumed 8; needs final confirmation. (See Risk Log doc.)
2. **Pricing reversal to $3.99/mo** — needs final confirmation against the original lower instinct. (See Risk Log doc.)
3. **Banner ad placement** — top vs bottom of My Day, to be decided during Phase 1 wireframing.
