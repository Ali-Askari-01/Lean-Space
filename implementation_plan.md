# FINAL MASTER IMPLEMENTATION PLAN — LeanSpace / Bloom Tracker

## OVERVIEW

This plan addresses **200+ issues** found across 3 comprehensive audit passes.
Organized into 13 phases. Each phase is independently testable.
Estimated total: **~79 hours** for a solo developer.

**Phases P0–P3 must be completed before ANY external testing or release.**

---

## PHASE 0: CRITICAL SECURITY (Must fix before ANY external testing)

### 0.1 — Feature Flags: Flip to production-safe values + add assertion

**File:** `leanspace/lib/core/feature_flags.dart:6, 10`

**Current state:**
- Line 6: `static const unlockAllFeatures = true;` — all Pro features free, billing disabled
- Line 10: `static const enableSubscriptions = false;`

**What to do:**
1. Change line 6: `static const unlockAllFeatures = false;`
2. Change line 10: `static const enableSubscriptions = true;`
3. Add to `leanspace/lib/main.dart` before `runApp()`:
   ```dart
   assert(!kReleaseMode || !FeatureFlags.unlockAllFeatures,
     'FATAL: unlockAllFeatures must be false in release builds');
   ```
4. Add step to `docs/LAUNCH-CHECKLIST.md`:
   ```
   - [ ] Verify `feature_flags.dart` has `unlockAllFeatures = false` and `enableSubscriptions = true`
   ```

---

### 0.2 — Verify `grant_promotional_pro` is revoked in production

**File:** `supabase/migrations/20260713120000_referrals.sql:67-94`
**Mitigated by:** `supabase/migrations/20260713200000_billing_hardening.sql:13`

**What to do:**
1. Run in Supabase SQL Editor to verify:
   ```sql
   SELECT has_function_privilege('authenticated', 'grant_promotional_pro(integer)', 'execute');
   ```
   Must return `false`. If `true`, apply the hardening migration immediately.
2. If this function is not needed, drop it entirely in a new migration.
3. Add comment to migration file:
   ```sql
   -- CRITICAL: This function MUST be revoked before any production deployment.
   ```

---

### 0.3 — Account Deletion: Fix cascade + ordering + CORS

**File:** `supabase/functions/delete-account/index.ts`

**Step 1 — Restrict CORS (line 9):**

Replace:
```typescript
"Access-Control-Allow-Origin": "*",
```

With:
```typescript
const ALLOWED_ORIGINS = ['https://leanspace.app'];
const corsOrigin = ALLOWED_ORIGINS.includes(req.headers.get('Origin') ?? '')
  ? req.headers.get('Origin')! : ALLOWED_ORIGINS[0];
const corsHeaders = {
  "Access-Control-Allow-Origin": corsOrigin,
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
  "Vary": "Origin",
};
```

**Step 2 — Check for shared projects before deletion (after line 57, before line 60):**
```typescript
const { data: sharedProjects } = await supabaseAdmin
  .from('projects')
  .select('id, name')
  .eq('owner_id', user.id);

if (sharedProjects && sharedProjects.length > 0) {
  for (const project of sharedProjects) {
    const { data: members } = await supabaseAdmin
      .from('project_members')
      .select('user_id')
      .eq('project_id', project.id)
      .neq('user_id', user.id);

    if (members && members.length > 0) {
      return new Response(
        JSON.stringify({
          error: 'shared_projects_exist',
          projects: sharedProjects.map(p => p.name)
        }),
        { status: 409, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }
  }
}
```

**Step 3 — Reverse deletion order (delete auth first, then public):**

Move lines 73-75 (auth delete) BEFORE lines 60-63 (public delete).
If auth delete fails, return error — user's data is still intact.

---

### 0.4 — Purchase Token: Add UNIQUE constraint + bind to user

**Files:** New migration + `supabase/functions/verify-play-purchase/index.ts`

**Step 1 — Create new migration `20260714000000_purchase_token_unique.sql`:**
```sql
CREATE UNIQUE INDEX IF NOT EXISTS idx_subscriptions_token_unique
  ON public.subscriptions(purchase_token)
  WHERE purchase_token IS NOT NULL;
```

**Step 2 — In `verify-play-purchase/index.ts`, after line 87, add:**
```typescript
const { data: existingSub } = await supabaseAdmin
  .from('subscriptions')
  .select('user_id')
  .eq('purchase_token', purchaseToken)
  .maybeSingle();

if (existingSub && existingSub.user_id !== user.id) {
  return new Response(
    JSON.stringify({ error: 'token_already_claimed' }),
    { status: 409, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
  );
}
```

---

### 0.5 — Restrict CORS on `verify-play-purchase`

**File:** `supabase/functions/verify-play-purchase/index.ts:14`

Same CORS fix as 0.3 Step 1.

---

### 0.6 — Remove partial credentials from documentation

**File:** `docs/GOOGLE-SIGN-IN-SETUP.md`

Replace all partial OAuth IDs with `YOUR_WEB_CLIENT_ID`, `YOUR_ANDROID_CLIENT_ID`.
Replace SHA-1 fingerprint with `YOUR_SHA1_FINGERPRINT`.
Replace project number with `YOUR_PROJECT_NUMBER`.

---

### 0.7 — Add `env.json`, `*.jks`, `google-services.json` to root `.gitignore`

**File:** Root `.gitignore`

