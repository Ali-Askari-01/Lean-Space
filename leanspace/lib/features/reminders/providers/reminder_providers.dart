import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../my_day/domain/todo_item.dart';
import '../../my_day/providers/my_day_providers.dart';
import '../data/notification_service.dart';
import '../data/reminder_store.dart';
import '../domain/reminder_prefs.dart';

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService(FlutterLocalNotificationsPlugin());
});

final reminderStoreProvider = FutureProvider<ReminderStore>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  return ReminderStore(prefs);
});

class ReminderState {
  const ReminderState({
    this.prefs = const ReminderPrefs(),
    this.taskReminders = const {},
    this.ready = false,
  });

  final ReminderPrefs prefs;
  final Map<String, TaskReminder> taskReminders;
  final bool ready;

  bool hasReminder(String taskId) => taskReminders.containsKey(taskId);

  ReminderState copyWith({
    ReminderPrefs? prefs,
    Map<String, TaskReminder>? taskReminders,
    bool? ready,
  }) {
    return ReminderState(
      prefs: prefs ?? this.prefs,
      taskReminders: taskReminders ?? this.taskReminders,
      ready: ready ?? this.ready,
    );
  }
}

class ReminderController extends StateNotifier<ReminderState> {
  ReminderController(this._ref) : super(const ReminderState()) {
    _init();
  }

  final Ref _ref;
  ReminderStore? _store;

  Future<ReminderStore> _ensureStore() async {
    if (_store != null) return _store!;
    _store = await _ref.read(reminderStoreProvider.future);
    return _store!;
  }

  Future<void> _init() async {
    final store = await _ensureStore();
    final prefs = store.loadPrefs();
    final tasks = store.loadTaskReminders();
    state = state.copyWith(prefs: prefs, taskReminders: tasks, ready: true);
    await _reschedule();
  }

  Future<void> updatePrefs(ReminderPrefs prefs) async {
    final store = await _ensureStore();
    await store.savePrefs(prefs);
    state = state.copyWith(prefs: prefs);
    await _reschedule();
  }

  Future<void> setTaskReminder({
    required String taskId,
    required DateTime at,
    required String label,
  }) async {
    final store = await _ensureStore();
    final reminder = TaskReminder(taskId: taskId, at: at, label: label);
    await store.setTaskReminder(reminder);
    final updated = Map<String, TaskReminder>.from(state.taskReminders)
      ..[taskId] = reminder;
    state = state.copyWith(taskReminders: updated);
    await _reschedule();
  }

  Future<void> clearTaskReminder(String taskId) async {
    final store = await _ensureStore();
    await store.removeTaskReminder(taskId);
    final updated = Map<String, TaskReminder>.from(state.taskReminders)
      ..remove(taskId);
    state = state.copyWith(taskReminders: updated);
    await _ref.read(notificationServiceProvider).cancelTask(taskId);
    await _reschedule();
  }

  Future<void> _reschedule() async {
    if (!state.ready) return;
    final myDay = _ref.read(myDayProvider);
    final openTasks =
        myDay.todayTasks.where((t) => t.status == TodoStatus.open).toList();
    final service = _ref.read(notificationServiceProvider);
    await service.syncAll(
      openTasks: openTasks,
      taskReminders: state.taskReminders,
      prefs: state.prefs,
    );
  }

  Future<void> rescheduleFromMyDay() => _reschedule();

  Future<bool> ensurePermission() async {
    return _ref.read(notificationServiceProvider).requestPermission();
  }
}

final reminderControllerProvider =
    StateNotifierProvider<ReminderController, ReminderState>((ref) {
  return ReminderController(ref);
});
