import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

import '../../my_day/domain/todo_item.dart';
import '../domain/reminder_prefs.dart';

/// Schedules local notifications for task alarms and daily nudges.
class NotificationService {
  NotificationService(this._plugin);

  final FlutterLocalNotificationsPlugin _plugin;

  static const _channelId = 'leanspace_reminders';
  static const _channelName = 'LeanSpace reminders';

  static const finalCallId = 9001;
  static const eveningNudgeId = 9002;

  Future<void> initialize() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android);
    await _plugin.initialize(settings);

    const channel = AndroidNotificationChannel(
      _channelId,
      _channelName,
      description: 'Task alarms and chain reminders',
      importance: Importance.high,
    );
    await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  Future<bool> requestPermission() async {
    final android = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    if (android == null) return true;
    final granted = await android.requestNotificationsPermission();
    return granted == true;
  }

  int _taskNotificationId(String taskId) =>
      1000 + (taskId.hashCode.abs() % 8000);

  Future<void> syncAll({
    required List<TodoItem> openTasks,
    required Map<String, TaskReminder> taskReminders,
    required ReminderPrefs prefs,
  }) async {
    await _plugin.cancelAll();

    final now = DateTime.now();

    for (final task in openTasks) {
      final reminder = taskReminders[task.id];
      if (reminder == null) continue;
      if (!reminder.at.isAfter(now)) continue;
      await _scheduleOneShot(
        id: _taskNotificationId(task.id),
        title: 'Task reminder',
        body: task.text,
        when: reminder.at,
      );
    }

    final openCount = openTasks.length;
    if (openCount > 0) {
      if (prefs.finalCallEnabled) {
        await _scheduleDaily(
          id: finalCallId,
          title: 'Final Call',
          body: openCount == 1
              ? '1 task left on your chain. Midnight is coming.'
              : '$openCount tasks left on your chain. Midnight is coming.',
          hour: prefs.finalCallHour,
          minute: prefs.finalCallMinute,
        );
      }

      if (prefs.eveningNudgeEnabled) {
        await _scheduleDaily(
          id: eveningNudgeId,
          title: 'Evening check-in',
          body: openCount == 1
              ? 'You still have 1 open task today.'
              : 'You still have $openCount open tasks today.',
          hour: prefs.eveningNudgeHour,
          minute: prefs.eveningNudgeMinute,
        );
      }
    }
  }

  Future<void> cancelTask(String taskId) async {
    await _plugin.cancel(_taskNotificationId(taskId));
  }

  Future<void> _scheduleOneShot({
    required int id,
    required String title,
    required String body,
    required DateTime when,
  }) async {
    try {
      await _plugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(when, tz.local),
        _details(),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      );
    } catch (e) {
      debugPrint('notification schedule failed: $e');
    }
  }

  Future<void> _scheduleDaily({
    required int id,
    required String title,
    required String body,
    required int hour,
    required int minute,
  }) async {
    final now = tz.TZDateTime.now(tz.local);
    var scheduled = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }

    try {
      await _plugin.zonedSchedule(
        id,
        title,
        body,
        scheduled,
        _details(),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    } catch (e) {
      debugPrint('daily notification schedule failed: $e');
    }
  }

  NotificationDetails _details() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        _channelId,
        _channelName,
        importance: Importance.high,
        priority: Priority.high,
      ),
    );
  }
}
