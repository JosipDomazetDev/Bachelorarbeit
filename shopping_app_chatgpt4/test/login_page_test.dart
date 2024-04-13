import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shopping_app_chatgpt4/main.dart';

// Create a MockNavigatorObserver
class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('Login Page Tests', () {
    testWidgets('Navigates to next view on login button press', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());


      // Act - Press the login button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Assert - Verify that a navigation event happened
      expect(find.text('Products'), findsOneWidget);
    });
  });
}
