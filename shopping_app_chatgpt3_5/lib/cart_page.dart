import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          var productId = cart.items.keys.elementAt(index);
          var product = cart.items[productId];
          return ListTile(
            title: Text(product!.name),
            leading: Image.network(product.imageUrl),
            trailing: Text('1'), // Example quantity, modify as needed
          );
        },
      ),
    );
  }
}
