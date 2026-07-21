import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../l10n/app_localizations.dart';

/// Per-user language override. When null, the system locale is used.
class LocaleNotifier extends Notifier<Locale?> {
  static const _key = 'app_locale';

  bool _hydrated = false;
  bool _hydrating = false;
  bool get isHydrated => _hydrated;

  @override
  Locale? build() {
    return null;
  }

  /// Await before showing UI so splash uses the saved locale.
  Future<void> ensureHydrated() async {
    if (_hydrated || _hydrating) return;
    _hydrating = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final code = prefs.getString(_key);
      if (code != null && code.isNotEmpty) {
        state = Locale(code);
      }
    } catch (_) {
      // Default to system locale on any failure.
    }
    _hydrated = true;
    _hydrating = false;
  }

  Future<void> set(Locale? locale) async {
    state = locale;
    _hydrated = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      if (locale == null) {
        await prefs.remove(_key);
      } else {
        await prefs.setString(_key, locale.languageCode);
      }
    } catch (_) {
      // Best-effort persistence.
    }
  }

  /// Human-readable label for the picker UI (native script where applicable).
  String labelFor(Locale? locale, [AppLocalizations? l10n]) {
    if (locale == null) {
      return l10n?.languageSystemDefault ?? 'System default';
    }
    switch (locale.languageCode) {
      case 'en':
        return l10n?.languageNameEn ?? 'English';
      case 'es':
        return l10n?.languageNameEs ?? 'Español';
      case 'pt':
        return l10n?.languageNamePt ?? 'Português';
      case 'fr':
        return l10n?.languageNameFr ?? 'Français';
      case 'de':
        return l10n?.languageNameDe ?? 'Deutsch';
      case 'it':
        return l10n?.languageNameIt ?? 'Italiano';
      case 'ar':
        return l10n?.languageNameAr ?? 'العربية';
      case 'tr':
        return l10n?.languageNameTr ?? 'Türkçe';
      case 'id':
        return l10n?.languageNameId ?? 'Bahasa Indonesia';
      default:
        return locale.languageCode;
    }
  }
}

final localeProvider =
    NotifierProvider<LocaleNotifier, Locale?>(LocaleNotifier.new);

/// The full list of languages the app ships translations for, in display
/// order. Keep this in sync with lib/l10n/app_*.arb.
const supportedAppLocales = <Locale>[
  Locale('en'),
  Locale('es'),
  Locale('pt'),
  Locale('fr'),
  Locale('de'),
  Locale('it'),
  Locale('ar'),
  Locale('tr'),
  Locale('id'),
];
