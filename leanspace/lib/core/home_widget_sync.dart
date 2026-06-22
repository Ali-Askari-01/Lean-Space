import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:home_widget/home_widget.dart';

/// Pushes the current chain state to the Android home-screen widget.
///
/// The widget turns the phone's home screen into the product: the streak is
/// visible without opening the app, which is the core retention mechanic.
abstract final class HomeWidgetSync {
  static const _androidProvider =
      'com.leanspace.leanspace.LeanSpaceWidgetProvider';

  static Future<void> push({
    required int streak,
    required int tasksDone,
    required int tasksTotal,
    required int habitsDone,
    required int habitsTotal,
  }) async {
    if (!Platform.isAndroid) return;
    try {
      await HomeWidget.saveWidgetData<int>('streak', streak);
      await HomeWidget.saveWidgetData<int>('tasks_done', tasksDone);
      await HomeWidget.saveWidgetData<int>('tasks_total', tasksTotal);
      await HomeWidget.saveWidgetData<int>('habits_done', habitsDone);
      await HomeWidget.saveWidgetData<int>('habits_total', habitsTotal);
      await HomeWidget.updateWidget(qualifiedAndroidName: _androidProvider);
    } catch (e) {
      debugPrint('home widget sync failed: $e');
    }
  }
}
