import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/local_date.dart';
import '../domain/habit.dart';
import '../domain/todo_item.dart';

class MyDayRepository {
  MyDayRepository(this._client);

  final SupabaseClient _client;

  String? get _userId => _client.auth.currentUser?.id;

  Future<List<Habit>> fetchHabits() async {
    final userId = _userId;
    if (userId == null) return [];

    final data = await _client
        .from('habits')
        .select()
        .eq('user_id', userId)
        .order('slot_index');

    return (data as List)
        .map((row) => Habit.fromJson(row as Map<String, dynamic>))
        .toList();
  }

  Future<Habit> upsertHabit({
    required String name,
    required int slotIndex,
    String? existingId,
  }) async {
    final userId = _userId!;
    if (existingId != null) {
      final data = await _client
          .from('habits')
          .update({'name': name})
          .eq('id', existingId)
          .select()
          .single();
      return Habit.fromJson(data);
    }

    final data = await _client
        .from('habits')
        .insert({
          'user_id': userId,
          'name': name,
          'slot_index': slotIndex,
        })
        .select()
        .single();
    return Habit.fromJson(data);
  }

  Future<void> deleteHabit(String habitId) async {
    await _client.from('habits').delete().eq('id', habitId);
  }

  Future<Habit> toggleHabit(Habit habit) async {
    final next = computeHabitToggle(
      currentStreak: habit.streakCount,
      lastCompletedDate: habit.lastCompletedDate,
    );

    final data = await _client
        .from('habits')
        .update({
          'streak_count': next.streakCount,
          'last_completed_date': next.lastCompletedDate != null
              ? LocalDate.toIsoDate(next.lastCompletedDate!)
              : null,
        })
        .eq('id', habit.id)
        .select()
        .single();

    return Habit.fromJson(data);
  }

  Future<List<TodoItem>> fetchTodayTasks() async {
    final userId = _userId;
    if (userId == null) return [];

    final today = LocalDate.toIsoDate(LocalDate.today);
    final data = await _client
        .from('todos')
        .select()
        .eq('user_id', userId)
        .eq('original_date', today)
        .order('created_at');

    return (data as List)
        .map((row) => TodoItem.fromJson(row as Map<String, dynamic>))
        .toList();
  }

  Future<List<TodoItem>> fetchAllTodosForStreak() async {
    final userId = _userId;
    if (userId == null) return [];

    final data = await _client
        .from('todos')
        .select()
        .eq('user_id', userId)
        .order('original_date', ascending: false);

    return (data as List)
        .map((row) => TodoItem.fromJson(row as Map<String, dynamic>))
        .toList();
  }

  Future<TodoItem> addTask(String text, {bool carriedForward = false}) async {
    final userId = _userId!;
    final today = LocalDate.toIsoDate(LocalDate.today);

    final data = await _client
        .from('todos')
        .insert({
          'user_id': userId,
          'text': text,
          'original_date': today,
          'status': 'open',
          'is_carried_forward': carriedForward,
        })
        .select()
        .single();

    return TodoItem.fromJson(data);
  }

  Future<TodoItem> completeTask(TodoItem task) async {
    final today = LocalDate.toIsoDate(LocalDate.today);
    final data = await _client
        .from('todos')
        .update({
          'status': 'done',
          'completed_date': today,
        })
        .eq('id', task.id)
        .select()
        .single();
    return TodoItem.fromJson(data);
  }

  Future<void> deleteTask(String taskId) async {
    await _client.from('todos').delete().eq('id', taskId);
  }

  Future<List<TodoItem>> fetchLeftBehind() async {
    final userId = _userId;
    if (userId == null) return [];

    final data = await _client
        .from('todos')
        .select()
        .eq('user_id', userId)
        .eq('status', 'missed')
        .order('original_date', ascending: false);

    return (data as List)
        .map((row) => TodoItem.fromJson(row as Map<String, dynamic>))
        .toList();
  }
}
