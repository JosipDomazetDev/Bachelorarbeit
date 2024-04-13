import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_chatgpt4/cart_page.dart';
import 'package:shopping_app_chatgpt4/cart_provider.dart';
import 'package:shopping_app_chatgpt4/product.dart';
import 'package:shopping_app_chatgpt4/product_list_page.dart';
import 'package:shopping_app_chatgpt4/product_provider.dart';

void main() {
  testWidgets('AppBar title is correct', (WidgetTester tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(home: ProductListPage()),
    ));
    expect(find.text('Products'), findsOneWidget);
  });

  testWidgets('Shopping cart button opens the cart view', (WidgetTester tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(home: ProductListPage()),
    ));
    await tester.tap(find.byKey(const ValueKey('cartButton')));
    await tester.pumpAndSettle(); // Allow navigation to complete
    expect(find.text('Your Cart'), findsOneWidget);
  });

  testWidgets('Shopping cart view layout is correct', (WidgetTester tester) async {
    // Assuming that CartProvider and CartPage are properly set up and integrated
    var cartProvider = CartProvider();
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) {
          return cartProvider;
        }),
      ],
      child: MaterialApp(home: CartPage()),
    ));

    cartProvider.addProduct(Product(id: '1', name: 'Product 1', price: 10.0, imageUrl: ''));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.shopping_cart), findsWidgets);
    expect(find.text("Product 1"), findsWidgets);
    expect(find.byIcon(Icons.remove_circle_outline), findsWidgets);
  });

  testWidgets('Back button in shopping cart view works', (WidgetTester tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(home: ProductListPage()),
    ));
    await tester.tap(find.text("Add").first);
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey('cartButton')));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle(); // Allow navigation to complete
    expect(find.text('Products'), findsOneWidget); // Assuming the product list view is titled "Products"
  });
}
