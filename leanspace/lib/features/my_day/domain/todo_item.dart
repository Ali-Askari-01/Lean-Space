import '../../../core/local_date.dart';

enum TodoStatus { open, done, missed }

class TodoItem {
  const TodoItem({
    required this.id,
    required this.userId,
    required this.text,
    required this.status,
    required this.originalDate,
    this.completedDate,
    this.isCarriedForward = false,
    this.notes,
    this.priority,
  });

  final String id;
  final String userId;
  final String text;
  final TodoStatus status;
  final DateTime originalDate;
  final DateTime? completedDate;
  final bool isCarriedForward;
  final String? notes;
  final TodoPriority? priority;

  bool get isOpen => status == TodoStatus.open;
  bool get isDone => status == TodoStatus.done;
  bool get isMissed => status == TodoStatus.missed;

  factory TodoItem.fromJson(Map<String, dynamic> json) {
    return TodoItem(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      text: json['text'] as String,
      status: _parseStatus(json['status'] as String),
      originalDate:
          LocalDate.parseIsoDate(json['original_date'] as String) ??
              LocalDate.today,
      completedDate:
          LocalDate.parseIsoDate(json['completed_date'] as String?),
      isCarriedForward: json['is_carried_forward'] as bool? ?? false,
      notes: json['notes'] as String?,
      priority: TodoPriorityX.parse(json['priority'] as String?),
    );
  }

  static TodoStatus _parseStatus(String value) => switch (value) {
        'done' => TodoStatus.done,
        'missed' => TodoStatus.missed,
        _ => TodoStatus.open,
      };
}

/// Task importance — used to color-code and order Daily Seeds.
enum TodoPriority { standard, vital, spark }

extension TodoPriorityX on TodoPriority {
  String get storageValue => switch (this) {
        TodoPriority.standard => 'standard',
        TodoPriority.vital => 'vital',
        TodoPriority.spark => 'spark',
      };

  String get label => switch (this) {
        TodoPriority.standard => 'Standard',
        TodoPriority.vital => 'Vital',
        TodoPriority.spark => 'Spark',
      };

  static TodoPriority? parse(String? value) => switch (value) {
        'vital' => TodoPriority.vital,
        'spark' => TodoPriority.spark,
        'standard' => TodoPriority.standard,
        _ => null,
      };
}

/// Walk backward from yesterday; stop at first day with any missed task.
/// [frozenDates] are calendar days where a streak freeze forgives misses.
int computeTaskStreak(
  List<TodoItem> allTodos,
  DateTime today, {
  Set<DateTime> frozenDates = const {},
}) {
  final byDate = <DateTime, List<TodoItem>>{};
  for (final todo in allTodos) {
    if (!LocalDate.isSameDay(todo.originalDate, today)) {
      byDate.putIfAbsent(todo.originalDate, () => []).add(todo);
    }
  }

  var streak = 0;
  var cursor = LocalDate.yesterday(today);

  while (true) {
    final dayTodos = byDate[cursor];
    if (dayTodos == null || dayTodos.isEmpty) break;

    final missed = dayTodos.any((t) => t.isMissed);
    if (missed) {
      final isFrozen = frozenDates.any(
        (d) => LocalDate.isSameDay(d, cursor),
      );
      if (isFrozen) {
        streak++;
        cursor = LocalDate.yesterday(cursor);
        continue;
      }
      break;
    }

    final hasDone = dayTodos.any((t) => t.isDone);
    if (!hasDone) break;

    streak++;
    cursor = LocalDate.yesterday(cursor);
  }

  return streak;
}
