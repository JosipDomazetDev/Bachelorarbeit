import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_chatgpt4/cart_page.dart';
import 'package:shopping_app_chatgpt4/cart_provider.dart';
import 'package:shopping_app_chatgpt4/product.dart';

void main() {
  testWidgets('Clicking "Remove" button removes product from cart',
      (WidgetTester tester) async {
    // Setup a CartProvider with one item
    final cartProvider = CartProvider();
    cartProvider.addProduct(
        Product(id: '1', name: 'Test Product', imageUrl: 'url', price: 9.99));

    await tester.pumpWidget(Provider<CartProvider>(
      create: (_) => cartProvider,
      child: MaterialApp(home: CartPage()),
    ));

    // Verify the product is initially in the cart
    expect(find.text('Test Product'), findsOneWidget);

    // Act - remove the product
    await tester.tap(find.byIcon(Icons.remove_circle_outline));
    await tester.pumpAndSettle(); // Allow UI to update

    // Assert - product is removed
    expect(find.text('Test Product'), findsNothing);
  });

  testWidgets('Total price and "Buy" button are displayed correctly',
      (WidgetTester tester) async {
    final cartProvider = CartProvider();
    cartProvider.addProduct(
        Product(id: '1', name: 'Product 1', imageUrl: 'url1', price: 20.00));
    cartProvider.addProduct(
        Product(id: '2', name: 'Product 2', imageUrl: 'url2', price: 30.00));

    await tester.pumpWidget(Provider<CartProvider>(
      create: (_) => cartProvider,
      child: MaterialApp(home: CartPage()),
    ));

    // Verify total price and buy button
    expect(find.text('Total: \$50.00'), findsOneWidget);
    expect(find.text('Buy'), findsOneWidget);
  });

  testWidgets('Clicking "Buy" button triggers snackbar with "Purchased"',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CartPage()));

    // Simulate clicking the buy button
    await tester.tap(find.text('Buy'));
    await tester.pump(); // Trigger a frame for the snackbar to show up

    // Verify snackbar shows up with the correct text
    expect(find.text('Purchased'), findsOneWidget);
    expect(find.byType(SnackBar), findsOneWidget);
  });
}
