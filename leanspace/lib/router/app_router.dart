import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../core/deep_link.dart';
import '../core/deep_link_handlers.dart';
import '../core/router_refresh.dart';
import '../core/theme/app_colors.dart';
import '../features/auth/presentation/auth_screen.dart';
import '../features/insights/presentation/insights_screen.dart';
import '../features/my_day/presentation/my_day_screen.dart';
import '../features/our_space/presentation/our_space_screen.dart';
import '../features/settings/presentation/settings_screen.dart';
import '../features/shell/presentation/root_shell.dart';
import '../features/subscription/presentation/paywall_screen.dart';

final supabaseClientProvider = Provider<SupabaseClient>(
  (ref) => Supabase.instance.client,
);

final _routerRefreshProvider = Provider<RouterRefreshNotifier>((ref) {
  final notifier = RouterRefreshNotifier(
    Supabase.instance.client.auth.onAuthStateChange,
  );
  ref.onDispose(notifier.dispose);
  return notifier;
});

final appRouterProvider = Provider<GoRouter>((ref) {
  final refresh = ref.watch(_routerRefreshProvider);

  return GoRouter(
    initialLocation: '/my-day',
    refreshListenable: refresh,
    redirect: (context, state) {
      final action = parseDeepLink(state.uri);
      if (action != null) {
        applyDeepLinkAction(ref, action);
        final session = Supabase.instance.client.auth.currentSession;
        if (session == null) return '/auth';
        return action.path;
      }
      if (state.uri.path == '/' || state.matchedLocation == '/') return '/my-day';

      final session = Supabase.instance.client.auth.currentSession;
      final isAuthRoute = state.matchedLocation == '/auth';

      if (session == null && !isAuthRoute) return '/auth';
      if (session != null && isAuthRoute) return '/my-day';
      return null;
    },
    errorBuilder: (context, state) => Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Page Not Found',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(),
              Text(
                state.error?.toString() ?? 'Unknown routing error',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textMuted,
                    ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () => context.go('/my-day'),
                child: const Text('Home'),
              ),
            ],
          ),
        ),
      ),
    ),
    routes: [
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) => RootShell(child: child),
        routes: [
          GoRoute(
            path: '/my-day',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: MyDayScreen()),
          ),
          GoRoute(
            path: '/our-space',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: OurSpaceScreen()),
          ),
        ],
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/insights',
        builder: (context, state) => const InsightsScreen(),
      ),
      GoRoute(
        path: '/paywall',
        builder: (context, state) => const PaywallScreen(),
      ),
    ],
  );
});
