import '../../../core/local_date.dart';
import '../../../services/api_client.dart';
import '../domain/habit.dart';
import '../domain/todo_item.dart';

class MyDayRepository {
  MyDayRepository(this._api);

  final ApiClient _api;

  Future<List<Habit>> fetchHabits() async {
    final data = await _api.get('/api/habits');
    return (data['results'] as List? ?? [])
        .map((row) => Habit.fromJson(row as Map<String, dynamic>))
        .toList();
  }

  Future<Habit> upsertHabit({
    required String name,
    required int slotIndex,
    String? existingId,
    String? notes,
  }) async {
    final Map<String, dynamic> body = {
      'name': name,
      'slot_index': slotIndex,
      if (notes != null && notes.isNotEmpty) 'notes': notes,
    };

    final Map<String, dynamic> data;
    
    if (existingId != null) {
      data = await _api.put('/api/habits/$existingId', body);
    } else {
      data = await _api.post('/api/habits', body);
    }

    return Habit.fromJson(data);
  }

  Future<void> deleteHabit(String habitId) async {
    await _api.delete('/api/habits/$habitId');
  }

  Future<Habit> toggleHabit(Habit habit) async {
    final data = await _api.post('/api/habits/${habit.id}/toggle');
    return Habit.fromJson(data as Map<String, dynamic>);
  }

  Future<List<TodoItem>> fetchTodayTasks() async {
    final data = await _api.get('/api/todos/today');
    return (data['results'] as List? ?? [])
        .map((row) => TodoItem.fromJson(row as Map<String, dynamic>))
        .toList();
  }

  Future<List<TodoItem>> fetchAllTodosForStreak() async {
    final data = await _api.get('/api/todos/streak');
    return (data['results'] as List? ?? [])
        .map((row) => TodoItem.fromJson(row as Map<String, dynamic>))
        .toList();
  }

  Future<AddTaskOutcome> addTask(
    String text, {
    bool carriedForward = false,
    String? notes,
    TodoPriority? priority,
  }) async {
    final body = {
      'text': text,
      'is_carried_forward': carriedForward,
      if (notes != null && notes.isNotEmpty) 'notes': notes,
      if (priority != null) 'priority': priority.storageValue,
    };

    final data = await _api.post('/api/todos', body);
    
    return AddTaskOutcome(
      item: TodoItem.fromJson(data as Map<String, dynamic>),
      notesDropped: false,
    );
  }

  Future<TodoItem> completeTask(TodoItem task) async {
    final data = await _api.post('/api/todos/${task.id}/complete');
    return TodoItem.fromJson(data as Map<String, dynamic>);
  }

  Future<void> deleteTask(String taskId) async {
    await _api.delete('/api/todos/$taskId');
  }

  Future<List<TodoItem>> fetchLeftBehind() async {
    final data = await _api.get('/api/todos/left-behind');
    return (data['results'] as List? ?? [])
        .map((row) => TodoItem.fromJson(row as Map<String, dynamic>))
        .toList();
  }

  Future<TodoItem> reAddTask(String text) async {
    final outcome = await addTask(text, carriedForward: true);
    return outcome.item;
  }

  Future<void> dismissMissed(String taskId) async {
    await _api.delete('/api/todos/$taskId');
  }
}

class AddTaskOutcome {
  const AddTaskOutcome({required this.item, required this.notesDropped});

  final TodoItem item;
  final bool notesDropped;
}
