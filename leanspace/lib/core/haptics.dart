import 'package:flutter/services.dart';

/// Centralized haptic feedback so the whole app feels consistent.
///
/// Discipline apps live or die on the small dopamine hit of completing
/// something. These taps make the chain feel physical.
abstract final class AppHaptics {
  /// A habit ring or task slot was completed.
  static void success() => HapticFeedback.mediumImpact();

  /// A light confirmation (toggle off, selection).
  static void light() => HapticFeedback.lightImpact();

  /// A blocked action (e.g. hitting the 5-task cap or a locked slot).
  static void blocked() => HapticFeedback.heavyImpact();
}
