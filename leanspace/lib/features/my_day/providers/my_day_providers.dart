import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../router/app_router.dart';
import '../../subscription/providers/entitlement_provider.dart';
import '../../streak_freeze/providers/streak_freeze_providers.dart';
import '../data/my_day_repository.dart';
import '../domain/habit.dart';
import '../domain/todo_item.dart';
import '../../../core/home_widget_sync.dart';
import '../../../core/local_date.dart';

/// Set to true when the home-screen widget "+" is tapped; My Day listens and
/// opens the add-task sheet.
final pendingAddTaskProvider = StateProvider<bool>((ref) => false);

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
  });

  final List<Habit> habits;
  final List<TodoItem> todayTasks;
  final List<TodoItem> leftBehind;
  final int taskStreak;
  final bool isLoading;
  final String? error;
  final bool leftBehindDismissed;

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
    );
  }
}

class MyDayNotifier extends StateNotifier<MyDayState> {
  MyDayNotifier(this._repo, this._ref) : super(const MyDayState()) {
    refresh();
  }

  final MyDayRepository _repo;
  final Ref _ref;

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

      final window = _ref.read(entitlementProvider).historyWindowDays;
      if (window != null) {
        final cutoff = LocalDate.today.subtract(Duration(days: window - 1));
        leftBehind = leftBehind
            .where((t) => !t.originalDate.isBefore(cutoff))
            .toList();
      }

      await _ref.read(streakFreezeProvider.notifier).refresh();
      final frozenDates = _ref.read(streakFreezeProvider).frozenDates.toSet();

      final streak = computeTaskStreak(
        allTodos,
        LocalDate.today,
        frozenDates: frozenDates,
      );
      state = state.copyWith(
        habits: habits,
        todayTasks: todayTasks,
        leftBehind: leftBehind,
        taskStreak: streak,
        isLoading: false,
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

  Future<void> saveHabit({
    required String name,
    required int slotIndex,
    String? existingId,
  }) async {
    await _repo.upsertHabit(
      name: name,
      slotIndex: slotIndex,
      existingId: existingId,
    );
    await refresh();
  }

  Future<void> deleteHabit(String habitId) async {
    await _repo.deleteHabit(habitId);
    await refresh();
  }

  Future<void> toggleHabit(Habit habit) async {
    await _repo.toggleHabit(habit);
    await refresh();
  }

  Future<String?> addTask(String text) async {
    try {
      final item = await _repo.addTask(text);
      await refresh();
      _lastAddedTask = item;
      return null;
    } on PostgrestException catch (e) {
      if (e.message.contains('daily_task_cap_exceeded')) {
        return "You've hit today's 5-task cap.";
      }
      return e.message;
    }
  }

  TodoItem? _lastAddedTask;
  TodoItem? consumeLastAddedTask() {
    final task = _lastAddedTask;
    _lastAddedTask = null;
    return task;
  }

  Future<void> completeTask(TodoItem task) async {
    await _repo.completeTask(task);
    await refresh();
  }

  Future<void> deleteTask(String taskId) async {
    await _repo.deleteTask(taskId);
    await refresh();
  }

  Future<String?> reAddTask(TodoItem missed) async {
    try {
      await _repo.addTask(missed.text, carriedForward: true);
      await refresh();
      return null;
    } on PostgrestException catch (e) {
      if (e.message.contains('daily_task_cap_exceeded')) {
        return "You've hit today's 5-task cap.";
      }
      return e.message;
    }
  }
}

final myDayProvider =
    StateNotifierProvider<MyDayNotifier, MyDayState>((ref) {
  return MyDayNotifier(ref.watch(myDayRepositoryProvider), ref);
});
