import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;
import 'app.dart';
import 'core/env.dart';
import 'features/reminders/data/notification_service.dart';
import 'features/reminders/providers/reminder_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.load(fileName: '.env', isOptional: true);
  } catch (e) {
    debugPrint('dotenv load failed: $e');
  }

  if (!Env.isConfigured) {
    runApp(ProviderScope(child: LeanSpaceConfigErrorApp(detail: Env.configProblem)));
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

  runApp(
    ProviderScope(
      overrides: [
        notificationServiceProvider.overrideWithValue(notifications),
      ],
      child: const LeanSpaceApp(),
    ),
  );
}

/// Shown when `.env` is missing or still has placeholder values.
class LeanSpaceConfigErrorApp extends StatelessWidget {
  const LeanSpaceConfigErrorApp({super.key, this.detail});

  final String? detail;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LeanSpace',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Setup required')),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Supabase is not configured',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              if (detail != null && detail!.isNotEmpty) ...[
                Text(detail!, style: const TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(height: 12),
              ],
              const Text(
                'Add SUPABASE_URL and SUPABASE_PUBLISHABLE_KEY (or legacy '
                'SUPABASE_ANON_KEY) to leanspace/.env, then rebuild the app:\n\n'
                'flutter build apk --debug',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
