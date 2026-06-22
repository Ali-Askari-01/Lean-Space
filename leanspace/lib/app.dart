import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_widget/home_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/app_bootstrap.dart';
import 'core/app_actions.dart';
import 'core/deep_link.dart';
import 'core/deep_link_handlers.dart';
import 'core/feature_flags.dart';
import 'core/theme/app_theme.dart';
import 'features/buddy/providers/buddy_providers.dart';
import 'features/my_day/providers/my_day_providers.dart';
import 'features/reminders/providers/reminder_providers.dart';
import 'features/subscription/providers/entitlement_provider.dart';
import 'features/subscription/providers/subscription_providers.dart';
import 'router/app_router.dart';

class LeanSpaceApp extends ConsumerStatefulWidget {
  const LeanSpaceApp({super.key});

  @override
  ConsumerState<LeanSpaceApp> createState() => _LeanSpaceAppState();
}

class _LeanSpaceAppState extends ConsumerState<LeanSpaceApp> {
  @override
  void initState() {
    super.initState();
    AppActions.listenForShortcuts((path) {
      if (mounted) _runShortcut(path);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bootstrapIfNeeded();
      _initHomeWidget();
      _handlePendingShortcut();
      ref.read(reminderControllerProvider);
    });
    Supabase.instance.client.auth.onAuthStateChange.listen((event) {
      if (event.session != null) {
        _bootstrapIfNeeded();
      }
    });
  }

  Future<void> _handlePendingShortcut() async {
    final path = await AppActions.consumePendingShortcut();
    if (!mounted || path == null) return;
    _runShortcut(path);
  }

  void _runShortcut(String path) {
    switch (path) {
      case '/add-widget':
        ref.read(pendingWidgetSetupProvider.notifier).state = true;
        ref.read(appRouterProvider).go('/my-day');
      case '/share':
        AppActions.shareApp();
      case '/app-info':
        AppActions.openAppInfo();
    }
  }

  void _initHomeWidget() {
    HomeWidget.widgetClicked.listen((uri) {
      if (!mounted || uri == null) return;
      final action = parseDeepLink(uri);
      if (action != null) {
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
        ref.read(appRouterProvider).go(action.path);
      } else {
        ref.read(appRouterProvider).go('/my-day');
      }
    });
  }

  Future<void> _bootstrapIfNeeded() async {
    await bootstrapAuthenticatedUser(
      Supabase.instance.client,
      onReady: () => ref.read(entitlementProvider.notifier).refresh(),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (FeatureFlags.enableSubscriptions) {
      ref.watch(subscriptionControllerProvider);
    }

    ref.listen(myDayProvider, (prev, next) {
      if (prev?.todayTasks != next.todayTasks) {
        ref.read(reminderControllerProvider.notifier).rescheduleFromMyDay();
      }
    });

    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'LeanSpace',
      theme: AppTheme.dark,
      routerConfig: router,
    );
  }
}
