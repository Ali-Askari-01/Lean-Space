import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/deep_link.dart';
import '../features/buddy/providers/buddy_providers.dart';
import '../features/my_day/providers/my_day_providers.dart';

/// Set when a deep link requests the widget setup sheet.
final pendingWidgetSetupProvider = StateProvider<bool>((ref) => false);

void applyDeepLinkAction(Ref ref, DeepLinkAction action) {
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
