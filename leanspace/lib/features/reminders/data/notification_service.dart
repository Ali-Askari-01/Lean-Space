import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

import '../../../core/timezone_init.dart';

import '../../my_day/domain/todo_item.dart';
import '../domain/reminder_prefs.dart';

/// Schedules local notifications for task alarms and daily nudges.
class NotificationService {
  NotificationService(this._plugin);

  final FlutterLocalNotificationsPlugin _plugin;

  static const _reminderChannelId = 'leanspace_reminders';
  static const _reminderChannelName = 'LeanSpace reminders';
  static const _alarmChannelId = 'leanspace_alarms';
  static const _alarmChannelName = 'LeanSpace task alarms';
  static const _alarmSound =
      RawResourceAndroidNotificationSound('alarm_tone');

  static const finalCallId = 9001;
  static const eveningNudgeId = 9002;

  Future<void> initialize() async {
    await ensureTimezonesInitialized();
    const android = AndroidInitializationSettings('@drawable/ic_notification');
    const settings = InitializationSettings(android: android);
    await _plugin.initialize(settings: settings);

    final androidPlugin = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    const reminderChannel = AndroidNotificationChannel(
      _reminderChannelId,
      _reminderChannelName,
      description: 'Evening nudge and Final Call reminders',
      importance: Importance.high,
    );
    const alarmChannel = AndroidNotificationChannel(
      _alarmChannelId,
      _alarmChannelName,
      description: 'Loud alarms for task reminders',
      importance: Importance.max,
      playSound: true,
      sound: _alarmSound,
      audioAttributesUsage: AudioAttributesUsage.alarm,
    );

    await androidPlugin?.createNotificationChannel(reminderChannel);
    await androidPlugin?.createNotificationChannel(alarmChannel);
  }

  Future<bool> requestPermission() async {
    final android = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    if (android == null) return true;
    final granted = await android.requestNotificationsPermission();
    return granted == true;
  }

  Future<bool> ensureExactAlarmsPermission() async {
    final android = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    if (android == null) return true;

    final canSchedule = await android.canScheduleExactNotifications();
    if (canSchedule == true) return true;

    await android.requestExactAlarmsPermission();
    return await android.canScheduleExactNotifications() ?? false;
  }

  int _taskNotificationId(String taskId) =>
      1000 + (taskId.hashCode.abs() % 90000);

  /// Schedules a single per-task reminder directly (used right after a task
  /// is added so the notification doesn't depend on a follow-up syncAll pass).
  Future<void> scheduleTaskReminder({
    required String taskId,
    required String label,
    required DateTime when,
    String reminderTitle = 'Task reminder',
  }) async {
    await requestPermission();
    await ensureExactAlarmsPermission();
    if (!when.isAfter(DateTime.now())) {
      debugPrint('NotificationService: skip past reminder for $taskId ($when)');
      return;
    }
    await _scheduleOneShot(
      id: _taskNotificationId(taskId),
      title: reminderTitle,
      body: label,
      when: when,
    );
  }