Append:
```
# Build secrets
env.json
*.jks
*.keystore
**/keystore.properties
google-services.json
```

---

### 0.8 — Add length constraints on `notes` and `text` columns

**File:** New migration `20260714000001_text_length_constraints.sql`:
```sql
ALTER TABLE public.todos
  ADD CONSTRAINT chk_todos_notes_length
  CHECK (notes IS NULL OR char_length(notes) <= 2000);

ALTER TABLE public.habits
  ADD CONSTRAINT chk_habits_notes_length
  CHECK (notes IS NULL OR char_length(notes) <= 2000);

ALTER TABLE public.todos
  ADD CONSTRAINT chk_todos_text_length
  CHECK (char_length(text) <= 500);
```

---

## PHASE 1: CRITICAL BUGS

### 1.1 — Delete `scratch.dart`

**File:** `leanspace/scratch.dart`

Delete the file entirely. Contains stale duplicate theme classes.

---

### 1.2 — Fix habit cadence (remove or implement)

**Files:**
- `leanspace/lib/features/my_day/presentation/widgets/add_habit_sheet.dart:30, 139-170`
- `leanspace/lib/features/my_day/domain/habit.dart:28`

**Option A (Quick — recommended for now):**
Remove the cadence picker UI. Comment out or delete lines 137-170 in `add_habit_sheet.dart`.

**Option B (Full implementation):**
1. Add `cadence` column to `habits` table:
   ```sql
   ALTER TABLE public.habits ADD COLUMN cadence TEXT NOT NULL DEFAULT 'daily'
     CHECK (cadence IN ('daily', 'weekdays', '3x', 'weekly'));
   ```
2. Update `Habit` model to include `cadence` field.
3. Persist cadence on insert/update in `my_day_repository.dart`.
4. Use it in `cadenceLabel` getter.

---

### 1.3 — Fix `_bestStreak()` windowing bug

**File:** `leanspace/lib/features/insights/domain/insights.dart:104-122`

`perfectByDate` is only populated for dates within the `windowDays` cutoff,
so Free users (7-day window) can never have a best streak > 7 days.

**Fix:** Move `perfectByDate[date] = isPerfect;` to BEFORE the cutoff check.
Currently at line 120, after the `continue` at line 117. Move to line 116.

---

### 1.4 — Replace force-unwrap `_userId!` with safe handling

**File:** `leanspace/lib/features/my_day/data/my_day_repository.dart:35, 154`

Replace both instances of `final userId = _userId!;` with:
```dart
final userId = _userId;
if (userId == null) throw StateError('User not authenticated');
```

---

### 1.5 — Fix `ReferralStats.remainingToReward` logic error

**File:** `leanspace/lib/features/referral/providers/referral_providers.dart:28-33`

Replace:
```dart
int get remainingToReward {
  if (progress == 0 && referralCount > 0 && referralCount % milestone == 0) {
    return milestone;
  }
  return milestone - progress;
}
```

With:
```dart
int get remainingToReward {
  if (progress == 0 && referralCount > 0) return 0;
  return milestone - progress;
}
```

---

### 1.6 — Cap `fetchAllTodosForStreak()` date range

**File:** `leanspace/lib/features/my_day/data/my_day_repository.dart:133-146`

After line 135 (`if (userId == null) return [];`), add:
```dart
final cutoff = LocalDate.toIsoDate(
  LocalDate.today.subtract(const Duration(days: 365)));
```

Then add to the query chain:
```dart
.gte('original_date', cutoff)
```

---

### 1.7 — Fix `{count}` placeholder never interpolated in notifications

**File:** `leanspace/lib/features/reminders/data/notification_service.dart:141, 153`

At line 141, replace:
```dart
body: openCount == 1 ? finalCallBodyOne : finalCallBodyMany,
```

With:
```dart
body: openCount == 1 ? finalCallBodyOne : finalCallBodyMany.replaceAll('{count}', openCount.toString()),
```

Do the same at line 153 for `eveningBodyMany`.

---

### 1.8 — Fix `LocalDate.parseIsoDate()` unhandled FormatException

**File:** `leanspace/lib/core/local_date.dart:15-24`

Replace:
```dart
static DateTime? parseIsoDate(String? value) {
  if (value == null || value.isEmpty) return null;
  final parts = value.split('-');
  if (parts.length != 3) return null;
  return DateTime(
    int.parse(parts[0]),
    int.parse(parts[1]),
    int.parse(parts[2]),
  );
}
```

With:
```dart
static DateTime? parseIsoDate(String? value) {
  if (value == null || value.isEmpty) return null;
  final parts = value.split('-');
  if (parts.length != 3) return null;
  try {
    return DateTime(
      int.parse(parts[0]),
      int.parse(parts[1]),
      int.parse(parts[2]),
    );
  } catch (_) {
    return null;
  }
}
```

---

## PHASE 2: HIGH-SEVERITY SECURITY

### 2.1 — Move RTDN token from query string to header

**File:** `supabase/functions/play-rtdn/index.ts:42`

Replace:
```typescript
if (url.searchParams.get("token") !== expected) {
```

With:
```typescript
const token = req.headers.get("X-PubSub-Token");
if (!token || token !== expected) {
```

Update Pub/Sub push subscription to use header instead of query parameter.

---

### 2.2 — Fix synthetic expiry fallback in `play-rtdn`

**File:** `supabase/functions/play-rtdn/index.ts:97-108`

