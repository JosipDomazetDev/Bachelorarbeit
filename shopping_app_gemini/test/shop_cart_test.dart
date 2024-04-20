import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_gemini/product_list_screen.dart';
import 'package:shopping_app_gemini/product_provider.dart';

void main() {
  group('AppBarTest', () {
    testWidgets('displays title in AppBar', (widgetTester) async {
      await widgetTester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ProductListProvider()),
        ],
        child: const MaterialApp(home: ProductListScreen()),
      ));

      final AppBar appBar = widgetTester.firstWidget(find.byType(AppBar));
      expect((appBar.title as Text).data, equals('Products'));
    });

    // Add another test function for the shopping cart button, potentially mocking navigation using 'mockito'.
  });
}
