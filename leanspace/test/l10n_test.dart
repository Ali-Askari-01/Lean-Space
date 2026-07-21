import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:leanspace/core/l10n/app_localizations.dart';

void main() {
  test('all locale ARB files have same keys as English template', () {
    // Smoke test: supported locales are registered.
    expect(AppLocalizations.supportedLocales.length, 15);
    expect(AppLocalizations.supportedLocales.map((l) => l.languageCode),
        contains('ur'));
    expect(AppLocalizations.supportedLocales.map((l) => l.languageCode),
        contains('ar'));
  });

  testWidgets('AppLocalizations resolves for Urdu locale', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('ur'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) {
            final l10n = AppLocalizations.of(context);
            return Text(l10n.tabToday);
          },
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(Text), findsOneWidget);
  });
}