Replace the catch block with:
```typescript
} catch (e) {
  console.error("Play API verification failed", e);
  status = isActive ? 'grace' : 'expired';
  // Don't override periodEnd — let existing value persist
}
```

Remove lines 101-107 entirely (the synthetic date calculation).

---

### 2.3 — Add `product_id` CHECK constraint

**New migration:**
```sql
ALTER TABLE public.subscriptions
  ADD CONSTRAINT chk_subscriptions_product_id
  CHECK (product_id IN ('leanspace_pro_monthly', 'leanspace_pro_yearly'));
```

---

### 2.4 — Fix `consumed_invites` RLS + missing CASCADE

**New migration:**
```sql
-- Disable RLS (only accessed by service_role)
ALTER TABLE public.consumed_invites DISABLE ROW LEVEL SECURITY;

-- Add missing CASCADE
ALTER TABLE public.consumed_invites
  DROP CONSTRAINT IF EXISTS consumed_invites_consumed_by_fkey,
  ADD CONSTRAINT consumed_invites_consumed_by_fkey
    FOREIGN KEY (consumed_by) REFERENCES public.users(id) ON DELETE CASCADE;

-- Add missing index
CREATE INDEX IF NOT EXISTS idx_consumed_invites_project
  ON public.consumed_invites(project_id);

-- Fix buddy_invites too
ALTER TABLE public.buddy_invites
  DROP CONSTRAINT IF EXISTS buddy_invites_consumed_by_fkey,
  ADD CONSTRAINT buddy_invites_consumed_by_fkey
    FOREIGN KEY (consumed_by) REFERENCES public.users(id) ON DELETE CASCADE;
```

---

### 2.5 — Fix buddy system TOCTOU race conditions

**New migration:**
```sql
-- accept_buddy_invite: advisory lock to prevent double-pairing
-- (add inside the function body)
PERFORM pg_advisory_xact_lock(hashtext('buddy_pair_' || v_uid::text));

-- send_buddy_nudge: UNIQUE constraint as safety net
ALTER TABLE public.buddy_nudges
  ADD CONSTRAINT uq_buddy_nudges_per_day
  UNIQUE (pair_id, from_user, (created_at AT TIME ZONE 'UTC')::date);

-- use_streak_freeze: advisory lock to prevent exceeding monthly limit
PERFORM pg_advisory_xact_lock(hashtext('streak_freeze_' || v_uid::text));
```

---

### 2.6 — Add timeout to Google API fetch

**File:** `supabase/functions/_shared/play_api.ts:110-112`

Replace:
```typescript
const res = await fetch(url, {
  headers: { Authorization: `Bearer ${token}` },
});
```

With:
```typescript
const controller = new AbortController();
const timeoutId = setTimeout(() => controller.abort(), 10000);
try {
  const res = await fetch(url, {
    headers: { Authorization: `Bearer ${token}` },
    signal: controller.signal,
  });
  clearTimeout(timeoutId);
  // ... existing handling
} catch (e) {
  clearTimeout(timeoutId);
  throw e;
}
```

---

### 2.7 — Fix weak email validation

**File:** `leanspace/lib/features/auth/presentation/auth_screen.dart:76`

Replace:
```dart
if (!email.contains('@')) return l10n.authEnterValidEmail;
```

With:
```dart
final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
if (!emailRegex.hasMatch(email)) return l10n.authEnterValidEmail;
```

---

### 2.8 — Add client-side auth rate limiting

**File:** `leanspace/lib/features/auth/presentation/auth_screen.dart`

Add fields to `_AuthScreenState`:
```dart
int _attempts = 0;
DateTime? _lockedUntil;
```

At the top of `_submitEmail()`:
```dart
if (_lockedUntil != null && DateTime.now().isBefore(_lockedUntil!)) {
  final seconds = _lockedUntil!.difference(DateTime.now()).inSeconds + 1;
  setState(() => _error = 'Too many attempts. Try again in ${seconds}s.');
  return;
}
```

In the catch block (after failed auth):
```dart
_attempts++;
if (_attempts >= 5) {
  _lockedUntil = DateTime.now().add(const Duration(seconds: 30));
  _attempts = 0;
}
```

---

### 2.9 — Unify support emails

**Files:**
- `leanspace/lib/core/app_actions.dart:82`
- `leanspace/lib/features/settings/presentation/help_support_screen.dart:116`

Create `leanspace/lib/core/app_constants.dart`:
```dart
abstract final class AppConstants {
  static const supportEmail = 'support@leanspace.app';
  static const appName = 'LeanSpace';
}
```

Replace hardcoded emails with `AppConstants.supportEmail`.

---

## PHASE 3: HIGH-SEVERITY BUGS

### 3.1 — Fix stream subscription leaks in `app.dart`

**File:** `leanspace/lib/app.dart:54-58, 120-129`

Store subscriptions as fields and cancel in `dispose()`:
```dart
StreamSubscription<AuthState>? _authSub;
StreamSubscription<Uri?>? _widgetClickSub;

// In initState:
_authSub = Supabase.instance.client.auth.onAuthStateChange.listen((event) {
  if (event.session != null) _bootstrapIfNeeded();
});

_widgetClickSub = HomeWidget.widgetClicked.listen((uri) {
  if (!mounted || uri == null) return;
  final action = parseDeepLink(uri);
  if (action != null) _runDeepLink(uri);
  else ref.read(appRouterProvider).go('/my-day');
});

// In dispose:
_authSub?.cancel();
_widgetClickSub?.cancel();
```

