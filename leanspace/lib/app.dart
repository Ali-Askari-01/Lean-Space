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
  ProviderSubscription<MyDayState>? _myDaySub;

  @override
  void initState() {
    super.initState();
    AppActions.listenForNativeIntents(
      onShortcut: (path) {
        if (mounted) _runShortcut(path);
      },
      onDeepLink: (uri) {
        if (mounted) _runDeepLink(uri);
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bootstrapIfNeeded();
      _initHomeWidget();
      _handlePendingIntents();
      _initReminders();
    });
    Supabase.instance.client.auth.onAuthStateChange.listen((event) {
      if (event.session != null) {
        _bootstrapIfNeeded();
      }
    });

    _myDaySub = ref.listenManual<MyDayState>(myDayProvider, (prev, next) {
      final tasksChanged = prev?.todayTasks != next.todayTasks;
      final finishedLoading = prev?.isLoading == true && !next.isLoading;
      if (!tasksChanged && !finishedLoading) return;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        ref.read(reminderControllerProvider.notifier).rescheduleFromMyDay();
      });
    });
  }

  @override
  void dispose() {
    _myDaySub?.close();
    super.dispose();
  }

  Future<void> _initReminders() async {
    if (!mounted) return;
    final reminders = ref.read(reminderControllerProvider.notifier);
    await reminders.ensurePermission();
    await reminders.rescheduleFromMyDay();
  }

  Future<void> _handlePendingIntents() async {
    final shortcut = await AppActions.consumePendingShortcut();
    if (mounted && shortcut != null) {
      _runShortcut(shortcut);
    }
    final deepLink = await AppActions.consumePendingDeepLink();
    if (mounted && deepLink != null) {
      _runDeepLink(deepLink);
    }
  }

  void _runDeepLink(Uri uri) {
    final action = parseDeepLink(uri);
    if (action == null) return;
    scheduleDeepLinkAction(ref, action);
    ref.read(appRouterProvider).go(action.path);
  }

  void _runShortcut(String path) {
    switch (path) {
      case '/add-widget':
        scheduleDeepLinkAction(
          ref,
          const DeepLinkAction(path: '/my-day', showWidgetSetup: true),
        );
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
        _runDeepLink(uri);
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

    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'LeanSpace',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      routerConfig: router,
    );
  }
}
