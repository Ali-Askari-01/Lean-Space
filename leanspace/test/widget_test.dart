import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leanspace/core/widgets/bloom_splash.dart';

void main() {
  testWidgets('BloomSplash renders the Bloom Tracker wordmark', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: BloomSplash(showSpinner: false),
    ));
    expect(find.text('Bloom Tracker'), findsOneWidget);
  });
}
