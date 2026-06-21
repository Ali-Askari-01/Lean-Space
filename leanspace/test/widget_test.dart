import 'package:flutter_test/flutter_test.dart';
import 'package:leanspace/main.dart';

void main() {
  testWidgets('Config error app renders setup message', (tester) async {
    await tester.pumpWidget(const LeanSpaceConfigErrorApp());
    expect(find.text('Setup required'), findsOneWidget);
    expect(find.text('Supabase is not configured'), findsOneWidget);
  });
}
