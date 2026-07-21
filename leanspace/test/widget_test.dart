import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leanspace/core/l10n/app_localizations.dart';
import 'package:leanspace/core/widgets/bloom_splash.dart';

void main() {
  testWidgets('BloomSplash renders mascot mark without wordmark', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: BloomSplash(showSpinner: false),
    ));
    expect(find.text('Bloom Tracker'), findsNothing);
    expect(find.byType(Image), findsOneWidget);
  });
}
