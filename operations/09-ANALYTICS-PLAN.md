# LeanSpace — Analytics & KPI Tracking Plan

**Scope:** How each of the four success metrics named in `product/01-PRD.md` §9 actually gets computed, where they live, and what you do when they cross a threshold.
**Source of truth:** `product/01-PRD.md` §9 (Success Metrics)
**Companion docs:** `engineering/02-TRD.md` (schema), `operations/08-RELEASE-PLAN.md`

---

## Assumptions Made

| # | Assumption | Why |
|---|---|---|
| AP1 | No third-party analytics SDK is used (confirmed by `engineering/03-SECURITY.md` §4.2 — "No third-party analytics SDKs in v1"). All KPIs are computed via **SQL views directly against the Supabase Postgres database.** | Keeps the privacy posture clean (no Firebase/Mixpanel/Amplitude) and avoids adding a new dependency for a solo dev. |
| AP2 | A single **Notion page (or even a plain markdown file you update by hand)** is sufficient as the "dashboard" for v1 — no Metabase/Grafana/BI tool setup. | Matches `00-README.md`'s recommendation directly; proportional to a pre-revenue, single-operator product. |
| AP3 | Review cadence is **weekly**, done by you, manually running the SQL views and recording the numbers. | No automation needed at this scale; weekly is frequent enough to catch trends without becoming a chore. |

---

## 1. The Four KPIs — Definitions & SQL

### 1.1 Day-1 Retention

**Definition:** Of users who signed up on day X, what % opened the app again on day X+1?

```sql
-- Day-1 retention for a given cohort date
WITH cohort AS (
  SELECT id, created_at::date AS signup_date
  FROM public.users
  WHERE created_at::date = '2026-07-01'  -- parameterize per run
),
returned AS (
  SELECT DISTINCT user_id
  FROM public.app_opens  -- see note below on tracking opens
  WHERE event_date = (SELECT signup_date FROM cohort LIMIT 1) + INTERVAL '1 day'
    AND user_id IN (SELECT id FROM cohort)
)
SELECT
  (SELECT COUNT(*) FROM cohort) AS cohort_size,
  (SELECT COUNT(*) FROM returned) AS returned_count,
  ROUND(100.0 * (SELECT COUNT(*) FROM returned) / NULLIF((SELECT COUNT(*) FROM cohort), 0), 1) AS d1_retention_pct;
```

> **Gap to close before this is usable:** the schema in `engineering/02-TRD.md` does not currently include an `app_opens` (or similar event-log) table. Without it, "did the user open the app" has to be proxied from existing data (e.g., a `todos` or `habits` row touched that day) — which undercounts users who opened the app but didn't interact. **Recommendation:** add a minimal `app_opens (user_id, opened_at)` table, written once per cold start client-side. This is a small addition (~S-sized ticket) but it's the only way to get a true retention number rather than an engagement proxy. Flagged as a new ticket in `execution/06-RISKS.md` update below.

### 1.2 Day-7 Retention

**Definition:** Of users who signed up on day X, what % opened the app on day X+7?

```sql
WITH cohort AS (
  SELECT id, created_at::date AS signup_date
  FROM public.users
  WHERE created_at::date = '2026-07-01'
),
returned AS (
  SELECT DISTINCT user_id
  FROM public.app_opens
  WHERE event_date = (SELECT signup_date FROM cohort LIMIT 1) + INTERVAL '7 days'
    AND user_id IN (SELECT id FROM cohort)
)
SELECT
  (SELECT COUNT(*) FROM cohort) AS cohort_size,
  (SELECT COUNT(*) FROM returned) AS returned_count,
  ROUND(100.0 * (SELECT COUNT(*) FROM returned) / NULLIF((SELECT COUNT(*) FROM cohort), 0), 1) AS d7_retention_pct;
```

Same `app_opens` dependency as §1.1.

### 1.3 Free → Pro Conversion Rate

**Definition:** Of all registered users, what % currently have `tier = 'pro'`?

```sql
SELECT
  COUNT(*) FILTER (WHERE tier = 'pro') AS pro_users,
  COUNT(*) AS total_users,
  ROUND(100.0 * COUNT(*) FILTER (WHERE tier = 'pro') / NULLIF(COUNT(*), 0), 2) AS conversion_pct
FROM public.users;
```

**Better cut — cohort conversion within N days of signup** (more honest than a point-in-time snapshot, since it accounts for how long users have had to convert):

