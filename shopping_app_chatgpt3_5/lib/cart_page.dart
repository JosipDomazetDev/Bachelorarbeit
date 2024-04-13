import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView.builder(
        itemCount: cartProvider.items.length,
        itemBuilder: (context, index) {
          var productId = cartProvider.items.keys.elementAt(index);
          var product = cartProvider.items[productId];
          return ListTile(
            leading: Icon(Icons.shopping_cart), // Change to product-specific icons if needed
            title: Text(product!.name),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: () => cartProvider.removeProduct(productId),
            ),
          );
        },
      ),
    );
  }
}
