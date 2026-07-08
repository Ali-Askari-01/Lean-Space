import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;
import 'app.dart';
import 'core/env.dart';
import 'core/l10n/app_localizations.dart';
import 'core/onboarding/onboarding_store.dart';
import 'core/theme/app_colors.dart';
import 'core/widgets/bloom_splash.dart';
import 'features/reminders/data/notification_service.dart';
import 'features/reminders/providers/reminder_providers.dart';

/// Boot phase — drives the [BloomTrackerApp]'s state machine.
enum _AppPhase {
  /// First frame: branded splash with spinner.
  splash,

  /// `.env` is missing or has placeholders — show config instructions.
  configError,

  /// Supabase + timezone + notifications + onboarding gate are ready —
  /// hand off to the full app. The onboarding gate is hydrated BEFORE we
  /// render the router so the redirect never flashes /onboarding when the
  /// user has already completed it.
  ready,
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Pre-warm SharedPreferences so the onboarding gate hydrates
  // synchronously the first time it's read.
  try {
    await SharedPreferences.getInstance();
  } catch (e) {
    debugPrint('shared_preferences warmup failed: $e');
  }

  // One ProviderScope for the lifetime of the process. The state machine
  // inside [BloomTrackerApp] decides which child to render (splash,
  // config error, or the full app) without ever re-creating the scope.
  runApp(const ProviderScope(child: BloomTrackerApp()));
}

class BloomTrackerApp extends ConsumerStatefulWidget {
  const BloomTrackerApp({super.key});

  @override
  ConsumerState<BloomTrackerApp> createState() => _BloomTrackerAppState();
}

class _BloomTrackerAppState extends ConsumerState<BloomTrackerApp> {
  _AppPhase _phase = _AppPhase.splash;
  String? _configDetail;
  NotificationService? _notifications;
  bool _gateHydrated = false;

  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    try {
      await dotenv.load(fileName: '.env', isOptional: true);
    } catch (e) {
      debugPrint('dotenv load failed: $e');
    }

    if (!Env.isConfigured) {
      if (!mounted) return;
      setState(() {
        _configDetail = Env.configProblem;
        _phase = _AppPhase.configError;
      });
      return;
    }

    await Supabase.initialize(
      url: Env.supabaseUrl,
      publishableKey: Env.supabaseKey,
      authOptions: const FlutterAuthClientOptions(
        authFlowType: AuthFlowType.pkce,
      ),
    );

    tz_data.initializeTimeZones();
    try {
      final tzInfo = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(tzInfo.identifier));
    } catch (e) {
      debugPrint('timezone init failed: $e');
    }

    final notifications = NotificationService(FlutterLocalNotificationsPlugin());
    await notifications.initialize();

    // Hydrate the onboarding gate BEFORE we render the router, so the
    // first frame the redirect evaluates already has the right value.
    // Without this, the gate starts at `false` and the router flashes
    // /onboarding for one frame even on returning users.
    bool gate = false;
    try {
      gate = await OnboardingStore.isComplete();
    } catch (e) {
      debugPrint('onboarding gate hydrate failed: $e');
    }

    if (!mounted) return;
    // Seed the provider directly so the first read returns the right value.
    ref.read(onboardingGateProvider.notifier).seed(gate);
    setState(() {
      _notifications = notifications;
      _gateHydrated = true;
      _phase = _AppPhase.ready;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    switch (_phase) {
      case _AppPhase.splash:
        return const _ScaffoldOnly(child: BloomSplash());
      case _AppPhase.configError:
        return _ScaffoldOnly(
          child: BloomSplash(
            showSpinner: false,
            message: _configDetail == null
                ? null
                : '$_configDetail\n\nAdd SUPABASE_URL and '
                    'SUPABASE_PUBLISHABLE_KEY (or legacy SUPABASE_ANON_KEY) '
                    'to leanspace/.env, then rebuild:\n\nflutter build '
                    'apk --debug',
            action: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.outlineVariant),
              ),
              child: Text(
                l10n.authSetupRequired,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.4,
                ),
              ),
            ),
          ),
        );
      case _AppPhase.ready:
        if (!_gateHydrated) {
          // Defensive: should never happen but keeps the splash on
          // until the gate is hot.
          return const _ScaffoldOnly(child: BloomSplash());
        }
        return _ReadyScope(notifications: _notifications!);
    }
  }
}

/// Thin wrapper that applies the [notificationServiceProvider] override via
/// a child [ProviderScope] *inside* the app shell. We can't put a
/// [ProviderScope] with a varying number of overrides at the root (the
/// root scope has a fixed shape), so the override is applied here.
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
/// Wraps a child in the standard Bloom-Tracker [MaterialApp] chrome
/// without any provider overrides. Used by splash and config-error
/// phases.
class _ScaffoldOnly extends StatelessWidget {
  const _ScaffoldOnly({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloom Tracker',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: child,
    );
  }
}