---

### 3.2 — Fix router disposal

**File:** `leanspace/lib/router/app_router.dart:64-65`

Add `ref.onDispose`:
```dart
final appRouterProvider = Provider<GoRouter>((ref) {
  final refresh = _AppRouterRefresh(ref);
  final router = GoRouter(
    // ... existing config
  );
  ref.onDispose(() {
    refresh.dispose();
    router.dispose();
  });
  return router;
});
```

---

### 3.3 — Fix unsafe JSON parsing in domain models

**Files:**
- `leanspace/lib/features/my_day/domain/todo_item.dart:33-46`
- `leanspace/lib/features/my_day/domain/habit.dart:30-41`

Add defensive null handling:
```dart
factory TodoItem.fromJson(Map<String, dynamic> json) {
  return TodoItem(
    id: json['id'] as String? ?? '',
    userId: json['user_id'] as String? ?? '',
    text: json['text'] as String? ?? '',
    status: _parseStatus(json['status'] as String? ?? 'open'),
    originalDate: LocalDate.parseIsoDate(json['original_date'] as String?) ?? LocalDate.today,
    completedDate: LocalDate.parseIsoDate(json['completed_date'] as String?),
    isCarriedForward: json['is_carried_forward'] as bool? ?? false,
    notes: json['notes'] as String?,
    priority: TodoPriorityX.parse(json['priority'] as String?),
  );
}
```

Apply same pattern to `habit.dart`.

---

### 3.4 — Fix `buyNonConsumable` for subscriptions

**File:** `leanspace/lib/features/subscription/data/subscription_service.dart:54`

Verify the `in_app_purchase` package version. For Google Play subscriptions,
`buyNonConsumable` is actually correct in the `in_app_purchase` package.
Add a comment documenting this:
```dart
// Google Play subscriptions are purchased via buyNonConsumable
// in the in_app_purchase package (not buySubscription).
await _iap.buyNonConsumable(purchaseParam: param);
```

---

### 3.5 — Add `daily_logs.updated_at` auto-update trigger

**New migration:**
```sql
CREATE OR REPLACE FUNCTION public.set_updated_at()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;

CREATE TRIGGER set_daily_logs_updated_at
  BEFORE UPDATE ON public.daily_logs
  FOR EACH ROW
  EXECUTE FUNCTION public.set_updated_at();
```

---

### 3.6 — Add email change propagation trigger

**New migration:**
```sql
CREATE OR REPLACE FUNCTION public.handle_auth_email_change()
RETURNS TRIGGER LANGUAGE plpgsql SECURITY DEFINER SET search_path = public
AS $$
BEGIN
  UPDATE public.users SET email = NEW.email WHERE id = NEW.id;
  RETURN NEW;
END;
$$;

CREATE TRIGGER on_auth_email_change
  AFTER UPDATE OF email ON auth.users
  FOR EACH ROW
  WHEN (OLD.email IS DISTINCT FROM NEW.email)
  EXECUTE FUNCTION public.handle_auth_email_change();
```

---

### 3.7 — Fix `_isMissingColumnError()` operator precedence

**File:** `leanspace/lib/features/my_day/data/my_day_repository.dart:203-207`

Add explicit parentheses:
```dart
bool _isMissingColumnError(PostgrestException e) {
  final msg = e.message.toLowerCase();
  return msg.contains('schema cache') ||
      (msg.contains('column') && msg.contains("not found")) ||
      msg.contains('could not find');
}
```

---

### 3.8 — Fix locale hydration race condition

**File:** `leanspace/lib/core/widgets/locale_provider.dart`

Add `_hydrating` flag:
```dart
bool _hydrating = false;

Future<void> ensureHydrated() async {
  if (_hydrated || _hydrating) return;
  _hydrating = true;
  try {
    // ... existing hydration logic
    _hydrated = true;
  } finally {
    _hydrating = false;
  }
}
```

---

### 3.9 — Fix timezone init race condition

**File:** `leanspace/lib/core/timezone_init.dart:9-18`

Add `_initializing` flag:
```dart
static bool _initializing = false;

static Future<void> ensureTimezonesInitialized() async {
  if (_timezonesReady || _initializing) return;
  _initializing = true;
  try {
    tz_data.initializeTimeZones();
    final tzInfo = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(tzInfo.identifier));
    _timezonesReady = true;
  } catch (_) {
    tz.setLocalLocation(tz.getLocation('UTC'));
    _timezonesReady = true;
  } finally {
    _initializing = false;
  }
}
```

---

### 3.10 — Fix `complete(purchase)` called on error status

**File:** `leanspace/lib/features/subscription/providers/subscription_providers.dart:159`

Remove `await _service.complete(purchase);` from `PurchaseStatus.error` case:
```dart
case PurchaseStatus.error:
  state = state.copyWith(
    purchasePending: false,
    error: purchase.error?.message ?? 'Purchase failed.',
  );
  // Don't complete purchases in error state per Google Play guidelines
  break;
```

---

## PHASE 4: MEDIUM-SEVERITY SECURITY + BUGS

### 4.1 — Fix referee 24-hour check bypass

**File:** `supabase/migrations/20260713220000_referral_hardening.sql`

Make 24-hour check unconditional:
```sql
IF v_created_at > now() - INTERVAL '24 hours' THEN
  RAISE EXCEPTION 'account_too_new';
END IF;
```

