import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app.dart';
import 'core/env.dart';
import 'core/l10n/app_localizations.dart';
import 'core/onboarding/onboarding_store.dart';
import 'core/theme/app_colors.dart';
import 'core/theme/theme_provider.dart';
import 'core/l10n/locale_resolution.dart';
import 'core/app_constants.dart';
import 'core/widgets/bloom_splash.dart';
import 'core/widgets/locale_provider.dart';
import 'features/reminders/data/notification_service.dart';
import 'features/reminders/providers/reminder_providers.dart';

enum _AppPhase { splash, configError, ready }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences? prefs;
  try {
    prefs = await SharedPreferences.getInstance();
  } catch (e) {
    debugPrint('shared_preferences warmup failed: $e');
  }

  runApp(
    ProviderScope(
      overrides: [
        if (prefs != null) sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const BloomTrackerApp(),
    ),
  );
}

class BloomTrackerApp extends ConsumerStatefulWidget {
  const BloomTrackerApp({super.key});

  @override
  ConsumerState<BloomTrackerApp> createState() => _BloomTrackerAppState();
}

class _BloomTrackerAppState extends ConsumerState<BloomTrackerApp> {
  _AppPhase _phase = _AppPhase.splash;
  String? _configDetail;
  bool _gateHydrated = false;
  bool _localeHydrated = false;

  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    // Parallelize independent init tasks
    await Future.wait([
      dotenv.load(fileName: '.env', isOptional: true).catchError((_) {}),
      ref.read(localeProvider.notifier).ensureHydrated(),
    ]);

    if (!mounted) return;
    setState(() => _localeHydrated = true);

    if (!Env.isConfigured) {
      if (!mounted) return;
      setState(() {
        _configDetail = Env.configProblem;
        _phase = _AppPhase.configError;
      });
      return;
    }

    // Supabase init is the main bottleneck - run it as fast as possible
    await Supabase.initialize(
      url: Env.supabaseUrl,
      publishableKey: Env.supabaseKey,
      authOptions: const FlutterAuthClientOptions(
        authFlowType: AuthFlowType.pkce,
      ),
    );

    // Read onboarding gate in parallel with mounting
    bool gate = false;
    try {
      gate = await OnboardingStore.isComplete();
    } catch (e) {
      debugPrint('onboarding gate hydrate failed: $e');
    }

    if (!mounted) return;
    ref.read(onboardingGateProvider.notifier).seed(gate);
    setState(() {
      _gateHydrated = true;
      _phase = _AppPhase.ready;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 320),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      child: _buildPhase(),
    );
  }

  Widget _buildPhase() {
    final userLocale = ref.watch(localeProvider);

    if (_phase == _AppPhase.splash ||
        (_phase == _AppPhase.ready && (!_gateHydrated || !_localeHydrated))) {
      return KeyedSubtree(
        key: const ValueKey('splash'),
        child: _ScaffoldOnly(locale: userLocale, child: const BloomSplash()),
      );
    }
    if (_phase == _AppPhase.configError) {
      return KeyedSubtree(
        key: const ValueKey('config'),
        child: _ScaffoldOnly(
          locale: userLocale,
          child: Builder(
            builder: (ctx) {
              final l10n = AppLocalizations.of(ctx);
              return BloomSplash(
                showSpinner: false,
                message: _configDetail == null
                    ? null
                    : l10n.bootstrapConfigErrorBody(_configDetail!),
                action: const _SetupRequiredBadge(),
              );
            },
          ),
        ),
      );
    }
    return KeyedSubtree(
      key: const ValueKey('app'),
      child: _ReadyScope(
        notifications: NotificationService(FlutterLocalNotificationsPlugin()),
      ),
    );
  }
}

class _SetupRequiredBadge extends StatelessWidget {
  const _SetupRequiredBadge();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.elevatedCardSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Text(
        l10n.authSetupRequired,
        style: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}

class _ReadyScope extends StatelessWidget {
  const _ReadyScope({required this.notifications});
  final NotificationService notifications;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        notificationServiceProvider.overrideWithValue(notifications),
      ],
      child: const LeanSpaceApp(),
    );
  }
}

class _ScaffoldOnly extends StatelessWidget {
  const _ScaffoldOnly({required this.child, this.locale});
  final Widget child;
  final Locale? locale;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      localeResolutionCallback: (deviceLocale, supportedLocales) =>
          resolveAppLocale(locale, deviceLocale),
      home: child,
    );
  }
}
