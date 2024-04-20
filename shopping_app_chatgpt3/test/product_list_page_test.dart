import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_app_chatgpt3/main.dart';
import 'package:shopping_app_chatgpt3/models/product.dart';

void main() {
  testWidgets('Product list is properly displayed in ListView',
      (tester) async {
    // Build the widget tree
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Verify that all products are visible and scrollable within the ListView
    expect(find.byType(ListView), findsOneWidget);
    expect(
        find.byType(ListTile),
        findsNWidgets(
            products.length)); // Assuming 'products' is a list of test products
  });
}