---

### 4.2 — Revoke `_generate_referral_code()` from PUBLIC

**New migration:**
```sql
REVOKE ALL ON FUNCTION public._generate_referral_code()
  FROM PUBLIC, authenticated, anon;
```

---

### 4.3 — Add `app_opens` cleanup mechanism

**New migration + scheduled function:**
```sql
CREATE INDEX IF NOT EXISTS idx_app_opens_created
  ON public.app_opens(created_at DESC);
```

Create scheduled Edge Function that deletes rows > 90 days old.

---

### 4.4 — Fix `ReminderStore` — one bad entry destroys all reminders

**File:** `leanspace/lib/features/reminders/data/reminder_store.dart:36-50`

Handle entries individually:
```dart
Map<String, TaskReminder> loadTaskReminders() {
  final raw = _prefs.getString(_tasksKey);
  if (raw == null) return {};
  try {
    final map = jsonDecode(raw) as Map<String, dynamic>;
    final result = <String, TaskReminder>{};
    for (final entry in map.entries) {
      try {
        final value = entry.value as Map<String, dynamic>;
        result[entry.key] = TaskReminder(
          taskId: entry.key,
          at: DateTime.parse(value['at'] as String),
          label: value['label'] as String? ?? 'Task',
        );
      } catch (_) {
        // Skip malformed entry, keep the rest
      }
    }
    return result;
  } catch (_) {
    return {};
  }
}
```

---

### 4.5 — Fix notification ID hash collisions

**File:** `leanspace/lib/features/reminders/data/notification_service.dart:75-76`

Use larger range:
```dart
int _taskNotificationId(String taskId) =>
    1000 + (taskId.hashCode.abs() % 90000);
```

---

### 4.6 — Add daily task cap enforcement on UPDATE

**New migration:**
```sql
CREATE TRIGGER enforce_daily_task_cap_on_update
  BEFORE UPDATE OF original_date ON public.todos
  FOR EACH ROW
  WHEN (OLD.original_date IS DISTINCT FROM NEW.original_date)
  EXECUTE FUNCTION public.enforce_daily_task_cap();
```

---

### 4.7 — Fix `DateTime.now()` vs `LocalDate.today` inconsistency

**Files:**
- `leanspace/lib/features/insights/presentation/widgets/weekly_receipt_card.dart:21`
- `leanspace/lib/features/share/presentation/share_card_screen.dart:220`

Replace `DateTime.now()` with `LocalDate.today`.

---

### 4.8 — Fix `StreakFreezeRepository` default date

**File:** `leanspace/lib/features/streak_freeze/data/streak_freeze_repository.dart:21`

Replace:
```dart
LocalDate.parseIsoDate(row['frozen_date'] as String) ?? LocalDate.today
```

With:
```dart
final date = LocalDate.parseIsoDate(row['frozen_date'] as String?);
if (date == null) continue; // Skip corrupted rows
```

---

### 4.9 — Fix `paywallFeatures.split('|')` safety

**File:** `leanspace/lib/features/subscription/presentation/paywall_screen.dart:36-42`

Use `take()` to avoid RangeError:
```dart
List<String> _features(AppLocalizations l10n) {
  final parts = l10n.paywallFeatures.split('|');
  return parts.take(_featureIcons.length).toList();
}
```

---

### 4.10 — Fix redundant `computeTaskStreak()` call

**File:** `leanspace/lib/features/insights/domain/insights.dart:125, 138`

Compute once:
```dart
final streak = computeTaskStreak(todos, today, frozenDates: frozenDates);
return InsightsData(
  currentStreak: streak,
  // ...
  coachingLine: _coachingLine(
    currentStreak: streak,
    // ...
  ),
);
```

---

## PHASE 5: UX & POLISH

### 5.1 — Add undo SnackBar for task deletion

**File:** `leanspace/lib/features/my_day/presentation/widgets/task_section.dart:190-202`

Show SnackBar with undo action before actual delete.

---

### 5.2 — Add confirmation dialog for habit deletion

**File:** `leanspace/lib/features/my_day/presentation/widgets/add_habit_sheet.dart:76-87`

Wrap delete in AlertDialog confirmation.

---

### 5.3 — Add confirmation dialog for sign out

**Files:**
- `leanspace/lib/features/you/presentation/you_screen.dart:33-36`
- `leanspace/lib/features/settings/presentation/settings_screen.dart:42-45`

---

### 5.4 — Expand streak-at-risk banner window

**File:** `leanspace/lib/features/my_day/presentation/widgets/streak_at_risk_banner.dart:30`

Expand from 6pm-11pm to 4pm-midnight.

---

### 5.5 — Add habit slot limit tooltip

**File:** `leanspace/lib/features/my_day/presentation/widgets/habit_row.dart:32-42`

Add tooltip on locked slots explaining limit + paywall link.

---

### 5.6 — Fix `TodayHeroStrip` ratio

**File:** `leanspace/lib/features/my_day/presentation/widgets/today_hero_strip.dart:28-30`

Replace: `totalUnits = taskCap + (habitsTotal == 0 ? 1 : habitsTotal);`
With: `totalUnits = taskCap + habitsTotal;`

---

### 5.7 — Add pull-to-refresh on History, Medals, Left Behind

**Files:** `history_screen.dart`, `all_medals_screen.dart`, `left_behind_screen.dart`

