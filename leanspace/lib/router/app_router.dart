import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../core/deep_link.dart';
import '../core/deep_link_handlers.dart';
import '../core/l10n/app_localizations.dart';
import '../core/onboarding/onboarding_store.dart';
import '../core/router_refresh.dart';
import '../core/theme/app_colors.dart';
import '../features/auth/presentation/auth_screen.dart';
import '../features/history/presentation/history_screen.dart';
import '../features/insights/presentation/insights_screen.dart';
import '../features/left_behind/presentation/left_behind_screen.dart';
import '../features/medals/presentation/all_medals_screen.dart';
import '../features/my_day/presentation/chain_recovery_screen.dart';
import '../features/my_day/presentation/my_day_screen.dart';
import '../features/onboarding/presentation/onboarding_screen.dart';
import '../features/progress/presentation/progress_screen.dart';
import '../features/referral/presentation/referral_screen.dart';
import '../features/settings/presentation/help_support_screen.dart';
import '../features/settings/presentation/settings_screen.dart';
import '../features/shell/presentation/root_shell.dart';
import '../features/share/presentation/share_card_screen.dart';
import '../features/subscription/presentation/manage_pro_screen.dart';
import '../features/subscription/presentation/paywall_screen.dart';
import '../features/you/presentation/you_screen.dart';

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

/// Combined refresh listenable: re-evaluates the redirect whenever the
/// auth state OR the onboarding-complete flag changes.
class _AppRouterRefresh extends ChangeNotifier {
  _AppRouterRefresh(this._ref) {
    _authSub = _ref.listen(_routerRefreshProvider, (_, __) => notifyListeners());
    _onboardingSub =
        _ref.listen(onboardingGateProvider, (_, __) => notifyListeners());
  }

  final Ref _ref;
  late final ProviderSubscription _authSub;
  late final ProviderSubscription _onboardingSub;

  @override
  void dispose() {
    _authSub.close();
    _onboardingSub.close();
    super.dispose();
  }
}

final appRouterProvider = Provider<GoRouter>((ref) {
  final refresh = _AppRouterRefresh(ref);

  return GoRouter(
    initialLocation: '/my-day',
    refreshListenable: refresh,
    redirect: (context, state) {
      final action = parseDeepLink(state.uri);
      if (action != null) {
        scheduleDeepLinkAction(ref, action);
        final session = Supabase.instance.client.auth.currentSession;
        if (session == null) return '/onboarding';
        return action.path;
      }
      if (state.uri.path == '/' || state.matchedLocation == '/') {
        return '/my-day';
      }

      // Onboarding gate runs first so the very first launch is:
      //   Splash → Onboarding → Auth → My Day
      // And after the user finishes onboarding but hasn't signed in:
      //   Splash → Auth (no auto-bounce to onboarding).
      final onboardingDone = ref.read(onboardingGateProvider);
      final isOnboardingRoute = state.matchedLocation == '/onboarding';
      if (!onboardingDone) {
        return isOnboardingRoute ? null : '/onboarding';
      }
      if (isOnboardingRoute) {
        // User already completed onboarding — don't let them re-trigger it
        // by navigating here from a deep link.
        return '/auth';
      }

      final session = Supabase.instance.client.auth.currentSession;
      final isAuthRoute = state.matchedLocation == '/auth';

      if (session == null && !isAuthRoute) return '/auth';
      if (session != null && isAuthRoute) return '/my-day';
      return null;
    },
    errorBuilder: (context, state) {
      final l10n = AppLocalizations.of(context);
      return Scaffold(
        backgroundColor: AppColors.bg,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.commonPageNotFound,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Spacer(),
                Text(
                  state.error?.toString() ?? l10n.commonUnknownError,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textMuted,
                      ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => context.go('/my-day'),
                  child: Text(l10n.commonHome),
                ),
              ],
            ),
          ),
        ),
      );
    },
    routes: [
      GoRoute(
        path: '/onboarding',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: OnboardingScreen(
          onDone: _onboardingDoneHandler,
        )),
      ),
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
            path: '/progress',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ProgressScreen()),
          ),
          GoRoute(
            path: '/you',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: YouScreen()),
          ),
        ],
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/help',
        builder: (context, state) => const HelpSupportScreen(),
      ),
      GoRoute(
        path: '/insights',
        builder: (context, state) => const InsightsScreen(),
      ),
      GoRoute(
        path: '/paywall',
        builder: (context, state) {
          final from = state.uri.queryParameters['from'] ?? 'unknown';
          return PaywallScreen(source: from);
        },
      ),
      GoRoute(
        path: '/settings/manage-pro',
        builder: (context, state) => const ManageProScreen(),
      ),
      GoRoute(
        path: '/referral',
        builder: (context, state) => const ReferralScreen(),
      ),
      GoRoute(
        path: '/medals',
        builder: (context, state) => const AllMedalsScreen(),
      ),
      GoRoute(
        path: '/share-card',
        builder: (context, state) {
          final highlight = state.uri.queryParameters['highlight'];
          return ShareCardScreen(highlightMedalId: highlight);
        },
      ),
      GoRoute(
        path: '/history',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const HistoryScreen(),
          transitionsBuilder: _slideUpTransition,
        ),
      ),
      GoRoute(
        path: '/left-behind',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const LeftBehindScreen(),
          transitionsBuilder: _slideUpTransition,
        ),
      ),
      GoRoute(
        path: '/chain-recovery',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const ChainRecoveryScreen(),
          transitionsBuilder: _slideUpTransition,
        ),
      ),
    ],
  );
});

Widget _slideUpTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondary,
  Widget child,
) {
  return FadeTransition(
    opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
    child: SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 0.04),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
      ),
      child: child,
    ),
  );
}

void _onboardingDoneHandler() {
  // The OnboardingScreen's markComplete() already updated the gate. This
  // method is here so the screen can be constructed with a sync callback;
  // the redirect above will pick up the new state on the next refresh.
}
