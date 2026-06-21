# LeanSpace — Frontend Specification

**Platform:** Flutter, Android-first (Android 8+ / API 26+ recommended)
**State management:** Riverpod (justification below)
**Source of truth:** `source/LeanSpace_Product_Engineering_Doc.docx` §2, §5
**Companion docs:** `product/01-PRD.md`, `engineering/02-TRD.md`

---

## Assumptions Made

| # | Assumption | Why |
|---|---|---|
| F1 | **Riverpod** is the state management library. | Solo-dev maintainability + first-class async (Supabase queries are all `Future`/`Stream`). See §3. |
| F2 | **`go_router`** is used for navigation (incl. deeplinks for invites). | Official Flutter team recommendation; required for `https://leanspace.app/invite?t=…` deeplink handling. |
| F3 | **Material 3** theming with a single accent color (TBD with branding). | Default Flutter direction; minimal custom design surface for solo dev. |
| F4 | Phone-first portrait; tablet usable but not specifically optimized. | Source doc doesn't mention tablets. |
| F5 | Bottom nav (2 tabs: My Day, Our Space) with Settings reachable from an icon in the top app bar of each tab. | Standard pattern; matches the "lead with My Day" UX directive. |

---

## 1. Navigation Structure

```
RootShell (with bottom nav)
├── [Tab 1] My Day              ──> /my-day
│            ├── (modal) AddTaskSheet
│            ├── (modal) AddHabitSheet
│            └── (modal) LeftBehindExpandedSheet
├── [Tab 2] Our Space           ──> /our-space
│            ├── (full screen) CreateProjectScreen        ──> /our-space/create  (Pro only)
│            ├── (full screen) ProjectFeedScreen          ──> /our-space/:projectId
│            │       ├── (modal) DailyLogEditorSheet
│            │       └── (full screen) ProjectSettingsScreen ──> /our-space/:projectId/settings (owner only)
│            └── (full screen) JoinByLinkScreen           ──> /invite?t=<jwt>   (deeplink)
└── (full screen) SettingsScreen                          ──> /settings
                ├── PaywallScreen                          ──> /paywall          (full screen, modal)
                ├── AccountDeleteScreen                    ──> /settings/delete
                └── DataExportScreen                       ──> /settings/export

Pre-auth:
└── AuthScreen (signup/signin tabs)                       ──> /auth
```

**Modal vs full-screen rules:**
- Quick inputs (add task, add habit, write daily log) → **bottom sheet modal**.
- Multi-step or destination-y flows (create project, paywall, settings, delete) → **full screen**.

---

## 2. Screen-by-Screen Breakdown

### 2.1 Auth Screen (`/auth`)

**Purpose:** Sign up or sign in. Shown when no Supabase session exists.

**Components:**
- `AppLogoHeader` (small)
- `AuthTabs` — Sign In / Sign Up
- `EmailField`, `PasswordField`, `SubmitButton`
- `GoogleSignInButton`
- `ForgotPasswordLink`

**States:**
| State | UI |
|---|---|
| Idle | Form ready |
| Loading | Submit button → spinner, fields disabled |
| Error | Inline red error under form ("Wrong password", "Email already used") |
| Email-verification-required | "Check your inbox" empty state with a resend button |

---

### 2.2 My Day (`/my-day`)

**Purpose:** The personal discipline tab. The home screen.

**Layout (top to bottom):**
1. `TopAppBar` — title "My Day", trailing settings icon, leading streak badge ("🔥 4-day streak").
2. `LeftBehindNudge` (conditional) — dismissible banner; tap → opens `LeftBehindExpandedSheet`.
3. `HabitRow` — horizontal scrollable row of 5 habit slots (3 visible + 2 locked-with-padlock for Free).
4. `DailyTaskListSection`:
   - Section header "Today (X/5)"
   - `TaskListItem` × N (N ≤ 5)
   - `AddTaskButton` (disabled at N = 5, with cap message)
5. `AdBanner` (Free tier only; placement top/bottom TBD Phase 1 — Risk Log open question).