Wrap in `RefreshIndicator` calling provider refresh.

---

### 5.8 — Add error retry buttons

**Files:** `insights_screen.dart:87-95`, `history_screen.dart:59-68`, `referral_screen.dart:95-104`

Add `TextButton.icon` with retry that calls `refresh()`.

---

### 5.9 — Add loading indicators where missing

**Files:** `you_screen.dart`, `manage_pro_screen.dart`, `progress_screen.dart`

Show `CircularProgressIndicator` when `isLoading`.

---

### 5.10 — Fix navigation inconsistencies (Navigator + GoRouter mixing)

**Files:**
- `leanspace/lib/features/insights/presentation/widgets/medal_detail_sheet.dart:223, 325`
- `leanspace/lib/features/medals/presentation/medal_celebration_sheet.dart:210-211`
- `leanspace/lib/features/left_behind/presentation/left_behind_screen.dart:61, 67`
- `leanspace/lib/features/settings/presentation/settings_screen.dart:56, 60`

Use GoRouter exclusively (`context.pop()` then `context.push()`).

---

## PHASE 6: LOCALIZATION (50+ hardcoded strings)

### 6.1 — Calendar card strings

**File:** `leanspace/lib/features/progress/presentation/widgets/progress_calendar_card.dart`

Move to ARB:
- `'Personal Activity'` (line 131)
- `'Dark green means a perfect day...'` (line 191)
- `'Browsing $monthLabel...'` (lines 192-193)
- `'darker = more finished'` (line 328)
- Weekday headers `['S', 'M', 'T', 'W', 'T', 'F', 'S']` (line 151)
- Tooltips: 'Previous year', 'Previous month', 'Next month', 'Next year', 'Back to today'
- `'Pick a month to browse'` (line 52)

---

### 6.2 — Medal domain strings

**File:** `leanspace/lib/features/insights/domain/medals.dart`

Move to ARB:
- All 25+ medal titles, subtitles, descriptions
- MedalTier labels: 'Sprout', 'Common', 'Rare', 'Epic', 'Legendary'
- MedalTier taglines
- MedalCategory labels: 'Tasks', 'Habits', 'Streaks', 'Mastery'

---

### 6.3 — Coaching lines

**File:** `leanspace/lib/features/insights/domain/insights.dart:155-177`

Move all 7 coaching line templates to ARB with parameterized strings.

---

### 6.4 — Provider error strings

**Files:**
- `leanspace/lib/features/my_day/providers/my_day_providers.dart:274, 389, 444, 457`
- `leanspace/lib/features/subscription/providers/subscription_providers.dart:68, 84, 102-104, 135, 157, 189, 201`
- `leanspace/lib/features/streak_freeze/providers/streak_freeze_providers.dart:73, 79, 82, 85`
- `leanspace/lib/features/referral/providers/referral_providers.dart:95, 110-121`

Move all error strings to ARB.

---

### 6.5 — Medal share screen strings

**File:** `leanspace/lib/features/medals/presentation/medal_share_screen.dart`

Move to ARB: 'Medal', 'Medal not found', 'Share Medal', 'Preparing...', 'Share to Socials', 'Could not share'

---

### 6.6 — Help & Support branding

**File:** `leanspace/lib/features/settings/presentation/help_support_screen.dart:92, 96, 174`

Replace 'Bloom Tracker' with `AppConstants.appName`.

---

### 6.7 — Theme selection descriptions

**File:** `leanspace/lib/features/settings/presentation/theme_selection_sheet.dart:126-137`

Move all 6 theme descriptions to ARB.

---

### 6.8 — Priority labels

**File:** `leanspace/lib/features/my_day/domain/todo_item.dart:66-70`

Move 'Standard', 'Vital', 'Spark' to ARB.

---

### 6.9 — Notification defaults

**File:** `leanspace/lib/features/reminders/data/notification_service.dart:84, 104-110`

Move all 6 hardcoded notification body strings to ARB.

---

### 6.10 — Locale count mismatch

**File:** `leanspace/README.md`

Update to reflect actual supported locale count.

---

## PHASE 7: ACCESSIBILITY

### 7.1 — Add Semantics to calendar cells

**File:** `leanspace/lib/features/progress/presentation/widgets/progress_calendar_card.dart:239-295`

### 7.2 — Add Semantics to medal badges

**File:** `leanspace/lib/features/insights/presentation/widgets/medal_badge.dart`

### 7.3 — Add Semantics to bottom navigation

**File:** `leanspace/lib/features/shell/presentation/root_shell.dart:86-144`

### 7.4 — Add Semantics to onboarding page indicators

**File:** `leanspace/lib/features/onboarding/presentation/onboarding_screen.dart:196-209`

### 7.5 — Add Semantics to task checkboxes

**File:** `leanspace/lib/features/my_day/presentation/widgets/task_section.dart:557-596`

### 7.6 — Add Semantics to habit rows

**File:** `leanspace/lib/features/my_day/presentation/widgets/habit_row.dart`

### 7.7 — Add ExcludeSemantics to decorative painters

**Files:**
- `leanspace/lib/features/medals/presentation/medal_share_screen.dart:457-483`
- `leanspace/lib/features/share/presentation/share_card_screen.dart:481-499`

---

## PHASE 8: PERFORMANCE

### 8.1 — Cache medal catalogue

