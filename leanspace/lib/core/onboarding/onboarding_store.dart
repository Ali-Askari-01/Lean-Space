import 'package:shared_preferences/shared_preferences.dart';

/// Persists whether the first-run guide has been shown.
abstract final class OnboardingStore {
  static const _key = 'onboarding_complete';

  static Future<bool> isComplete() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false;
  }

  static Future<void> markComplete() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, true);
  }
}
