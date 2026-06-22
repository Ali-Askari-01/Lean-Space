import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:home_widget/home_widget.dart';
import 'package:share_plus/share_plus.dart';

/// Long-press app icon shortcuts and in-app quick actions.
abstract final class AppActions {
  static const _shortcutChannel = MethodChannel('com.leanspace/shortcuts');
  static const _packageName = 'com.leanspace';

  static void listenForShortcuts(void Function(String path) onShortcut) {
    if (!Platform.isAndroid) return;
    _shortcutChannel.setMethodCallHandler((call) async {
      if (call.method == 'onShortcut' && call.arguments is String) {
        onShortcut(call.arguments as String);
      }
      return null;
    });
  }
  /// Reads a shortcut path set by [MainActivity] on cold start, e.g.
  static Future<String?> consumePendingShortcut() async {
    if (!Platform.isAndroid) return null;
    try {
      return await _shortcutChannel.invokeMethod<String>('getPendingShortcut');
    } catch (e) {
      debugPrint('shortcut bridge failed: $e');
      return null;
    }
  }

  static Future<void> shareApp() async {
    await Share.share(
      'LeanSpace — five tasks, daily habits, one unbreakable chain. '
      'Don\'t break the chain.',
      subject: 'Try LeanSpace',
    );
  }

  /// Opens Android app info (uninstall, permissions, storage).
  static Future<void> openAppInfo() async {
    if (!Platform.isAndroid) return;
    const intent = AndroidIntent(
      action: 'android.settings.APPLICATION_DETAILS_SETTINGS',
      data: 'package:$_packageName',
    );
    await intent.launch();
  }

  /// Requests pinning the home-screen widget (Android 8+). Returns false if
  /// the launcher does not support pin requests.
  static Future<bool> requestPinWidget() async {
    if (!Platform.isAndroid) return false;
    try {
      await HomeWidget.requestPinWidget(
        qualifiedAndroidName:
            'com.leanspace.leanspace.LeanSpaceWidgetProvider',
      );
      return true;
    } catch (e) {
      debugPrint('pin widget failed: $e');
      return false;
    }
  }
}