**Components:**
- `HabitTile` (single slot — name, ✓ button, streak badge, lock icon if Free + slot ≥ 3)
- `TaskListItem` (checkbox + text; long-press → delete)
- `LeftBehindNudge` (one-liner + chevron + dismiss button)
- `LeftBehindExpandedSheet` (list of missed tasks, each with a "Re-add" button)
- `AddTaskSheet` (single TextField + Save button)

**States:**
| State | UI |
|---|---|
| Empty (new user) | Habits show 3 empty slots with placeholder "Tap to add habit". Task list shows illustration + "Add your first task today". |
| Loading initial fetch | Skeleton shimmer on habit row and task list (don't show a spinner — looks slow). |
| Loaded with tasks | As above. |
| Cap reached (5 tasks) | Add button greyed with text "5/5 — finish a task to add another". |
| Error fetching | Top inline `MaterialBanner` with "Couldn't load. Retry" button. |
| Offline | Offline banner at top; reads served from local cache, writes queued (basic, see §5). |

---

### 2.3 Our Space — Empty State (`/our-space`, no projects)

**Purpose:** Onboarding-style state for users who aren't in any project yet.

**Layout:**
- Centered hero illustration.
- Headline: "Replace standups with a 60-second read."
- Two CTAs:
  - **"Create a project"** — taps to `/our-space/create`. For Free users, this goes to `/paywall` first.
  - **"Join with a link"** — opens a paste-URL dialog (alternative to deeplink).

**Components:** `EmptyStateIllustration`, `PrimaryCta`, `SecondaryCta`.

**States:** Empty (default), Loading user's membership list, Error.

---

### 2.4 Our Space — Active Feed (`/our-space/:projectId`)

**Purpose:** Reverse-chronological feed of daily logs for one project.

**Layout:**
1. `TopAppBar` — project name as title, settings gear (visible to owner only).
2. `ProjectSwitcherChip` — if user is in multiple projects, lets them swap.
3. `WriteTodayLogButton` (sticky bottom OR top, TBD) — opens `DailyLogEditorSheet`.
4. `FeedList` — reverse-chronological list of `DailyLogCard`s.

**Components:**
- `DailyLogCard` — avatar/email, date, three sections (Done / Blockers / Plan) each with an icon.
- `DailyLogEditorSheet` — three multi-line TextFields with prompt labels; Save button (disabled until ≥1 field is non-empty).
- `ProjectMemberList` (in settings) — list with kick (owner only).

**States:**
| State | UI |
|---|---|
| Empty (project just created, no logs yet) | Illustration + "Write the first log to break the ice". |
| Loaded feed | Cards list. |
| Loading more | Pagination spinner at bottom (if implemented; v1 may load all-at-once within history window). |
| Refreshing | Pull-to-refresh indicator. |
| Free user hitting the 7-day boundary | Last card shows a footer banner: "Older logs are Pro. Upgrade to see history." Tappable → `/paywall`. |
| Error | Snackbar + retry button. |

---

### 2.5 Project Creation (`/our-space/create`)

**Purpose:** Pro user creates a new project.

**Components:**
- `TextField` for project name (1–60 chars).
- Info row showing collaborator cap (read-only, 8).
- Create button.
- On success → push `/our-space/:newProjectId` AND show the invite link in a copy-able dialog.

**States:** Idle, Loading, Error (validation, network).

---

### 2.6 Invite / Join Flow (`/invite?t=<jwt>`)

**Purpose:** Handle the deeplink when a user taps an invite URL.

**Behavior:**
- If not signed in → push `/auth`, then return here.
- Validate token format client-side (decode without verify just to peek at `project_id` — verification happens server-side at redemption).
- Show: "You're invited to join **<ProjectName>**. Join project?" with Accept / Cancel.
- Accept → call `invite-redeem` Edge Function → on success, push `/our-space/:projectId`.

**Error states:**
| Server response | UI |
|---|---|
| `already_used` | "This invite has already been used. Ask the owner for a new link." |
| `expired` | "This invite has expired." |
| `project_full` | "This project is full." |
| `revoked` | "This invite is no longer valid." |
| Network error | Retry button. |

---

### 2.7 Paywall (`/paywall`)

**Purpose:** Convert Free to Pro.

**Layout:**
- Hero "Go Pro" + three value bullets: "Unlimited habit slots", "Full history", "Create team projects".
- Two plan buttons:
  - **Monthly $3.99** (with badge "$1 first month")
  - **Annual $39.99** (with badge "Save 17%")
- "Maybe later" close button.
- Fine print: "Manage subscription in Google Play. Cancel anytime."

**States:** Idle, Loading (Play sheet up), Success (purchase confirmed), Failure (Play returned non-success).

> **Note:** Tier flips to Pro only after the Play Billing webhook confirms server-side. Show "Activating Pro…" until `users.tier == 'pro'` after a short poll (~5s).

---

### 2.8 Settings (`/settings`)

**Sections:**
- Account: email, tier badge, "Manage subscription" (deeplinks to Play), "Sign out".
- Data: "Export my data", "Delete my account".
- About: version, Privacy Policy link, Terms link, Support email.

**States:** Idle, Loading (during export/delete), Confirmation dialogs for destructive actions.

---

## 3. State Management — Riverpod, Justified

**Pick: Riverpod.**

**Why for a solo dev on this app:**
- **Async-first:** Supabase calls return `Future`/`Stream`; `FutureProvider`/`StreamProvider` map 1:1 with zero boilerplate.
- **No `BuildContext`-coupled access:** providers are accessible from anywhere (notification handlers, deeplink router, etc.).
- **Code-gen variant (`riverpod_generator`)** removes provider-declaration boilerplate.
- **Single library, simple mental model** — easier than Bloc (events + states + classes per feature is heavy for a one-person team).
- **Provider** (the original) is fine but Riverpod is its newer, type-safer successor by the same author.

**Provider layout sketch:**
```
auth_providers.dart     ─ authStateProvider, currentUserProvider, tierProvider
todos_providers.dart    ─ todayTasksProvider, leftBehindProvider(window)
habits_providers.dart   ─ habitsProvider
projects_providers.dart ─ projectsProvider, projectFeedProvider(projectId)
billing_providers.dart  ─ purchaseStateProvider
```

---

## 4. Empty / Loading / Error States — at a glance

| Screen | Empty | Loading | Error |
|---|---|---|---|
| Auth | n/a | Spinner on submit | Inline form error |
| My Day | "Add your first task" + illustration | Skeleton shimmer | Top banner with retry |
| Our Space (no projects) | Illustration + CTAs | Skeleton | Inline message |
| Our Space (feed) | "Write the first log" illustration | Skeleton card list | Snackbar + retry |
| Create project | n/a | Spinner | Form-inline error |
| Invite join | n/a | "Checking invite…" | Mapped error string per server response |
| Paywall | n/a | "Activating Pro…" after purchase | Snackbar + retry |
| Settings | n/a | Spinner during destructive ops | Confirmation toast |

---

## 5. Offline & Optimistic UX (light-touch)

For v1, **only the following minimal offline behavior is in scope** (more is deferred):

- Last-known data is rendered from an in-memory Riverpod cache so tab switches feel instant.
- Writes are optimistic: the UI updates immediately, then reconciles with the server response.
- If a write fails (e.g., 5-task cap trigger fires), revert the optimistic state and show a snackbar with the server's reason.
- A simple "Offline" `MaterialBanner` appears if connectivity is lost (`connectivity_plus` package).
- **No SQLite mirroring, no write queue across launches** — out of scope for v1.

---

## 6. Theme & Visual Notes

- Material 3 with a single accent color (final color TBD with the app icon work in Phase 4).
- Light theme first; dark theme as a stretch in Phase 4 if time permits.
- Typography: default Roboto, with display weights only for streak number and tab headers.
- No custom animations beyond Flutter defaults except: streak number "bumps" on increment (small scale animation).

---

## 7. Responsiveness

- Phone portrait is the primary target.
- Phone landscape: forms remain usable; nothing is required to look beautiful.
- Tablet: layout stays single-column; consider a max-width constraint of ~600 dp on My Day to avoid stretched task rows. **Not Phase 1 work** — revisit in Phase 4 if time allows.

---

## 8. Accessibility (minimum bar before launch)

- All interactive widgets have `Semantics` labels.
- Tap targets ≥ 48×48 dp.
- Contrast meets WCAG AA on default theme.
- Habit-check toggles are announced ("Habit X, complete").
- No reliance on color alone for state (use icons + text).
