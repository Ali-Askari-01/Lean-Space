import '../../../core/local_date.dart';
import '../../my_day/domain/habit.dart';
import '../../my_day/domain/todo_item.dart' show TodoItem, computeTaskStreak;

/// One calendar day's task summary, used for the chain grid and receipt.
class DayStat {
  const DayStat({
    required this.date,
    required this.created,
    required this.done,
    required this.missed,
  });

  final DateTime date;
  final int created;
  final int done;
  final int missed;

  bool get isPerfect => created > 0 && missed == 0 && done == created;
  bool get isPartial => created > 0 && done > 0 && !isPerfect;
  bool get isEmpty => created == 0;
}

class InsightsData {
  const InsightsData({
    required this.currentStreak,
    required this.bestStreak,
    required this.last7Days,
    required this.tasksCompleted,
    required this.tasksCreated,
    required this.perfectDays,
    required this.activeHabits,
    required this.topHabitStreak,
    required this.windowDays,
    this.coachingLine,
  });

  final int currentStreak;
  final int bestStreak;
  final List<DayStat> last7Days; // oldest -> newest
  final int tasksCompleted;
  final int tasksCreated;
  final int perfectDays;
  final int activeHabits;
  final int topHabitStreak;

  /// null = full history (Pro), otherwise the free-tier window.
  final int? windowDays;
  final String? coachingLine;

  double get completionRate =>
      tasksCreated == 0 ? 0 : tasksCompleted / tasksCreated;
}

/// Builds the insights model from raw todos + habits.
///
/// [windowDays] limits how far back totals are computed (Free tier = 7).
InsightsData buildInsights(
  List<TodoItem> todos,
  List<Habit> habits,
  DateTime today, {
  int? windowDays,
  Set<DateTime> frozenDates = const {},
}) {
  final byDate = <String, List<TodoItem>>{};
  for (final t in todos) {
    byDate.putIfAbsent(LocalDate.toIsoDate(t.originalDate), () => []).add(t);
  }

  DayStat statFor(DateTime date) {
    final items = byDate[LocalDate.toIsoDate(date)] ?? const [];
    return DayStat(
      date: date,
      created: items.length,
      done: items.where((t) => t.isDone).length,
      missed: items.where((t) => t.isMissed).length,
    );
  }

  // Last 7 days, oldest first, for the grid.
  final last7 = <DayStat>[];
  for (var i = 6; i >= 0; i--) {
    last7.add(statFor(today.subtract(Duration(days: i))));
  }

  // Window cutoff for totals.
  final cutoff =
      windowDays == null ? null : today.subtract(Duration(days: windowDays - 1));

  var completed = 0;
  var created = 0;
  var perfect = 0;
  final perfectByDate = <DateTime, bool>{};
  for (final entry in byDate.entries) {
    final date = LocalDate.parseIsoDate(entry.key);
    if (date == null) continue;
    if (cutoff != null && date.isBefore(cutoff)) continue;
    final items = entry.value;
    created += items.length;
    completed += items.where((t) => t.isDone).length;
    final isPerfect = items.isNotEmpty &&
        items.every((t) => t.isDone);
    perfectByDate[date] = isPerfect;
    if (isPerfect) perfect++;
  }

  return InsightsData(
    currentStreak: computeTaskStreak(todos, today, frozenDates: frozenDates),
    bestStreak: _bestStreak(perfectByDate),
    last7Days: last7,
    tasksCompleted: completed,
    tasksCreated: created,
    perfectDays: perfect,
    activeHabits: habits.length,
    topHabitStreak: habits.isEmpty
        ? 0
        : habits.map((h) => h.streakCount).reduce((a, b) => a > b ? a : b),
    windowDays: windowDays,
    coachingLine: _coachingLine(
      last7: last7,
      currentStreak: computeTaskStreak(todos, today, frozenDates: frozenDates),
      tasksCreated: created,
      tasksCompleted: completed,
      activeHabits: habits.length,
    ),
  );
}

String? _coachingLine({
  required List<DayStat> last7,
  required int currentStreak,
  required int tasksCreated,
  required int tasksCompleted,
  required int activeHabits,
}) {
  if (tasksCreated == 0) {
    return 'Add your first task today — one perfect day starts your chain.';
  }

  final perfectThisWeek = last7.where((d) => d.isPerfect).length;
  final rate = tasksCreated == 0 ? 0.0 : tasksCompleted / tasksCreated;

  if (currentStreak >= 7) {
    return 'You\'re on a $currentStreak-day chain. Protect it before midnight.';
  }
  if (perfectThisWeek >= 5) {
    return 'Strong week — $perfectThisWeek perfect days. Keep the cap at five tasks.';
  }
  if (rate < 0.6 && tasksCreated >= 3) {
    final pct = (rate * 100).round();
    return 'You finish about $pct% of committed tasks. Try fewer, sharper priorities.';
  }
  if (activeHabits == 0) {
    return 'Add a daily habit — chains grow faster when habits and tasks align.';
  }
  if (perfectThisWeek == 0) {
    return 'No perfect days this week yet. Finish every task you add today.';
  }
  return 'You had $perfectThisWeek perfect days this week. One more clean day extends your chain.';
}

int _bestStreak(Map<DateTime, bool> perfectByDate) {
  if (perfectByDate.isEmpty) return 0;
  final dates = perfectByDate.keys.toList()..sort();
  var best = 0;
  var run = 0;
  DateTime? prev;
  for (final d in dates) {
    final perfect = perfectByDate[d] ?? false;
    if (!perfect) {
      run = 0;
      prev = d;
      continue;
    }
    if (prev != null && d.difference(prev).inDays == 1 && (perfectByDate[prev] ?? false)) {
      run += 1;
    } else {
      run = 1;
    }
    if (run > best) best = run;
    prev = d;
  }
  return best;
}
