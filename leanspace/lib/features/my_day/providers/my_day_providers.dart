import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../router/app_router.dart';
import '../data/my_day_repository.dart';
import '../domain/habit.dart';
import '../domain/todo_item.dart';
import '../../../core/home_widget_sync.dart';
import '../../../core/local_date.dart';
import '../../insights/domain/insights.dart';
import '../../insights/domain/medals.dart';
import '../../medals/data/celebrated_medal_store.dart';
import '../../subscription/providers/entitlement_provider.dart';
import '../../streak_freeze/providers/streak_freeze_providers.dart';

/// Set to true when the home-screen widget "+" is tapped; My Day listens and
/// opens the add-task sheet.
final pendingAddTaskProvider = StateProvider<bool>((ref) => false);

/// True when the user just had their chain break (currentStreak == 0
/// but pastStreak > 0). Set by [MyDayNotifier.refresh] after the first
/// data load. Consumed by the Today screen to show the recovery modal.
final chainBrokenProvider = StateProvider<bool>((ref) => false);

/// Result of adding a task. [notesDropped] is true when the notes/priority
/// fields couldn't be persisted (typically because the DB migration hasn't
/// been applied yet) — the task itself is still saved.
class AddTaskResult {
  const AddTaskResult({this.error, this.notesDropped = false});

  const AddTaskResult.success() : error = null, notesDropped = false;
  const AddTaskResult.failure(String message)
      : error = message,
        notesDropped = false;

  final String? error;
  final bool notesDropped;

  bool get ok => error == null;
}

final myDayRepositoryProvider = Provider<MyDayRepository>((ref) {
  return MyDayRepository(ref.watch(supabaseClientProvider));
});

class MyDayState {
  const MyDayState({
    this.habits = const [],
    this.todayTasks = const [],
    this.leftBehind = const [],
    this.taskStreak = 0,
    this.isLoading = true,
    this.error,
    this.leftBehindDismissed = false,
    this.newlyEarnedMedalIds = const [],
  });

  final List<Habit> habits;
  final List<TodoItem> todayTasks;
  final List<TodoItem> leftBehind;
  final int taskStreak;
  final bool isLoading;
  final String? error;
  final bool leftBehindDismissed;

  /// IDs of medals the user just earned since the previous refresh.
  /// Consumed by the Today screen to fire the celebration sheet. Cleared
  /// as soon as the sheet is shown.
  final List<String> newlyEarnedMedalIds;

  int get openTaskCount => todayTasks.where((t) => t.isOpen).length;
  bool get atTaskCap => todayTasks.length >= 5;
  bool get showLeftBehindNudge =>
      !leftBehindDismissed && leftBehind.isNotEmpty;

  List<Habit?> get habitSlots {
    final slots = List<Habit?>.filled(5, null);
    for (final habit in habits) {
      if (habit.slotIndex >= 0 && habit.slotIndex < 5) {
        slots[habit.slotIndex] = habit;
      }
    }
    return slots;
  }

  MyDayState copyWith({
    List<Habit>? habits,
    List<TodoItem>? todayTasks,
    List<TodoItem>? leftBehind,
    int? taskStreak,
    bool? isLoading,
    String? error,
    bool? leftBehindDismissed,
    List<String>? newlyEarnedMedalIds,
    bool clearError = false,
  }) {
    return MyDayState(
      habits: habits ?? this.habits,
      todayTasks: todayTasks ?? this.todayTasks,
      leftBehind: leftBehind ?? this.leftBehind,
      taskStreak: taskStreak ?? this.taskStreak,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      leftBehindDismissed:
          leftBehindDismissed ?? this.leftBehindDismissed,
      newlyEarnedMedalIds: newlyEarnedMedalIds ?? this.newlyEarnedMedalIds,
    );
  }
}

class MyDayNotifier extends Notifier<MyDayState> {
  TodoItem? _lastAddedTask;

  /// Tracks which dates have already triggered the chain-recovery modal
  /// in this process, so we don't show it twice in one day.
  final Set<DateTime> _chainBreakShownOnDay = <DateTime>{};

  /// Medals we've already shown the celebration sheet for. Hydrated
  /// from SharedPreferences on first build so the celebration only
  /// fires once per earned medal across app restarts.
  final Set<String> _celebratedMedalIds = <String>{};

  @override
  MyDayState build() {
    ref.watch(myDayRepositoryProvider);
    // Hydrate the celebrated-medal set so we don't re-fire celebrations
    // across app restarts. The actual celebration is triggered on the
    // first refresh below.
    _hydrateCelebrated();
    Future.microtask(refresh);
    return const MyDayState();
  }

  Future<void> _hydrateCelebrated() async {
    try {
      final stored = await CelebratedMedalStore.read();
      _celebratedMedalIds
        ..clear()
        ..addAll(stored);
    } catch (_) {
      // SharedPreferences unavailable — start with an empty set. The
      // user might see a celebration for an already-earned medal once;
      // acceptable degradation.
    }
  }

