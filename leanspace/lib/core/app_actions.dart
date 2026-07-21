import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:home_widget/home_widget.dart';
import 'package:share_plus/share_plus.dart';

import 'l10n/app_localizations.dart';

/// Long-press app icon shortcuts and in-app quick actions.
abstract final class AppActions {
  static const _shortcutChannel = MethodChannel('com.leanspace/shortcuts');

  static void listenForNativeIntents({
    void Function(String path)? onShortcut,
    void Function(Uri uri)? onDeepLink,
  }) {
    if (!Platform.isAndroid) return;
    _shortcutChannel.setMethodCallHandler((call) async {
      if (call.method == 'onShortcut' && call.arguments is String) {
        onShortcut?.call(call.arguments as String);
      } else if (call.method == 'onDeepLink' && call.arguments is String) {
        onDeepLink?.call(Uri.parse(call.arguments as String));
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

  /// Reads a deep link URI captured by [MainActivity] on cold or warm start.
  static Future<Uri?> consumePendingDeepLink() async {
    if (!Platform.isAndroid) return null;
    try {
      final raw =
          await _shortcutChannel.invokeMethod<String>('getPendingDeepLink');
      if (raw == null || raw.isEmpty) return null;
      return Uri.parse(raw);
    } catch (e) {
      debugPrint('deep link bridge failed: $e');
      return null;
    }
  }

  static const playStoreUrl =
      'https://play.google.com/store/apps/details?id=com.leanspace.leanspace';

  static Future<void> shareApp(AppLocalizations l10n) async {
    await SharePlus.instance.share(
      ShareParams(
        text: l10n.shareAppText(playStoreUrl),
        subject: l10n.shareAppSubject,
      ),
    );
  }

  static Future<void> shareAppWithReferral(
      AppLocalizations l10n, String referralCode) async {
    final code = referralCode.trim().toUpperCase();
    await SharePlus.instance.share(
      ShareParams(
        text: l10n.shareAppReferralText(code, playStoreUrl),
        subject: l10n.shareAppReferralSubject,
      ),
    );
  }

  /// Opens the system mail app pre-filled for a Bloom Tracker support /
  /// bug report email. Falls back gracefully if no mail app is installed.
  static Future<bool> openSupportEmail({
    required String subject,
    required String body,
    String to = 'support@leanspace.app',
  }) async {
    if (!Platform.isAndroid) return false;
    try {
      await _shortcutChannel.invokeMethod<void>('openMail', {
        'to': to,
        'subject': subject,
        'body': body,
      });
      return true;
    } catch (e) {
      debugPrint('open support email failed: $e');
      return false;
    }
  }

  /// Opens Android app info (uninstall, permissions, storage).
  static Future<void> openAppInfo() async {
    if (!Platform.isAndroid) return;
    try {
      await _shortcutChannel.invokeMethod<void>('openAppInfo');
    } catch (e) {
      debugPrint('open app info failed: $e');
    }
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
