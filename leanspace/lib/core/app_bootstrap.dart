import 'package:flutter/foundation.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Sync timezone, ensure profile row, run rollover, log cold-start.
///
/// [onReady] is called after bootstrap succeeds — use it to refresh entitlements
/// or sync the home-screen widget from the caller's Riverpod container.
Future<void> bootstrapAuthenticatedUser(
  SupabaseClient client, {
  Future<void> Function()? onReady,
}) async {
  final user = client.auth.currentUser;
  if (user == null) return;

  // Run all independent network calls in parallel
  await Future.wait([
    _syncProfile(client, user),
    _performRollover(client, user),
    _logAppOpen(client, user),
  ]);

  if (onReady != null) {
    try {
      await onReady();
    } catch (e) {
      debugPrint('bootstrap: onReady failed: $e');
    }
  }
}

Future<void> _syncProfile(SupabaseClient client, User user) async {
  try {
    final timezone = await FlutterTimezone.getLocalTimezone();
    final email = user.email ?? '';

    await client.from('users').upsert(
      {
        'id': user.id,
        'email': email,
        'timezone': timezone,
      },
      onConflict: 'id',
    );
  } catch (e) {
    debugPrint('bootstrap: profile sync failed: $e');
    try {
      final timezone = await FlutterTimezone.getLocalTimezone();
      await client
          .from('users')
          .update({'timezone': timezone})
          .eq('id', user.id);
    } catch (e2) {
      debugPrint('bootstrap: timezone update failed: $e2');
    }
  }
}

Future<void> _performRollover(SupabaseClient client, User user) async {
  try {
    await client.rpc('perform_rollover_for_user', params: {'p_user_id': user.id})
        .timeout(const Duration(seconds: 10));
  } catch (e) {
    debugPrint('bootstrap: rollover failed: $e');
  }
}

Future<void> _logAppOpen(SupabaseClient client, User user) async {
  try {
    await client.from('app_opens').insert({'user_id': user.id});
  } catch (e) {
    debugPrint('bootstrap: app_opens insert failed: $e');
  }
}