  Future<void> _persistCelebrated() async {
    try {
      await CelebratedMedalStore.write(_celebratedMedalIds);
    } catch (_) {
      // Best-effort. Failing to persist means a re-celebration on
      // next launch, which is harmless.
    }
  }

  MyDayRepository get _repo => ref.read(myDayRepositoryProvider);

  Future<void> refresh() async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final results = await Future.wait([
        _repo.fetchHabits(),
        _repo.fetchTodayTasks(),
        _repo.fetchLeftBehind(),
        _repo.fetchAllTodosForStreak(),
      ]);

      final habits = results[0] as List<Habit>;
      final todayTasks = results[1] as List<TodoItem>;
      var leftBehind = results[2] as List<TodoItem>;
      final allTodos = results[3] as List<TodoItem>;

      final window = ref.read(entitlementProvider).historyWindowDays;
      if (window != null) {
        final cutoff = LocalDate.today.subtract(Duration(days: window - 1));
        leftBehind = leftBehind
            .where((t) => !t.originalDate.isBefore(cutoff))
            .toList();
      }

      await ref.read(streakFreezeProvider.notifier).refresh();
      final frozenDates = ref.read(streakFreezeProvider).frozenDates.toSet();

      final streak = computeTaskStreak(
        allTodos,
        LocalDate.today,
        frozenDates: frozenDates,
      );

      // Compute the insights snapshot just for chain-break detection.
      // (The main insightsProvider re-runs the same computation; we
      // don't need a second source of truth.)
      final windowForBreak = ref.read(entitlementProvider).historyWindowDays;
      final insightsForBreak = buildInsights(
        allTodos,
        habits,
        LocalDate.today,
        windowDays: windowForBreak,
        frozenDates: frozenDates,
      );

      // Detect "chain just broke" — first time we see streak==0 today
      // after the user previously had a meaningful streak. The
      // chainBrokenProvider is consumed by the Today screen listener,
      // which immediately resets it after navigation. To avoid showing
      // the recovery screen on every cold-launch when the chain is
      // still 0, we use a one-shot-per-day in-memory guard.
      final hadMeaningfulHistory = allTodos.any((t) => t.isDone);
      final hadMeaningfulStreak = insightsForBreak.bestStreak >= 3;
      final previousStreak = state.taskStreak;
      final today = LocalDate.today;
      final showChainBreak = streak == 0 &&
          hadMeaningfulHistory &&
          hadMeaningfulStreak &&
          !state.leftBehindDismissed &&
          (previousStreak > 0 || !_chainBreakShownOnDay.contains(today));
      if (showChainBreak) {
        _chainBreakShownOnDay.add(today);
        ref.read(chainBrokenProvider.notifier).state = true;
      } else if (streak > 0) {
        // Reset the break flag once they have a streak again.
        _chainBreakShownOnDay.remove(today);
        ref.read(chainBrokenProvider.notifier).state = false;
      }

      // Detect newly-earned medals. We compare the current progress
      // against the catalogue and surface any medal that became
      // `earned` for the first time AND hasn't been celebrated yet.
      // Pro-only medals are only celebrated for Pro users.
      final isPro = ref.read(entitlementProvider).isPro;
      final medalCtx = MedalContext(
        todos: todayTasks,
        habits: habits,
        insights: insightsForBreak,
        today: LocalDate.today,
      );
      final catalogue = getMedalCatalogue();
      final newMedals = <String>[];
      for (final m in catalogue) {
        if (m.proOnly && !isPro) continue;
        if (m.evaluate(medalCtx).earned &&
            !_celebratedMedalIds.contains(m.id)) {
          _celebratedMedalIds.add(m.id);
          newMedals.add(m.id);
        }
      }
      if (newMedals.isNotEmpty) {
        // Best-effort: persist the updated set so a future launch
        // doesn't re-celebrate these.
        _persistCelebrated();
      }

      state = state.copyWith(
        habits: habits,
        todayTasks: todayTasks,
        leftBehind: leftBehind,
        taskStreak: streak,
        isLoading: false,
        newlyEarnedMedalIds: newMedals,
      );

