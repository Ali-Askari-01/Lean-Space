import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../core/deep_link.dart';
import '../features/buddy/providers/buddy_providers.dart';
import '../features/my_day/providers/my_day_providers.dart';

/// Set when a deep link requests the widget setup sheet.
final pendingWidgetSetupProvider = StateProvider<bool>((ref) => false);

String _deepLinkSignature(DeepLinkAction action) =>
    '${action.path}|${action.showWidgetSetup}|${action.addTask}|${action.buddyInviteCode}';

DeepLinkAction? _lastScheduledAction;
DateTime? _lastScheduledAt;

void applyDeepLinkAction(dynamic ref, DeepLinkAction action) {
  if (action.showWidgetSetup) {
    ref.read(pendingWidgetSetupProvider.notifier).state = true;
  }
  if (action.addTask) {
    ref.read(pendingAddTaskProvider.notifier).state = true;
  }
  if (action.buddyInviteCode != null) {
    ref.read(pendingBuddyInviteProvider.notifier).state =
        action.buddyInviteCode;
  }
}

/// Applies deep-link side effects after the current frame (never during build).
void scheduleDeepLinkAction(dynamic ref, DeepLinkAction action) {
  final now = DateTime.now();
  final signature = _deepLinkSignature(action);
  final lastSignature = _lastScheduledAction != null
      ? _deepLinkSignature(_lastScheduledAction!)
      : null;
  if (signature == lastSignature &&
      _lastScheduledAt != null &&
      now.difference(_lastScheduledAt!) <
          const Duration(milliseconds: 800)) {
    return;
  }
  _lastScheduledAction = action;
  _lastScheduledAt = now;

  SchedulerBinding.instance.addPostFrameCallback((_) {
    applyDeepLinkAction(ref, action);
  });
}
