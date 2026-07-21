import 'package:flutter_test/flutter_test.dart';
import 'package:leanspace/features/my_day/domain/todo_item.dart';

void main() {
  group('computeTaskStreak', () {
    final today = DateTime(2026, 7, 22);

    test('returns 0 for empty list', () {
      final streak = computeTaskStreak([], today);
      expect(streak, 0);
    });

    test('returns 1 for single done day yesterday', () {
      final yesterday = DateTime(2026, 7, 21);
      final todos = [
        TodoItem(
          id: '1',
          userId: 'u1',
          text: 'Test',
          status: TodoStatus.done,
          originalDate: yesterday,
        ),
      ];
      final streak = computeTaskStreak(todos, today);
      expect(streak, 1);
    });

    test('returns correct streak for consecutive days', () {
      final yesterday = DateTime(2026, 7, 21);
      final dayBefore = DateTime(2026, 7, 20);
      final todos = [
        TodoItem(
          id: '1',
          userId: 'u1',
          text: 'Test',
          status: TodoStatus.done,
          originalDate: yesterday,
        ),
        TodoItem(
          id: '2',
          userId: 'u1',
          text: 'Test',
          status: TodoStatus.done,
          originalDate: dayBefore,
        ),
      ];
      final streak = computeTaskStreak(todos, today);
      expect(streak, 2);
    });

    test('stops at missed day', () {
      final yesterday = DateTime(2026, 7, 21);
      final dayBefore = DateTime(2026, 7, 20);
      final todos = [
        TodoItem(
          id: '1',
          userId: 'u1',
          text: 'Test',
          status: TodoStatus.done,
          originalDate: yesterday,
        ),
        TodoItem(
          id: '2',
          userId: 'u1',
          text: 'Test',
          status: TodoStatus.missed,
          originalDate: dayBefore,
        ),
      ];
      final streak = computeTaskStreak(todos, today);
      expect(streak, 1);
    });

    test('handles frozen dates correctly', () {
      final yesterday = DateTime(2026, 7, 21);
      final dayBefore = DateTime(2026, 7, 20);
      final todos = [
        TodoItem(
          id: '1',
          userId: 'u1',
          text: 'Test',
          status: TodoStatus.done,
          originalDate: yesterday,
        ),
        TodoItem(
          id: '2',
          userId: 'u1',
          text: 'Test',
          status: TodoStatus.missed,
          originalDate: dayBefore,
        ),
      ];
      final streak = computeTaskStreak(
        todos,
        today,
        frozenDates: {dayBefore},
      );
      expect(streak, 2);
    });

    test('excludes today from streak calculation', () {
      final todayTodos = [
        TodoItem(
          id: '1',
          userId: 'u1',
          text: 'Test',
          status: TodoStatus.done,
          originalDate: today,
        ),
      ];
      final streak = computeTaskStreak(todayTodos, today);
      expect(streak, 0);
    });
  });
}