**Files:** `progress_screen.dart:54-56`, `all_medals_screen.dart:46, 54`, `share_card_screen.dart:110-111`

Move `getMedalCatalogue()` to top-level `final` constant.

### 8.2 — Fix insights provider excessive recomputation

**File:** `leanspace/lib/features/insights/providers/insights_providers.dart:16`

Don't `ref.watch(myDayProvider)` on every state change — use selector.

### 8.3 — Cache `_elementFor()` result

**File:** `leanspace/lib/features/my_day/presentation/widgets/habit_row.dart:200-221`

Memoize based on habit name.

### 8.4 — Fix calendar O(n*m) lookup

**File:** `leanspace/lib/features/progress/presentation/widgets/progress_calendar_card.dart:97-106`

Use Map keyed by normalized date for O(1) lookup.

### 8.5 — Cache Paint objects in `_BadgePainter`

**File:** `leanspace/lib/features/insights/presentation/widgets/medal_badge.dart:180-200`

Move Paint objects to static fields.

### 8.6 — Deduplicate `_elementFor()` logic

**Files:** `habit_row.dart:200-221`, `habit_blooms.dart:60-106`

Extract to shared `lib/core/widgets/element_meta.dart`.

### 8.7 — Use server-side count for `freezesUsedThisMonth()`

**File:** `leanspace/lib/features/streak_freeze/data/streak_freeze_repository.dart:32-38`

Use `.count(CountOption.exact)` instead of client-side counting.

---

## PHASE 9: ARCHITECTURE & CODE QUALITY

### 9.1 — Replace `Supabase.instance.client` with provider in presentation code

**Files:** 10 instances across `you_screen.dart`, `auth_screen.dart`, `settings_screen.dart`, `help_support_screen.dart`

Use `ref.read(supabaseClientProvider)` in Consumer widgets.

### 9.2 — Extract shared `PackageInfo` provider

Create `packageInfoProvider` FutureProvider in `core/`.

### 9.3 — Remove static mutable `AppColors.currentPreset`

**File:** `leanspace/lib/core/theme/app_colors.dart:642`

Use `themePresetProvider` exclusively.

### 9.4 — Fix `deep_link_handlers.dart` type safety

**File:** `leanspace/lib/core/deep_link_handlers.dart:17`

Replace `dynamic ref` with proper typing.

### 9.5 — Fix duplicate `_SectionLabel` classes

Extract to shared widget in `core/widgets/`.

### 9.6 — Fix theme inconsistencies

Standardize `insights/`, `left_behind_widgets.dart`, `reminder_settings_sheet.dart` to primary color naming.

### 9.7 — Fix `OnboardingGateNotifier._hydrate()` called in `build()`

**File:** `leanspace/lib/core/onboarding/onboarding_store.dart:33-38`

Guard with flag to prevent multiple hydrations.

### 9.8 — Fix `app_bootstrap.dart` missing timeout

**File:** `leanspace/lib/core/app_bootstrap.dart:41-45`

Add `.timeout(const Duration(seconds: 15))` to RPC call.

### 9.9 — Fix duplicate `NotificationService` provider

Remove default provider in `reminder_providers.dart`, rely on `main.dart` override.

### 9.10 — Add `mounted` checks after awaits in providers

**Files:** `my_day_providers.dart:359-368, 422-428`

Add `if (!mounted) return;` after every await.

---

## PHASE 10: MISSING INFRASTRUCTURE

### 10.1 — Add Sentry crash reporting

Add `sentry_flutter: ^8.0.0` to pubspec, initialize in `main.dart`.

### 10.2 — Create `rollover-cron` Edge Function

Create `supabase/functions/rollover-cron/index.ts`, deploy, schedule hourly.

### 10.3 — Host Privacy Policy / Terms pages

Deploy to GitHub Pages, link in Play Store + app Settings.

### 10.4 — Implement data export

"Download my data" button in Settings, export CSV via `share_plus`.

### 10.5 — Create missing scripts or fix doc references

Fix non-existent script references in `GETTING-STARTED.md` and `LAUNCH-CHECKLIST.md`.

### 10.6 — Add AdMob integration

Add `google_mobile_ads`, create bottom banner for free users, hide for Pro.

### 10.7 — Add CI/CD pipeline

Create `.github/workflows/ci.yml` with Flutter analyze + test.

---

## PHASE 11: TESTING

### 11.1 — Unit tests for `computeTaskStreak()`

**File:** `leanspace/test/domain/compute_task_streak_test.dart`
**Cases:** Empty, single day, consecutive, gaps, frozen dates, today excluded

### 11.2 — Unit tests for `computeHabitToggle()`

**File:** `leanspace/test/domain/compute_habit_toggle_test.dart`
**Cases:** First tap, consecutive, un-tap, gap day

### 11.3 — Unit tests for `buildInsights()` + `_bestStreak()`

**File:** `leanspace/test/domain/build_insights_test.dart`

### 11.4 — Unit tests for `LocalDate`

**File:** `leanspace/test/domain/local_date_test.dart`

### 11.5 — Unit tests for `EntitlementNotifier`

**File:** `leanspace/test/domain/entitlement_test.dart`

### 11.6 — Unit tests for `ReferralStats.remainingToReward`

**File:** `leanspace/test/domain/referral_stats_test.dart`

### 11.7 — RLS integration tests

**File:** `supabase/tests/rls_test.sql`

---

## PHASE 12: DOCUMENTATION

