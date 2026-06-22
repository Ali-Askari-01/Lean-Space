import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/local_date.dart';
import '../../my_day/domain/habit.dart';
import '../../my_day/domain/todo_item.dart';
import '../../my_day/providers/my_day_providers.dart';
import '../../subscription/providers/entitlement_provider.dart';
import '../../streak_freeze/providers/streak_freeze_providers.dart';
import '../domain/insights.dart';

final insightsProvider = FutureProvider<InsightsData>((ref) async {
  final repo = ref.watch(myDayRepositoryProvider);
  final entitlement = ref.watch(entitlementProvider);

  final results = await Future.wait([
    repo.fetchAllTodosForStreak(),
    repo.fetchHabits(),
    ref.read(streakFreezeRepositoryProvider).fetchFrozenDates(),
  ]);

  final todos = results[0] as List<TodoItem>;
  final habits = results[1] as List<Habit>;
  final frozenDates = (results[2] as List<DateTime>).toSet();

  return buildInsights(
    todos,
    habits,
    LocalDate.today,
    windowDays: entitlement.historyWindowDays,
    frozenDates: frozenDates,
  );
});
