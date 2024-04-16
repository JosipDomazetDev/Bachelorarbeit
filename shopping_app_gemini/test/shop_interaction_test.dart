import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_gemini/cart_view.dart';
import 'package:shopping_app_gemini/product_model.dart';
import 'package:shopping_app_gemini/product_provider.dart';

class MockProductListProvider extends Mock implements ProductListProvider {}

void main() {
  group('ShoppingCartViewTest', () {
    test('removes product on clicking remove button', () async {
      final mockProvider = MockProductListProvider();
      when(mockProvider.productList).thenReturn([
        Product(id: 1, imageUrl: 'image.jpg', name: 'Product 1', price: 10.0),
      ]);

      final widgetTester = WidgetTester();

      await widgetTester.pumpWidget(
        MaterialApp(
          home: Provider<ProductListProvider>.value(
            value: mockProvider,
            child: CartView(),
          ),
        ),
      );

      final removeButton = tester.firstWidget(find.byType(IconButton).first);
      await tester.tap(removeButton);

      verify(mockProvider.removeProduct(
          any)); // Replace 'any' with product verification if needed
    });

    // Add similar test functions for total price, buy button, and purchase process (verifying snackbar display).
  });
}
