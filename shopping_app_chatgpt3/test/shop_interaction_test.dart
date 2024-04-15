import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_app_chatgpt3/main.dart';

void main() {
  testWidgets('Remove item from shopping cart', (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(MyApp());

    // Tap the "Remove" button for a product
    await tester.tap(find.byIcon(Icons.remove).first);
    await tester.pump();

    // Verify that the product is removed from the cart
    expect(find.text('Product Name'), findsNothing);
  });
}