```sql
SELECT
  created_at::date AS signup_date,
  COUNT(*) AS cohort_size,
  COUNT(*) FILTER (WHERE tier = 'pro') AS converted,
  ROUND(100.0 * COUNT(*) FILTER (WHERE tier = 'pro') / NULLIF(COUNT(*), 0), 2) AS conversion_pct
FROM public.users
WHERE created_at::date <= CURRENT_DATE - INTERVAL '14 days'  -- only count cohorts old enough to have had a fair chance
GROUP BY signup_date
ORDER BY signup_date;
```

This requires no schema changes — `users.tier` already exists.

### 1.4 Left Behind Re-Add Rate

**Definition:** Of all tasks stamped `missed`, what % were later re-added by the user (`is_carried_forward = true` on a subsequent row)?

```sql
WITH missed AS (
  SELECT COUNT(*) AS missed_count
  FROM public.todos
  WHERE status = 'missed'
),
readded AS (
  SELECT COUNT(*) AS readded_count
  FROM public.todos
  WHERE is_carried_forward = true
)
SELECT
  (SELECT missed_count FROM missed) AS total_missed,
  (SELECT readded_count FROM readded) AS total_readded,
  ROUND(100.0 * (SELECT readded_count FROM readded) / NULLIF((SELECT missed_count FROM missed), 0), 1) AS readd_rate_pct;
```

This requires no schema changes — both fields already exist per `engineering/02-TRD.md` / `engineering/03-SECURITY.md`.

---

## 2. Dashboard Format (v1 — Deliberately Low-Tech)

- Create the four SQL queries above as **Postgres views** in Supabase (`kpi_d1_retention`, `kpi_d7_retention`, `kpi_conversion`, `kpi_readd_rate`) so you can re-run them with a single `SELECT * FROM kpi_conversion;` rather than re-pasting SQL each week.
- Maintain a single **Notion page (or a `KPI-LOG.md` in the repo, your choice)** with one row per week:

| Week of | D1 Retention | D7 Retention | Conversion % | Left Behind Re-add % | Notes |
|---|---|---|---|---|---|
| 2026-07-01 | — | — | — | — | Pre-launch, no data yet |

- Fill this in by hand, weekly. No automation, no scheduled job — this is a 10-minute Monday-morning ritual, not infrastructure.

---

## 3. Review Cadence & Decision Thresholds

**Cadence:** Weekly, every Monday (or whatever day works), for as long as the app has active users. No need to check daily — these are trend metrics, not incident metrics (incident-level monitoring is covered by `operations/08-RELEASE-PLAN.md` §2 rollback criteria and the Support Runbook, not this doc).

**Decision thresholds — define these now, before the data exists, so you're not rationalizing in the moment:**

| Metric | Threshold | Action if crossed |
|---|---|---|
| D7 retention | < 15% after first 30 days of live data | Pause new feature work. Go talk to users (same playbook as Phase 0 validation calls) — find out *why* people aren't coming back before building more. |
| Free → Pro conversion | < 1% after first 60 days of live data with at least 100 signups | Revisit pricing (`A.2` in `execution/06-RISKS.md`) or revisit which tier-gates are actually felt as valuable — don't just drop the price reflexively, find out what's not landing first. |
| Left Behind re-add rate | Used as a *signal*, not a pass/fail gate | If very low (<5%), it may mean the mechanic is invisible or the nudge isn't compelling — revisit the UI copy/placement (`engineering/04-FRONTEND.md` §2.2 `LeftBehindNudge`). If very high (>60%), it may mean the 5-task cap is too aggressive for real usage patterns — revisit the cap itself. Either extreme is worth a look; there's no single "good" number here. |
| D1 retention | No hard threshold set for v1 — establish a baseline first | After 30 days of data, set a threshold relative to your own baseline rather than an arbitrary industry number, since this is a brand-new, unbenchmarked product. |

---

## 4. Required Schema Addition

This plan surfaced one real gap, worth carrying back into your build tickets rather than leaving buried in this doc:

**New table needed:** `app_opens (user_id UUID REFERENCES users(id), opened_at TIMESTAMPTZ, event_date DATE GENERATED ALWAYS AS (opened_at::date) STORED)`, written once per cold start. Without it, D1/D7 retention can only be proxied from feature-usage tables (habits/todos touched), which will undercount real opens. This is a small, S-sized addition — worth adding to Phase 1 (so the data exists from day one) rather than bolting on retroactively once you actually want to compute retention and realize you have no historical open data to compute it from.
