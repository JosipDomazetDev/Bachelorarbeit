import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_app_chatgpt3/main.dart';
import 'package:shopping_app_chatgpt3/screens/product_listing_screen.dart';

void main() {
  testWidgets('Successful login navigates to next view', (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(MyApp());

    // Verify that the login screen is displayed
    expect(find.text('Login'), findsWidgets);

    // Enter valid username and password and tap the login button
    await tester.enterText(find.byKey(Key('usernameField')), 'valid_username');
    await tester.enterText(find.byKey(Key('passwordField')), 'valid_password');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Verify that navigation occurs to the next view after successful login
    expect(find.byType(ProductListingScreen), findsOneWidget);
  });
}
