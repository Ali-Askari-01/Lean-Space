# LeanSpace — Executive Summary

**One-page overview for stakeholders, collaborators, or future-you before diving into the full spec.**

| | |
|---|---|
| **Product** | LeanSpace — personal discipline + lightweight team check-ins in one Android app |
| **Platform** | Flutter (Android first), Supabase backend |
| **Owner** | Ali Askari (solo developer) |
| **Status** | Pre-build complete — implementation starting |
| **Target launch** | ~12–15 weeks solo (Phases 0–5) |

---

## The Problem

Indie creators and small remote teams (2–5 people) juggle separate apps for personal habits/to-dos and team status updates. Enterprise tools (Jira, Asana) are overkill — expensive, bloated, and built for large orgs. The result: skipped personal tracking or redundant sync meetings.

## The Solution

LeanSpace bundles two experiences in one lightweight app:

1. **My Day** — A discipline-first personal system: hard-capped 5 daily tasks, habit tracker with streaks, and a "Left Behind" log for missed items.
2. **Our Space** — A 60-second async team feed: daily logs (Done / Blockers / Plan for Tomorrow) that replace standups.

**Differentiator vs habit apps:** team layer built in. **Differentiator vs project tools:** discipline-first framing with intentional limits (5 tasks/day, always).

## Target Users

- **Primary:** Solo freelancers and indie creators who want daily discipline tooling.
- **Secondary:** 2–5 person remote micro-teams who want async status without meetings.
- **Geography:** Global, English-only v1, USD pricing.

## Business Model

| Tier | Price | Key limits |
|---|---|---|
| **Free** | $0 (banner ads on My Day) | 3 habit slots, 7-day history, cannot create projects |
| **Pro** | $3.99/mo ($1 first month) or $39.99/yr | 5 habit slots, full history, create projects, up to 8 collaborators, no ads |

Conversion is driven by tier-gated history, extra habit slots, and project creation — not by raising the daily task cap (stays at 5 for everyone).

## Tech Stack (High Level)

```
Flutter app  →  Supabase (Auth + Postgres + Edge Functions)
              →  Google Play Billing (subscriptions)
              →  AdMob (Free tier banner)
              →  Sentry (crash reporting)
```

Server-side correctness is non-negotiable: RLS policies, DB triggers, and Edge Functions enforce caps and tier rules. The client is the friendly face.

## Build Phases (Summary)

| Phase | Focus | Outcome |
|---|---|---|
| **0** | Validation + accounts | Decisions locked, Supabase + Play accounts ready |
| **1** | My Day core | Habits, tasks, rollover, Left Behind — dogfoodable |
| **2** | Monetization | Play Billing, paywall, AdMob, tier gating |
| **3** | Our Space | Projects, invites, daily logs, feed |
| **4** | Polish + compliance | Privacy, deletion, export, store listing |
| **5** | Launch | Staged rollout, KPI monitoring |

Execute in **batches** per `execution/12-BATCH-EXECUTION-PLAN.md` — not raw ticket order.

## Success Metrics (v1)

| KPI | Why it matters |
|---|---|
| Day-1 retention | Daily-open habit forming |
| Day-7 retention | Core thesis validation |
| Free → Pro conversion | Monetization design works |
| Left Behind re-add rate | Carry-over mechanic is useful |

## Highest Risks

1. **Day-rollover / streak math** — timezone edge cases; server-side hourly cron.
2. **Play Billing webhook** — user pays but tier doesn't flip; manual reconciliation fallback required.
3. **RLS / data isolation** — any leak is a full stop; test with two accounts before every release.
4. **Solo timeline drift** — 59 tickets; cut Phase 4 polish before cutting v1 features.

## Explicitly Out of Scope (v1)

iOS, web, realtime sync, kanban boards, file attachments, multi-language, streak recovery purchases.

## Where to Go Next

| If you want to… | Read |
|---|---|
| Understand features in detail | `product/01-PRD.md` |
| See architecture + schema | `engineering/02-TRD.md` |
| Start building today | `execution/00-IMPLEMENTATION-READINESS.md` → `execution/12-BATCH-EXECUTION-PLAN.md` |
| Run the app locally | `leanspace/README.md` + `execution/11-DEV-SETUP.md` |

**Bottom line:** LeanSpace is a focused Android MVP for disciplined individuals and tiny teams — ship My Day first, monetize second, add Our Space third, polish and launch last. One paid stranger at $3.99 beats a hundred testers.
