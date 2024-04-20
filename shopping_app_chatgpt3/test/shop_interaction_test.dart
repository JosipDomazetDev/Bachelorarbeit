import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_chatgpt3/models/product.dart';
import 'package:shopping_app_chatgpt3/providers/cart_provider.dart';
import 'package:shopping_app_chatgpt3/screens/cart_screen.dart';

void main() {
  testWidgets('Remove item from shopping cart', (tester) async {
    final cartProvider = CartProvider();
    cartProvider.addProductToCart(
        Product(id: 1, name: 'Test Product', imageUrl: 'url', price: 9.99));

    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return cartProvider;
        }),
      ],
      child: const MaterialApp(home: CartScreen()),
    ));

    // Tap the "Remove" button for a product
    await tester.tap(find.byIcon(Icons.remove).first);
    await tester.pump();

    // Verify that the product is removed from the cart
    expect(find.text('Test Product'), findsNothing);
  });
}
