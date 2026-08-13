import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:daily_stitch/core/l10n/app_localizations.dart';
import 'package:daily_stitch/core/widgets/bloom_splash.dart';

void main() {
  testWidgets('BloomSplash renders mascot mark and app title', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: BloomSplash(showSpinner: false),
    ));
    expect(find.byType(CustomPaint), findsWidgets);
    expect(find.text('Daily Stitch'), findsOneWidget);
  });
}