      HomeWidgetSync.push(
        streak: streak,
        tasksDone: todayTasks.where((t) => t.isDone).length,
        tasksTotal: todayTasks.length,
        habitsDone: habits.where((h) => h.isCompletedToday()).length,
        habitsTotal: habits.length,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Could not load My Day. Pull to refresh.',
      );
    }
  }

  void dismissLeftBehind() {
    state = state.copyWith(leftBehindDismissed: true);
  }

  Future<bool> saveHabit({
    required String name,
    required int slotIndex,
    String? existingId,
    String? notes,
  }) async {
    try {
      await _repo.upsertHabit(
        name: name,
        slotIndex: slotIndex,
        existingId: existingId,
        notes: notes,
      );
      await refresh();
      return true;
    } on PostgrestException catch (e) {
      // Surface the most common failure clearly; otherwise fall through.
      if (e.message.toLowerCase().contains('schema cache') ||
          e.message.toLowerCase().contains('could not find')) {
        try {
          await _repo.upsertHabit(
            name: name,
            slotIndex: slotIndex,
            existingId: existingId,
          );
          await refresh();
          return true;
        } catch (_) {
          rethrow;
        }
      }
      rethrow;
    }
  }

  Future<void> deleteHabit(String habitId) async {
    await _repo.deleteHabit(habitId);
    await refresh();
  }

  Future<void> toggleHabit(Habit habit) async {
    // Optimistic update: immediately toggle the habit locally
    final updatedHabits = state.habits.map((h) {
      if (h.id != habit.id) return h;
      final wasCompleted = h.isCompletedToday();
      final today = LocalDate.today;
      final yesterday = LocalDate.yesterday(today);
      if (wasCompleted) {
        // Undo: revert streak and date
        final newStreak = h.streakCount > 0 ? h.streakCount - 1 : 0;
        return Habit(
          id: h.id,
          userId: h.userId,
          name: h.name,
          slotIndex: h.slotIndex,
          streakCount: newStreak,
          lastCompletedDate:
              newStreak > 0 ? yesterday : null,
          notes: h.notes,
        );
      } else {
        // Complete: increment streak and set date
        return Habit(
          id: h.id,
          userId: h.userId,
          name: h.name,
          slotIndex: h.slotIndex,
          streakCount: h.streakCount + 1,
          lastCompletedDate: today,
          notes: h.notes,
        );
      }
    }).toList();
    state = state.copyWith(habits: updatedHabits);

    // Sync with server in background (fire-and-forget)
    try {
      await _repo.toggleHabit(habit);
      // Silently re-sync to get server-confirmed state
      final serverHabits = await _repo.fetchHabits();
      state = state.copyWith(habits: serverHabits);
    } catch (e) {
      // Revert on error
      debugPrint('toggleHabit failed: $e');
      await refresh();
    }
  }

  Future<AddTaskResult> addTask(
    String text, {
    String? notes,
    TodoPriority? priority,
  }) async {
    try {
      final outcome = await _repo.addTask(
        text,
        notes: notes,
        priority: priority,
      );
      await refresh();
      _lastAddedTask = outcome.item;
      return AddTaskResult(
        notesDropped: outcome.notesDropped,
      );
    } on PostgrestException catch (e) {
      if (e.message.contains('daily_task_cap_exceeded')) {
        return AddTaskResult.failure("You've hit today's 5-task cap.");
      }
      return AddTaskResult.failure(e.message);
    } catch (e) {
      return AddTaskResult.failure(e.toString());
    }
  }

  TodoItem? consumeLastAddedTask() {
    final task = _lastAddedTask;
    _lastAddedTask = null;
    return task;
  }

  Future<void> completeTask(TodoItem task) async {
    // Optimistic update: immediately mark task as done
    final updatedTasks = state.todayTasks.map((t) {
      if (t.id != task.id) return t;
      return TodoItem(
        id: t.id,
        userId: t.userId,
        text: t.text,
        status: TodoStatus.done,
        originalDate: t.originalDate,
        completedDate: LocalDate.today,
        isCarriedForward: t.isCarriedForward,
        notes: t.notes,
        priority: t.priority,
      );
    }).toList();
    state = state.copyWith(todayTasks: updatedTasks);

    // Sync with server in background
    try {
      await _repo.completeTask(task);
      final serverTasks = await _repo.fetchTodayTasks();
      state = state.copyWith(todayTasks: serverTasks);
    } catch (e) {
      debugPrint('completeTask failed: $e');
      await refresh();
    }
  }

  Future<void> deleteTask(String taskId) async {
    await _repo.deleteTask(taskId);
    await refresh();
  }

  Future<String?> reAddTask(TodoItem missed) async {
    try {
      await _repo.reAddTask(missed.text);
      await refresh();
      return null;
    } on PostgrestException catch (e) {
      if (e.message.contains('daily_task_cap_exceeded')) {
        return "You've hit today's 5-task cap.";
      }
      return e.message;
    }
  }

  /// Permanently removes a missed task from the Left-Behind list.
  Future<String?> dismissMissed(TodoItem missed) async {
    try {
      await _repo.dismissMissed(missed.id);
      await refresh();
      return null;
    } catch (e) {
      return 'Could not remove task.';
    }
  }

  /// Pops one medal id off the queue and re-emits state so the listener
  /// can show the next celebration.
  void popCelebration() {
    final ids = state.newlyEarnedMedalIds;
    if (ids.isEmpty) return;
    state = state.copyWith(newlyEarnedMedalIds: ids.sublist(1));
  }
}

final myDayProvider =
    NotifierProvider<MyDayNotifier, MyDayState>(MyDayNotifier.new);
