import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_app_gemini/main.dart';

void main() {
  group('LoginPage Test', () {
    testWidgets('navigates to next view on successful login',
        (tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.text('Products'), findsOneWidget);
    });
  });
}