  Future<void> syncAll({
    required List<TodoItem> openTasks,
    required Map<String, TaskReminder> taskReminders,
    required ReminderPrefs prefs,
    String taskReminderTitle = 'Task reminder',
    String finalCallTitle = 'Final Call',
    String finalCallBodyOne = '1 task left on your chain. Midnight is coming.',
    String finalCallBodyMany = '{count} tasks left on your chain. Midnight is coming.',
    String eveningTitle = 'Evening check-in',
    String eveningBodyOne = 'You still have 1 open task today.',
    String eveningBodyMany = 'You still have {count} open tasks today.',
  }) async {
    await requestPermission();
    await ensureExactAlarmsPermission();

    final now = DateTime.now();
    final openIds = openTasks.map((t) => t.id).toSet();

    for (final taskId in taskReminders.keys) {
      if (!openIds.contains(taskId)) {
        await cancelTask(taskId);
      }
    }

    for (final task in openTasks) {
      final reminder = taskReminders[task.id];
      if (reminder == null) continue;
      if (!reminder.at.isAfter(now)) continue;
      await _scheduleOneShot(
        id: _taskNotificationId(task.id),
        title: taskReminderTitle,
        body: task.text,
        when: reminder.at,
      );
    }

    final openCount = openTasks.length;
    if (openCount > 0 && prefs.finalCallEnabled) {
      await _scheduleDaily(
        id: finalCallId,
        title: finalCallTitle,
        body: openCount == 1
            ? finalCallBodyOne
            : finalCallBodyMany.replaceAll('{count}', openCount.toString()),
        hour: prefs.finalCallHour,
        minute: prefs.finalCallMinute,
      );
    } else {
      await _plugin.cancel(id: finalCallId);
    }

    if (openCount > 0 && prefs.eveningNudgeEnabled) {
      await _scheduleDaily(
        id: eveningNudgeId,
        title: eveningTitle,
        body: openCount == 1
            ? eveningBodyOne
            : eveningBodyMany.replaceAll('{count}', openCount.toString()),
        hour: prefs.eveningNudgeHour,
        minute: prefs.eveningNudgeMinute,
      );
    } else {
      await _plugin.cancel(id: eveningNudgeId);
    }
  }

  Future<void> cancelTask(String taskId) async {
    await _plugin.cancel(id: _taskNotificationId(taskId));
  }

  Future<void> _scheduleOneShot({
    required int id,
    required String title,
    required String body,
    required DateTime when,
  }) async {
    final scheduled = tz.TZDateTime.from(when, tz.local);
    debugPrint(
      'NotificationService: scheduling id=$id at $scheduled (now=${tz.TZDateTime.now(tz.local)})',
    );
    await _zonedSchedule(
      id: id,
      title: title,
      body: body,
      when: scheduled,
      alarm: false,
    );
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

    await _zonedSchedule(
      id: id,
      title: title,
      body: body,
      when: scheduled,
      matchTime: true,
    );
  }

  Future<void> _zonedSchedule({
    required int id,
    required String title,
    required String body,
    required tz.TZDateTime when,
    bool matchTime = false,
    bool alarm = false,
  }) async {
    final details = alarm ? _alarmDetails() : _reminderDetails();
    try {
      await _plugin.zonedSchedule(
        id: id,
        title: title,
        body: body,
        scheduledDate: when,
        notificationDetails: details,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents:
            matchTime ? DateTimeComponents.time : null,
      );
      debugPrint('NotificationService: scheduled id=$id (exact)');
    } catch (e) {
      debugPrint('exact notification schedule failed, retrying inexact: $e');
      try {
        await _plugin.zonedSchedule(
          id: id,
          title: title,
          body: body,
          scheduledDate: when,
          notificationDetails: details,
          androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
          matchDateTimeComponents:
              matchTime ? DateTimeComponents.time : null,
        );
        debugPrint('NotificationService: scheduled id=$id (inexact)');
      } catch (e2) {
        debugPrint('notification schedule failed: $e2');
      }
    }
  }

  NotificationDetails _reminderDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        _reminderChannelId,
        _reminderChannelName,
        importance: Importance.high,
        priority: Priority.high,
        icon: '@drawable/ic_notification',
        ticker: 'Task reminder',
      ),
    );
  }

  NotificationDetails _alarmDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        _alarmChannelId,
        _alarmChannelName,
        channelDescription: 'Loud alarms for task reminders',
        importance: Importance.max,
        priority: Priority.max,
        category: AndroidNotificationCategory.alarm,
        playSound: true,
        sound: _alarmSound,
        audioAttributesUsage: AudioAttributesUsage.alarm,
        enableVibration: true,
        icon: '@drawable/ic_notification',
        ticker: 'Task alarm',
      ),
    );
  }
}
