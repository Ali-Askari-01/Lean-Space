import '../../../core/local_date.dart';

class Habit {
  const Habit({
    required this.id,
    required this.userId,
    required this.name,
    required this.slotIndex,
    required this.streakCount,
    this.lastCompletedDate,
  });

  final String id;
  final String userId;
  final String name;
  final int slotIndex;
  final int streakCount;
  final DateTime? lastCompletedDate;

  bool isCompletedToday() {
    final today = LocalDate.today;
    return lastCompletedDate != null &&
        LocalDate.isSameDay(lastCompletedDate!, today);
  }

  factory Habit.fromJson(Map<String, dynamic> json) {
    return Habit(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      name: json['name'] as String,
      slotIndex: json['slot_index'] as int,
      streakCount: json['streak_count'] as int? ?? 0,
      lastCompletedDate:
          LocalDate.parseIsoDate(json['last_completed_date'] as String?),
    );
  }

  Map<String, dynamic> toInsertJson({
    required String userId,
    required String name,
    required int slotIndex,
  }) {
    return {
      'user_id': userId,
      'name': name,
      'slot_index': slotIndex,
    };
  }
}

/// Computes next streak state when user taps a habit (TRD §4.4).
({int streakCount, DateTime? lastCompletedDate}) computeHabitToggle({
  required int currentStreak,
  required DateTime? lastCompletedDate,
}) {
  final today = LocalDate.today;
  final yesterday = LocalDate.yesterday(today);

  if (lastCompletedDate != null && LocalDate.isSameDay(lastCompletedDate, today)) {
    final newStreak = currentStreak > 0 ? currentStreak - 1 : 0;
    return (
      streakCount: newStreak,
      lastCompletedDate: newStreak > 0 ? yesterday : null,
    );
  }

  if (lastCompletedDate != null &&
      LocalDate.isSameDay(lastCompletedDate, yesterday)) {
    return (streakCount: currentStreak + 1, lastCompletedDate: today);
  }

  return (streakCount: 1, lastCompletedDate: today);
}
