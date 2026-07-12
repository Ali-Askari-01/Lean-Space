import 'package:shared_preferences/shared_preferences.dart';

/// Persists a referral code captured before sign-in (deep link or clipboard).
abstract final class ReferralStore {
  static const _pendingKey = 'pending_referral_code';

  static Future<String?> readPending() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_pendingKey);
  }

  static Future<void> savePending(String code) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_pendingKey, code.trim().toUpperCase());
  }

  static Future<void> clearPending() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_pendingKey);
  }
}
