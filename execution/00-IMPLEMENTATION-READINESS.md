# LeanSpace — Implementation Readiness Checklist

**Purpose:** Gate before writing feature code. Every item below should be checked (or explicitly deferred with a note) before Batch 1.2 (DDL + RLS).

**Companion docs:** `product/00-EXECUTIVE-SUMMARY.md`, `execution/12-BATCH-EXECUTION-PLAN.md`, `execution/06-RISKS.md`

---

## 1. Decisions You Must Lock (Phase 0)

These block schema, Play Console SKUs, or UI. Do not start Batch 1.2 until resolved.

| # | Decision | Default assumption | Status | Where to record |
|---|---|---|---|---|
| D1 | Pro collaborator cap (5–10 range) | **8** | ☐ | `execution/06-RISKS.md` A.1 |
| D2 | Pricing ($3.99/mo, $39.99/yr, $1 intro) | As spec'd | ☐ | `execution/06-RISKS.md` A.2 |
| D3 | Banner ad placement (My Day) | **Bottom**, above nav | ☐ | `execution/06-RISKS.md` A.3 |
| D4 | Project owner deletion behavior | CASCADE vs transfer | ☐ | `execution/06-RISKS.md` B.10 |
| D5 | Brand accent color | TBD Phase 4 | ☐ defer | `docs/wireframes/branding.md` |

---

## 2. Accounts & External Services

| # | Item | Status | Notes |
|---|---|---|---|
| A1 | Google Play Developer account ($25) | ☐ | Required before Phase 2 billing |
| A2 | Supabase cloud project | ☐ | Region chosen; keys in local `.env` only |
| A3 | Domain `leanspace.app` | ☐ | Needed for invite deeplinks (Phase 3) |
| A4 | Sentry project + DSN | ☐ defer to Phase 4 | |
| A5 | AdMob app + banner unit | ☐ defer to Phase 2 | |

---

## 3. Local Dev Environment

| # | Item | Status | How to verify |
|---|---|---|---|
| E1 | Flutter SDK (stable) | ☐ | `flutter doctor` |
| E2 | Android SDK (CLI, no Android Studio) | ☐ | `flutter doctor` — Android toolchain green |
| E3 | Physical Android device + USB debugging | ☐ | `adb devices` shows authorized device |
| E4 | Git repo initialized | ☐ | `.gitignore` includes `.env` |
| E5 | Flutter app boots on device | ☐ | `flutter run` from `leanspace/` |
| E6 | Supabase CLI | ☐ defer to Batch 1.6 | `supabase --version` |
| E7 | Node.js LTS | ☐ defer to Batch 1.6 | For Supabase CLI / Edge Functions |

---

## 4. Repo Structure (Expected)

```
LeanSpace/
├── 00-README.md                 ← planning index
├── product/                     ← what & why
├── engineering/                 ← how to build
├── execution/                   ← tickets, batches, risks
├── operations/                  ← test, release, analytics, support
├── source/                      ← original Word spec
├── docs/wireframes/             ← paper/Figma sketches (Phase 0)
├── leanspace/                   ← Flutter app (this is what you run)
├── supabase/                    ← migrations, Edge Functions
└── scripts/                     ← seed SQL, dev helpers
```

---

## 5. User Validation (Recommended, Not Blocking Code)

| # | Item | Status |
|---|---|---|
| V1 | Talk to 5–10 indie devs / freelancers | ☐ |
| V2 | Show wireframes; ask pricing + collaborator cap | ☐ |
| V3 | Capture verbatim quotes | ☐ |

Skip only if you accept building without external validation signal (document why in `execution/06-RISKS.md`).

---

## 6. Pre-Code Reading Order (Minimum)

1. `product/00-EXECUTIVE-SUMMARY.md` (5 min)
2. `product/01-PRD.md` (30 min)
3. `engineering/02-TRD.md` + `engineering/03-SECURITY.md` (45 min)
4. `execution/12-BATCH-EXECUTION-PLAN.md` (15 min)
5. Start **Batch 1.1** — app boots + placeholder routes

Do **not** read all 13 docs cover-to-cover before Batch 1.1. Read the rest as each batch requires them.

---

## 7. First Implementation Batches (Reminder)

| Batch | Goal | Start when |
|---|---|---|
| **1.1** | App boots, Supabase wired, placeholder routes | E1–E5 done |
| **1.2** | DDL + RLS + triggers | D1–D4 locked, Supabase project exists |
| **1.3** | Auth flows | 1.2 RLS tests pass |
| **1.4** | Habits end-to-end | 1.3 done |

Full sequence: `execution/12-BATCH-EXECUTION-PLAN.md`.

---

## 8. Definition of "Ready to Implement"

You are ready when:

- [ ] Flutter app runs on your physical phone (`leanspace/`)
- [ ] `.env` exists locally with Supabase URL + anon key (not committed)
- [ ] Decisions D1–D4 are written down (even if defaults accepted)
- [ ] You have read the executive summary, PRD, TRD, Security, and batch plan
- [ ] You know which batch you're on (should be **1.1** or **1.2**)

If all boxes above are checked, proceed to Batch 1.2. If not, finish setup first — **do not write business logic on an unverified foundation.**
