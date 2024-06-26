import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_chatgpt4/cart_provider.dart';
import 'package:shopping_app_chatgpt4/product_list_page.dart';
import 'package:shopping_app_chatgpt4/product_provider.dart';

void main() {
  testWidgets(
      'Verify that the product list is properly displayed in a ListView',
      (tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: const MaterialApp(home: ProductListPage()),
    ));

    // Verify all products are loaded into the ListView
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(ListTile), findsWidgets);
  });

  testWidgets('Check the layout of each item in the product list',
      (tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: const MaterialApp(home: ProductListPage()),
    ));

    // Verify the layout of list items
    expect(find.text('Add'), findsWidgets);
    expect(find.byType(Text), findsWidgets); // Check for product names
  });

  testWidgets('Test adding a product to the shopping cart',
      (tester) async {
    final cartProvider = CartProvider();
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProductProvider()),
          ChangeNotifierProvider(create: (_) => cartProvider),
        ],
        child: const MaterialApp(home: ProductListPage()),
      ),
    );

    // Simulate tapping the 'Add' button
    await tester.tap(find.text('Add').first);
    await tester.pump();

    // Check if product is added
    expect(cartProvider.items.length, 1);
  });

  testWidgets('Verify UI updates after adding a product to the cart',
      (tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProductProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
        ],
        child: const MaterialApp(home: ProductListPage()),
      ),
    );

    // Tap 'Add' and pump to update the UI
    await tester.tap(find.text('Add').first);
    await tester.pump();

    // Verify UI change
    expect(find.byIcon(Icons.check_circle), findsOneWidget);
  });
}
