import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

/// Resolves the active app locale: saved override, then device match, then English.
Locale resolveAppLocale(Locale? savedLocale, Locale? deviceLocale) {
  if (savedLocale != null) return savedLocale;
  final supported = AppLocalizations.supportedLocales;
  if (deviceLocale != null) {
    for (final locale in supported) {
      if (locale.languageCode == deviceLocale.languageCode) {
        return locale;
      }
    }
  }
  return const Locale('en');
}
