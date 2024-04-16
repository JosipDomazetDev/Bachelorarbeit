import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_gemini/cart_view.dart';
import 'package:shopping_app_gemini/product_provider.dart';

void main() {
  group('ShoppingCartViewTest', () {
    testWidgets('removes product on clicking remove button',
        (WidgetTester tester) async {
      var productListProvider = ProductListProvider();
      productListProvider.addProduct(productListProvider.productList[0]);

      await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) {
            return productListProvider;
          }),
        ],
        child: MaterialApp(home: CartView()),
      ));

      final removeButton = find.byType(IconButton).first;
      await tester.tap(removeButton);
      await tester.pumpAndSettle();

      expect(find.text('Product 1'), findsNothing);
    });

    // Add similar test functions for total price, buy button, and purchase process (verifying snackbar display).
  });
}