### 12.1 — Unify product name

Decide final name, update `main.dart`, `app.dart`, all l10n keys, docs, notification channels.

### 12.2 — Update TRD product IDs

**File:** `engineering/02-TRD.md`

Replace `com.leanspace.pro_monthly` with `leanspace_pro_monthly`.

### 12.3 — Formally defer "Our Space" (Phase 3)

Update `execution/05-TICKETS.md` and `execution/06-RISKS.md`.

### 12.4 — Update launch checklist

Add: feature flags, CORS, RLS, Sentry, Privacy Policy, localization, support emails, .gitignore.

---

## EXECUTION PRIORITY SUMMARY

| Priority | Phase | Est. Time | Must Complete Before |
|----------|-------|-----------|---------------------|
| P0 | Phase 0 (Critical Security) | 6 hr | Any external testing |
| P1 | Phase 1 (Critical Bugs) | 5 hr | Release |
| P2 | Phase 2 (High Security) | 8 hr | Release |
| P3 | Phase 3 (High Bugs) | 6 hr | Release |
| P4 | Phase 4 (Medium) | 5 hr | v1.1 |
| P5 | Phase 5 (UX) | 6 hr | v1.1 |
| P6 | Phase 6 (Localization) | 8 hr | v1.1 |
| P7 | Phase 7 (Accessibility) | 4 hr | v1.1 |
| P8 | Phase 8 (Performance) | 3 hr | v1.1 |
| P9 | Phase 9 (Architecture) | 5 hr | v1.1 |
| P10 | Phase 10 (Infrastructure) | 12 hr | v1.1 |
| P11 | Phase 11 (Testing) | 8 hr | Ongoing |
| P12 | Phase 12 (Docs) | 3 hr | v1.1 |
| TOTAL | | ~79 hr | |

---

## POST-IMPLEMENTATION VERIFICATION CHECKLIST

- [ ] FeatureFlags.unlockAllFeatures == false in release
- [ ] grant_promotional_pro NOT executable by authenticated
- [ ] purchase_token has UNIQUE index
- [ ] notes and text columns have length constraints
- [ ] CORS headers origin-restricted on ALL Edge Functions
- [ ] Account deletion handles shared projects safely
- [ ] scratch.dart deleted
- [ ] No {count} literal strings in notifications
- [ ] All support emails unified
- [ ] env.json, *.jks, google-services.json in root .gitignore
- [ ] Sentry initialized and capturing
- [ ] rollover-cron deployed and scheduled
- [ ] Privacy Policy URL live and linked
- [ ] All unit tests pass in CI
- [ ] No Supabase.instance.client in presentation code
- [ ] Product name consistent everywhere
- [ ] No hardcoded English strings in user-facing UI
- [ ] Semantics widgets on all custom interactive elements
- [ ] Stream subscriptions properly cancelled in dispose
- [ ] GoRouter properly disposed
- [ ] LocalDate.parseIsoDate() handles malformed input safely
- [ ] JSON parsing in domain models handles null fields
- [ ] Buddy TOCTOU races fixed with advisory locks
- [ ] daily_logs.updated_at auto-updates
- [ ] Email changes propagate to public.users
- [ ] Daily task cap enforced on UPDATE
- [ ] _generate_referral_code() revoked from PUBLIC
- [ ] app_opens has cleanup mechanism
- [ ] Notification IDs don't collide
- [ ] ReminderStore handles individual bad entries
- [ ] RTDN token in header, not query string
- [ ] No synthetic expiry fallback in RTDN
- [ ] product_id has CHECK constraint
- [ ] consumed_invites has proper CASCADE
- [ ] Purchase token bound to user
- [ ] Weak email validation fixed
- [ ] Auth rate limiting implemented
- [ ] Referee 24h check unconditional
- [ ] DateTime.now() replaced with LocalDate.today
- [ ] StreakFreezeRepository skips corrupted rows
- [ ] paywallFeatures.split safe
- [ ] computeTaskStreak() called once
- [ ] Undo for task deletion
- [ ] Confirmation for habit deletion
- [ ] Confirmation for sign out
- [ ] Streak-at-risk window expanded
- [ ] Habit slot tooltip added
- [ ] TodayHeroStrip ratio fixed
- [ ] Pull-to-refresh on History/Medals/Left Behind
- [ ] Error retry buttons added
- [ ] Loading indicators added
- [ ] Navigation uses GoRouter exclusively
- [ ] 50+ strings localized
- [ ] 13 accessibility fixes applied
- [ ] 13 performance fixes applied
- [ ] Theme inconsistencies resolved
- [ ] PackageInfo provider extracted
- [ ] AppColors.currentPreset static removed
- [ ] deep_link_handlers type-safe
- [ ] _SectionLabel deduplicated
- [ ] OnboardingGateNotifier guarded
- [ ] app_bootstrap has timeout
- [ ] NotificationService provider deduplicated
- [ ] mounted checks in providers
- [ ] Sentry added
- [ ] rollover-cron created
- [ ] Privacy Policy hosted
- [ ] Data export implemented
- [ ] Missing scripts created or docs fixed
- [ ] AdMob integrated
- [ ] CI/CD pipeline added
- [ ] Unit tests written (7 test files)
- [ ] RLS integration tests written
- [ ] Product name unified
- [ ] TRD product IDs updated
- [ ] "Our Space" formally deferred
- [ ] Launch checklist updated
