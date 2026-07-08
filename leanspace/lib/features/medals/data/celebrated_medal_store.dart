import 'package:shared_preferences/shared_preferences.dart';

/// Persists which medals the user has already seen the celebration
/// sheet for. Prevents the same celebration from re-firing every time
/// the app is opened.
abstract final class CelebratedMedalStore {
  static const _key = 'celebrated_medal_ids';

  static Future<Set<String>> read() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_key) ?? const <String>[];
    return raw.toSet();
  }

  static Future<void> write(Set<String> ids) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, ids.toList());
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
