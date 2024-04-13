import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'login_page.dart';
import 'navigation_service.dart'; // Assuming you use a navigation service

// Create a MockNavigatorObserver
class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('Login Page Tests', () {
    testWidgets('Navigates to next view on login button press', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();

      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: LoginPage(),
          navigatorObservers: [mockObserver],
        ),
      );

      // Act - Press the login button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Assert - Verify that a navigation event happened
      verify(mockObserver.didPush(any, any));
    });
  });
}
