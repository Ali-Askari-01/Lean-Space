import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  static Future<void> reset() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}

/// In-memory mirror of the onboarding-complete flag, hydrated at app
/// start. The router redirect reads this synchronously.
///
/// The bootstrap in `main.dart` hydrates SharedPreferences BEFORE the
/// router renders, then seeds the value into this notifier via
/// [seed] so the very first redirect already has the right answer —
/// no flash of /onboarding for returning users.
class OnboardingGateNotifier extends Notifier<bool> {
  @override
  bool build() {
    // Defensive: main.dart seeds this. If anyone reads the gate before
    // the seed, we fall back to a one-time async hydration.
    _hydrate();
    return false;
  }

  /// Sets the gate value without touching SharedPreferences. Used by the
  /// bootstrap to seed the synchronous first read with the value it
  /// already loaded.
  void seed(bool value) {
    state = value;
  }

  Future<void> _hydrate() async {
    final done = await OnboardingStore.isComplete();
    if (state != done) {
      state = done;
    }
  }

  Future<void> markComplete() async {
    state = true;
    await OnboardingStore.markComplete();
  }

  Future<void> reset() async {
    state = false;
    await OnboardingStore.reset();
  }
}

final onboardingGateProvider =
    NotifierProvider<OnboardingGateNotifier, bool>(OnboardingGateNotifier.new);
