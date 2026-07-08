import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Per-user language override. When null, the system locale is used.
class LocaleNotifier extends Notifier<Locale?> {
  static const _key = 'app_locale';

  @override
  Locale? build() {
    // Async hydrate so the splash holds until we know the user's choice.
    _hydrate();
    return null;
  }

  Future<void> _hydrate() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final code = prefs.getString(_key);
      if (code != null && code.isNotEmpty) {
        state = _fromCode(code);
      }
    } catch (_) {
      // Default to system locale on any failure.
    }
  }

  Future<void> set(Locale? locale) async {
    state = locale;
    try {
      final prefs = await SharedPreferences.getInstance();
      if (locale == null) {
        await prefs.remove(_key);
      } else {
        await prefs.setString(_key, _toCode(locale));
      }
    } catch (_) {
      // Best-effort persistence.
    }
  }

  /// Human-readable label for the picker UI.
  String labelFor(Locale? locale) {
    if (locale == null) return 'System default';
    switch (locale.languageCode) {
      case 'en':
        return 'English';
      case 'ur':
        return 'اردو (Urdu)';
      case 'hi':
        return 'हिन्दी (Hindi)';
      case 'pa':
        return 'ਪੰਜਾਬੀ (Punjabi)';
      case 'sd':
        return 'سنڌي (Sindhi)';
      case 'bn':
        return 'বাংলা (Bengali)';
      case 'ps':
        return 'پښتو (Pashto)';
      case 'es':
        return 'Español';
      case 'pt':
        return 'Português';
      case 'fr':
        return 'Français';
      case 'de':
        return 'Deutsch';
      case 'it':
        return 'Italiano';
      case 'ar':
        return 'العربية';
      case 'tr':
        return 'Türkçe';
      case 'id':
        return 'Bahasa Indonesia';
      default:
        return locale.languageCode;
    }
  }

  /// 4-letter language code (no country variant) used for persistence.
  String _toCode(Locale locale) => locale.languageCode;

  Locale? _fromCode(String code) {
    return Locale(code);
  }
}

final localeProvider =
    NotifierProvider<LocaleNotifier, Locale?>(LocaleNotifier.new);

/// The full list of languages the app ships translations for, in display
/// order. Keep this in sync with lib/l10n/app_*.arb.
const supportedAppLocales = <Locale>[
  Locale('en'),
  Locale('ur'),
  Locale('hi'),
  Locale('pa'),
  Locale('sd'),
  Locale('bn'),
  Locale('ps'),
  Locale('es'),
  Locale('pt'),
  Locale('fr'),
  Locale('de'),
  Locale('it'),
  Locale('ar'),
  Locale('tr'),
  Locale('id'),
];
