# LeanSpace — Dev Setup, Environment & Git Conventions

**Scope:** What to install, how to run a local dev loop without Android Studio, how to test Edge Functions and the rollover logic before they're live, and the minimal git discipline to follow as a solo dev working with AI coding agents.
**Source of truth:** N/A (this doc didn't exist in the source spec — written to close a gap identified during planning review)
**Companion docs:** `execution/05-TICKETS.md` (P0-02–P0-05), `operations/07-TEST-PLAN.md` §1.3 (rollover test cases)

---

## Assumptions Made

| # | Assumption | Why |
|---|---|---|
| DS1 | You're using **Cursor (or VS Code) + the Flutter CLI**, not Android Studio as an IDE. | Stated directly. |
| DS2 | You still need the **Android SDK command-line tools, platform-tools (`adb`), and either an emulator or a physical Android device** — these are separate from the Android Studio *application* and are required for `flutter run` / `flutter build` to work at all. | Flutter's Android toolchain depends on the SDK, not on any particular editor. This is the single most common point of confusion when skipping Android Studio. |
| DS3 | Edge Functions are developed and tested using the **Supabase CLI**, not exclusively the web dashboard. | The dashboard has no way to simulate "advance time and trigger rollover" — local CLI + scripted SQL is the only practical way to test `operations/07-TEST-PLAN.md` §1.3. |
| DS4 | A single physical Android device (your own phone) is sufficient for Batch 1–6 development; a second device is only needed at Phase 4 (`P4-09` already requires 2+ devices). | Avoids over-engineering emulator setup if a real device is available and faster to iterate on. |

---

## 1. What to Install — One-Time Setup

Run through this once, top to bottom, before Batch 1.

### 1.1 Core toolchain

| Tool | Why | Notes |
|---|---|---|
| **Java 17 (OpenJDK)** | Required by Android SDK `sdkmanager` and Gradle builds | `winget install Microsoft.OpenJDK.17 --source winget` |
| **Flutter SDK** | The app itself | Use the stable channel. Verify with `flutter doctor` after install — this command is your single source of truth for "what's missing." |
| **Dart SDK** | Comes bundled with Flutter | No separate install needed. |
| **Android SDK command-line tools + platform-tools** | Required to build/run on Android, even without Android Studio | Installable standalone via Google's command-line tools package, or via `sdkmanager`. `flutter doctor --android-licenses` must be run and accepted at least once. |
| **A way to run the app** | Either an Android emulator (via `avdmanager`, no Android Studio GUI required) **or** a physical Android device with USB debugging enabled | A physical device is usually faster and avoids emulator setup friction entirely — recommended given DS4. |
| **Cursor or VS Code** + Flutter/Dart extensions | Your actual editor | Already your stated choice. |
| **Git** | Version control | Almost certainly already installed; confirm with `git --version`. |
| **Node.js** (LTS) | Required to run/develop Supabase Edge Functions locally | Edge Functions are Deno-based at runtime, but the Supabase CLI itself and many local tooling scripts assume Node is present. |
| **Supabase CLI** | Local Edge Function development, migrations, and local Postgres for testing | Install via npm or the standalone binary — check current install instructions, this changes over time. |
| **Docker** (or compatible, e.g. Colima/Podman) | Required by the Supabase CLI to spin up a local Postgres + GoTrue + Edge Functions stack | Only needed if you want true local-first development (recommended for Batch 2/6 testing — see §3). |

### 1.2 Verify before writing any app code

```bash
flutter doctor -v
```

Do not proceed to Batch 1 until this shows no blocking issues for Android. Warnings about iOS/Xcode are irrelevant and can be ignored (Android-only per `product/01-PRD.md` §4.2).

```bash
adb devices
```

Confirms your physical device (or emulator) is visible and authorized.

```bash
supabase --version
```

Confirms the CLI is installed before Batch 2.

---

## 2. Project Connection — Cloud Supabase, Not Fully Local (Recommended Default)

For most of the build, the simplest path is: **develop against your real cloud Supabase project directly**, not a local Docker stack. Reasons:

- You already need the cloud project for Play Billing webhook testing later (webhooks can't reach a laptop behind NAT without extra tunneling setup).
- One less moving part for a solo dev — local Supabase via Docker is genuinely useful but adds real setup overhead (`supabase start`, container management) that isn't worth it for Batches 1–5.
- Free tier is generous enough that "develop against production" is fine pre-launch — there are no real users yet to disturb.

**When local Supabase (Docker) genuinely earns its keep:** Batch 6 (rollover testing), where you need to manipulate "now" freely without touching real data, and Edge Function iteration, where redeploying to cloud on every code change is slow. Use `supabase start` locally specifically for that batch, then deploy the finished function to your real cloud project once it's correct.

---

## 3. Testing the Rollover Function Without Waiting for Midnight

This was flagged as an open gap — here's the concrete mechanism, closing it.

**Recommended approach: a manually-invokable test version of the rollover logic, separate from the scheduled production trigger.**

1. Write the core rollover logic as a **plain SQL function** (`perform_rollover(target_date date)`), not hardcoded to "today." The hourly cron Edge Function (`P1-11`) simply calls `perform_rollover(CURRENT_DATE)` on its schedule.
2. For testing, you call `SELECT perform_rollover('2026-07-03');` directly via `psql`, the Supabase SQL editor, or a local script — passing whatever date you want to simulate, against hand-seeded test data with known `original_date` values.
3. This sidesteps the entire "fake the system clock" problem. You're not pretending time has passed — you're directly testing "given this date as input, does the function correctly stamp the right rows as `missed`."
4. For the timezone-specific cases (T-R2, T-R3 in `operations/07-TEST-PLAN.md`), seed test users with different `users.timezone` values and confirm the function only touches rows where that user's local date has actually advanced past the task's `original_date`.

This is a small but important design choice: **keep the "what date is it" decision outside the rollover function**, passed in as a parameter. It makes the function trivially testable and is also just better engineering — don't let the cron schedule and the business logic be the same piece of code.

---

## 4. Local Test Data Seeding

For both RLS testing (`operations/07-TEST-PLAN.md` §2) and rollover testing (§1.3), you need repeatable, known test accounts — not your own real account.

- Create **two dedicated Supabase test users** early (e.g., `test-a@leanspace.dev`, `test-b@leanspace.dev`) and keep their credentials in a local, gitignored notes file — never in the repo, never in a doc.
- Write a simple **seed SQL script** (`scripts/seed_test_data.sql`, committed to the repo since it contains no secrets, only structure) that inserts known `todos`/`habits`/`projects` rows for these two test users, so every RLS/rollover test run starts from the same known state instead of whatever's left over from your last manual click-through.
- Re-run the seed script (after a `TRUNCATE` or `DELETE` of test-user rows) before each formal test pass, so results are reproducible.

---

## 5. Git & Branching Conventions

Minimal, solo-dev-appropriate — not borrowed wholesale from a team workflow you don't need.

- **`main` is always in a runnable state.** Never commit code to `main` that doesn't at least build.
- Work in **short-lived feature branches** named after the ticket: `feature/p1-07-habit-tracker`, `feature/p1-11-rollover`. Merge to `main` when a batch (not necessarily a single ticket) is genuinely working, per the batching plan already laid out.
- **Commit `.env.example`, never `.env`.** Confirm `.env` is in `.gitignore` *before* your first commit, not after — easy to forget and then have to scrub history later (`engineering/03-SECURITY.md` §5 already calls this out as a pre-launch checklist item; catching it on day one avoids needing that cleanup at all).
- Commit messages: doesn't need to be elaborate — `P1-07: habit CRUD + streak toggle` (ticket ID + short description) is enough to keep history scannable later when you're trying to find when something changed.
- Tag the Batch 7 milestone (`P1-14`, the installable personal-discipline-app checkpoint) with a git tag, e.g. `v0.1-mydaymvp` — gives you a clean rollback point if Phase 2/3 work goes sideways.

---

## 6. Daily Dev Loop (Once Setup Is Done)

A simple, repeatable loop for actual build days:

1. `flutter run` against your connected physical device — hot reload for UI/logic iteration.
2. For any Edge Function or DB change: edit locally, test via `supabase functions serve` (if using local stack) or deploy directly to your cloud project's dev environment and test against it (if working cloud-first per §2).
3. Before merging a batch to `main`: run the relevant section of `operations/07-TEST-PLAN.md` for whatever you just built — don't defer all testing to "later," test each batch as you close it out, per the batching plan.
4. Commit, tag if it's a milestone batch, move to the next batch.

---

## 7. What's Deliberately Skipped for v1

Stated plainly so it isn't mistaken for an oversight:

- No CI/CD pipeline (GitHub Actions, etc.) — manual `flutter build` and manual Play Console upload is fine at this scale, per `operations/07-TEST-PLAN.md` §6.
- No automated local Supabase stack as the *default* dev mode — only spun up for the specific cases in §2 where it earns its overhead.
- No multi-developer workflow considerations (PR review, protected branches) — irrelevant for a team of one.
