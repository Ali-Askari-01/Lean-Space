import 'package:flutter_test/flutter_test.dart';
import 'package:daily_stitch/core/local_date.dart';
import 'package:daily_stitch/features/my_day/domain/habit.dart';

void main() {
  group('computeHabitToggle', () {
    test('first tap sets streak to 1', () {
      final result = computeHabitToggle(
        currentStreak: 0,
        lastCompletedDate: null,
      );
      expect(result.streakCount, 1);
      expect(result.lastCompletedDate, isNotNull);
      expect(LocalDate.isSameDay(result.lastCompletedDate!, LocalDate.today), isTrue);
    });

    test('consecutive day tap increments streak', () {
      final yesterday = LocalDate.yesterday(LocalDate.today);
      final result = computeHabitToggle(
        currentStreak: 3,
        lastCompletedDate: yesterday,
      );
      expect(result.streakCount, 4);
      expect(result.lastCompletedDate, isNotNull);
      expect(LocalDate.isSameDay(result.lastCompletedDate!, LocalDate.today), isTrue);
    });

    test('un-tap (same day) decrements streak', () {
      final result = computeHabitToggle(
        currentStreak: 3,
        lastCompletedDate: LocalDate.today,
      );
      expect(result.streakCount, 2);
    });

    test('un-tap at streak 0 stays at 0', () {
      final result = computeHabitToggle(
        currentStreak: 0,
        lastCompletedDate: LocalDate.today,
      );
      expect(result.streakCount, 0);
      expect(result.lastCompletedDate, isNull);
    });

    test('gap day tap resets streak to 1', () {
      final twoDaysAgo = LocalDate.today.subtract(const Duration(days: 2));
      final result = computeHabitToggle(
        currentStreak: 5,
        lastCompletedDate: twoDaysAgo,
      );
      expect(result.streakCount, 1);
    });
  });

  group('Habit.fromJson', () {
    test('handles null fields gracefully', () {
      final json = {
        'id': null,
        'user_id': null,
        'name': null,
        'slot_index': null,
        'streak_count': null,
        'last_completed_date': null,
      };
      final habit = Habit.fromJson(json);
      expect(habit.id, '');
      expect(habit.userId, '');
      expect(habit.name, '');
      expect(habit.slotIndex, 0);
      expect(habit.streakCount, 0);
      expect(habit.lastCompletedDate, isNull);
    });

    test('parses valid json correctly', () {
      final json = {
        'id': 'test-id',
        'user_id': 'user-1',
        'name': 'Exercise',
        'slot_index': 0,
        'streak_count': 5,
        'last_completed_date': '2026-07-22',
      };
      final habit = Habit.fromJson(json);
      expect(habit.id, 'test-id');
      expect(habit.userId, 'user-1');
      expect(habit.name, 'Exercise');
      expect(habit.slotIndex, 0);
      expect(habit.streakCount, 5);
      expect(habit.lastCompletedDate, isNotNull);
    });
  });
}
