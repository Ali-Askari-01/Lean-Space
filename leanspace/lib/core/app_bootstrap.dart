import 'package:flutter/foundation.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import '../services/api_client.dart';

Future<void> bootstrapAuthenticatedUser(
  ApiClient api, {
  Future<void> Function()? onReady,
}) async {
  final timezone = await FlutterTimezone.getLocalTimezone();

  try {
    await api.post('/api/bootstrap', {'timezone': timezone});
  } catch (e) {
    debugPrint('bootstrap failed: $e');
  }

  if (onReady != null) {
    try {
      await onReady();
    } catch (e) {
      debugPrint('bootstrap: onReady failed: $e');
    }
  }
}
