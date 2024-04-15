import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../providers/cart_provider.dart'; // Import the cart provider

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the product listing view
          },
        ),
      ),
      body: ListView.builder(
        itemCount: cartProvider.cartItems.length,
        itemBuilder: (context, index) {
          return _buildCartItem(context, cartProvider.cartItems[index]);
        },
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, Product product) {
    final cartProvider = Provider.of<CartProvider>(context,
        listen: false); // Get the cart provider

    return ListTile(
      leading: Icon(Icons.shopping_cart),
      // Use any icon you want to represent the product
      title: Text(product.name),
      trailing: IconButton(
        icon: Icon(Icons.remove),
        onPressed: () {
          cartProvider
              .removeProductFromCart(product); // Remove product from cart
        },
      ),
    );
  }
}
