import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../features/auth/presentation/auth_screen.dart';
import '../features/my_day/presentation/my_day_screen.dart';
import '../features/our_space/presentation/our_space_screen.dart';
import '../features/settings/presentation/settings_screen.dart';
import '../features/shell/presentation/root_shell.dart';

final supabaseClientProvider = Provider<SupabaseClient>(
  (ref) => Supabase.instance.client,
);

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/my-day',
    redirect: (context, state) {
      final session = Supabase.instance.client.auth.currentSession;
      final isAuthRoute = state.matchedLocation == '/auth';

      if (session == null && !isAuthRoute) return '/auth';
      if (session != null && isAuthRoute) return '/my-day';
      return null;
    },
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
    ],
  );
});
