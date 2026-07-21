import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

bool _timezonesReady = false;
bool _initializing = false;

/// Lazily loads IANA timezone data and sets the local location.
/// Called on first reminder schedule instead of blocking app startup.
Future<void> ensureTimezonesInitialized() async {
  if (_timezonesReady || _initializing) return;
  _initializing = true;
  try {
    tz_data.initializeTimeZones();
    final tzInfo = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(tzInfo.identifier));
    _timezonesReady = true;
  } catch (_) {
    tz.setLocalLocation(tz.getLocation('UTC'));
    _timezonesReady = true;
  } finally {
    _initializing = false;
  }
}
