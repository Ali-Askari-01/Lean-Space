import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../domain/reminder_prefs.dart';

/// Local persistence for reminders (no server migration required yet).
class ReminderStore {
  ReminderStore(this._prefs);

  final SharedPreferences _prefs;

  static const _prefsKey = 'reminder_prefs';
  static const _tasksKey = 'task_reminders';

  ReminderPrefs loadPrefs() {
    final raw = _prefs.getString(_prefsKey);
    if (raw == null) return const ReminderPrefs();
    try {
      return ReminderPrefs.fromJson(
        jsonDecode(raw) as Map<String, dynamic>,
      );
    } catch (_) {
      return const ReminderPrefs();
    }
  }

  Future<void> savePrefs(ReminderPrefs prefs) async {
    await _prefs.setString(_prefsKey, jsonEncode(prefs.toJson()));
  }

  Map<String, TaskReminder> loadTaskReminders() {
    final raw = _prefs.getString(_tasksKey);
    if (raw == null) return {};
    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      final result = <String, TaskReminder>{};
      for (final entry in map.entries) {
        try {
          final value = entry.value as Map<String, dynamic>;
          result[entry.key] = TaskReminder(
            taskId: entry.key,
            at: DateTime.parse(value['at'] as String),
            label: value['label'] as String? ?? 'Task',
          );
        } catch (_) {
          // Skip malformed entry, keep the rest
        }
      }
      return result;
    } catch (_) {
      return {};
    }
  }

  Future<void> saveTaskReminders(Map<String, TaskReminder> reminders) async {
    final encoded = reminders.map(
      (id, r) => MapEntry(id, {
        'at': r.at.toIso8601String(),
        'label': r.label,
      }),
    );
    await _prefs.setString(_tasksKey, jsonEncode(encoded));
  }

  Future<void> setTaskReminder(TaskReminder reminder) async {
    final all = loadTaskReminders();
    all[reminder.taskId] = reminder;
    await saveTaskReminders(all);
  }

  Future<void> removeTaskReminder(String taskId) async {
    final all = loadTaskReminders();
    all.remove(taskId);
    await saveTaskReminders(all);
  }
}
