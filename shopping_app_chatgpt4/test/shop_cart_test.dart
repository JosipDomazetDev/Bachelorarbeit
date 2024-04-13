import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_chatgpt4/cart_page.dart';
import 'package:shopping_app_chatgpt4/product_list_page.dart';

void main() {
  testWidgets('AppBar title is correct', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ProductListPage()));
    expect(find.text('Products'), findsOneWidget);
  });

  testWidgets('Shopping cart button opens the cart view', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ProductListPage()));
    await tester.tap(find.byIcon(Icons.shopping_cart));
    await tester.pumpAndSettle(); // Allow navigation to complete
    expect(find.text('Your Cart'), findsOneWidget);
  });

  testWidgets('Shopping cart view layout is correct', (WidgetTester tester) async {
    // Assuming that CartProvider and CartPage are properly set up and integrated
    await tester.pumpWidget(MaterialApp(home: CartPage()));
    expect(find.byIcon(Icons.shopping_cart), findsWidgets);
    expect(find.text('Remove'), findsWidgets);
    expect(find.byIcon(Icons.remove_circle_outline), findsWidgets);
  });

  testWidgets('Back button in shopping cart view works', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CartPage()));
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle(); // Allow navigation to complete
    expect(find.text('Products'), findsOneWidget); // Assuming the product list view is titled "Products"
  });
}
