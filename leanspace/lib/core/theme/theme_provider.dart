import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_colors.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

class ThemeNotifier extends Notifier<ThemePreset> {
  static const _key = 'selected_theme_preset';

  @override
  ThemePreset build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final savedIndex = prefs.getInt(_key);
    if (savedIndex != null && savedIndex >= 0 && savedIndex < ThemePreset.values.length) {
      final preset = ThemePreset.values[savedIndex];
      AppColors.currentPreset = preset;
      return preset;
    }
    AppColors.currentPreset = ThemePreset.classicBloom;
    return ThemePreset.classicBloom;
  }

  Future<void> setPreset(ThemePreset preset) async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setInt(_key, preset.index);
    AppColors.currentPreset = preset;
    state = preset;
  }
}

final themePresetProvider = NotifierProvider<ThemeNotifier, ThemePreset>(ThemeNotifier.new);
