import 'package:flutter_test/flutter_test.dart';
import 'package:leanspace/features/my_day/domain/todo_item.dart';

void main() {
  group('TodoItem.fromJson', () {
    test('handles null fields gracefully', () {
      final json = {
        'id': null,
        'user_id': null,
        'text': null,
        'status': null,
        'original_date': null,
      };
      final todo = TodoItem.fromJson(json);
      expect(todo.id, '');
      expect(todo.userId, '');
      expect(todo.text, '');
      expect(todo.status, TodoStatus.open);
      expect(todo.originalDate, isNotNull);
    });

    test('parses valid json correctly', () {
      final json = {
        'id': 'test-id',
        'user_id': 'user-1',
        'text': 'Buy groceries',
        'status': 'done',
        'original_date': '2026-07-22',
        'completed_date': '2026-07-22',
        'is_carried_forward': false,
      };
      final todo = TodoItem.fromJson(json);
      expect(todo.id, 'test-id');
      expect(todo.userId, 'user-1');
      expect(todo.text, 'Buy groceries');
      expect(todo.status, TodoStatus.done);
      expect(todo.isDone, isTrue);
      expect(todo.isOpen, isFalse);
      expect(todo.isMissed, isFalse);
    });

    test('parses missed status correctly', () {
      final json = {
        'id': 'test-id',
        'user_id': 'user-1',
        'text': 'Missed task',
        'status': 'missed',
        'original_date': '2026-07-22',
      };
      final todo = TodoItem.fromJson(json);
      expect(todo.status, TodoStatus.missed);
      expect(todo.isMissed, isTrue);
    });

    test('defaults to open for unknown status', () {
      final json = {
        'id': 'test-id',
        'user_id': 'user-1',
        'text': 'Unknown status',
        'status': 'unknown',
        'original_date': '2026-07-22',
      };
      final todo = TodoItem.fromJson(json);
      expect(todo.status, TodoStatus.open);
    });
  });

  group('TodoPriority', () {
    test('storageValue returns correct strings', () {
      expect(TodoPriority.standard.storageValue, 'standard');
      expect(TodoPriority.vital.storageValue, 'vital');
      expect(TodoPriority.spark.storageValue, 'spark');
    });

    test('parse returns correct enum', () {
      expect(TodoPriorityX.parse('standard'), TodoPriority.standard);
      expect(TodoPriorityX.parse('vital'), TodoPriority.vital);
      expect(TodoPriorityX.parse('spark'), TodoPriority.spark);
      expect(TodoPriorityX.parse(null), isNull);
      expect(TodoPriorityX.parse('unknown'), isNull);
    });
  });
}
