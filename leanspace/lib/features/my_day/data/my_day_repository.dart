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
    String? notes,
  }) async {
    final userId = _userId!;

    final base = <String, dynamic>{'name': name};
    final hasNotes = notes != null && notes.isNotEmpty;
    if (hasNotes) base['notes'] = notes;

    Future<Map<String, dynamic>> attempt() async {
      if (existingId != null) {
        final data = await _client
            .from('habits')
            .update(base)
            .eq('id', existingId)
            .select()
            .single();
        return data;
      }
      final insert = {
        'user_id': userId,
        'name': name,
        'slot_index': slotIndex,
        if (hasNotes) 'notes': notes,
      };
      final data = await _client.from('habits').insert(insert).select().single();
      return data;
    }

    try {
      return Habit.fromJson(await attempt());
    } on PostgrestException catch (e) {
      if (_isMissingColumnError(e) && hasNotes) {
        // The notes column doesn't exist yet (migration not applied) — fall
        // back to a payload without it so the habit still saves.
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
      rethrow;
    }
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

  Future<AddTaskOutcome> addTask(
    String text, {
    bool carriedForward = false,
    String? notes,
    TodoPriority? priority,
  }) async {
    final userId = _userId!;
    final today = LocalDate.toIsoDate(LocalDate.today);

    final base = <String, dynamic>{
      'user_id': userId,
      'text': text,
      'original_date': today,
      'status': 'open',
      'is_carried_forward': carriedForward,
    };

    // Build two payloads: one with the optional columns, one without.
    // The optional columns are added by a separate migration; if the user
    // hasn't run it yet the schema cache rejects them. We retry without
    // them so the task still saves and the user can apply the migration
    // later to unlock notes/priority.
    final hasRichPayload =
        (notes != null && notes.isNotEmpty) || priority != null;
    final rich = Map<String, dynamic>.from(base);
    if (notes != null && notes.isNotEmpty) rich['notes'] = notes;
    if (priority != null) rich['priority'] = priority.storageValue;

    Future<Map<String, dynamic>> insertWith(Map<String, dynamic> payload) {
      return _client.from('todos').insert(payload).select().single();
    }

    try {
      final row = await insertWith(rich);
      return AddTaskOutcome(
        item: TodoItem.fromJson(row),
        notesDropped: false,
      );
    } on PostgrestException catch (e) {
      if (_isMissingColumnError(e) && hasRichPayload) {
        // Migration hasn't been applied — fall back to the base insert so
        // the task still gets saved. Caller will surface this state to the
        // user so they can apply the migration in Supabase.
        final row = await insertWith(base);
        return AddTaskOutcome(
          item: TodoItem.fromJson(row),
          notesDropped: true,
        );
      }
      rethrow;
    }
  }

  /// Returns true for the "column not found in schema cache" error that
  /// Supabase returns when the DB hasn't applied the columns migration.
  bool _isMissingColumnError(PostgrestException e) {
    final msg = e.message.toLowerCase();
    return msg.contains('schema cache') ||
        msg.contains('column') && msg.contains("not found") ||
        msg.contains('could not find');
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

  Future<TodoItem> reAddTask(String text) async {
    final outcome = await addTask(text, carriedForward: true);
    return outcome.item;
  }

  /// Removes a missed task from the left-behind list permanently.
  Future<void> dismissMissed(String taskId) async {
    await _client.from('todos').delete().eq('id', taskId);
  }
}

/// What `addTask` returns. The task itself is always in [item]; the
/// [notesDropped] flag tells the caller whether the optional notes /
/// priority columns failed to save (e.g. the migration hasn't been
/// applied yet) so we can warn the user.
class AddTaskOutcome {
  const AddTaskOutcome({required this.item, required this.notesDropped});

  final TodoItem item;
  final bool notesDropped;
}
