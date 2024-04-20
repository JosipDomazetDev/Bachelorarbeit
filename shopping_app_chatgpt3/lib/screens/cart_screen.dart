import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../providers/cart_provider.dart'; // Import the cart provider

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    double totalPrice = 0;
    for (Product product in cartProvider.cartItems) {
      totalPrice +=
          product.price; // Assuming each product has a 'price' property
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the product listing view
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                return _buildCartItem(context, cartProvider.cartItems[index]);
              },
            ),
          ),
          const Divider(), // Divider to separate the product list and the total price
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Price: \$${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Purchased'),
                      ),
                    );
                  },
                  child: const Text('Buy'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, Product product) {
    final cartProvider = Provider.of<CartProvider>(context,
        listen: false); // Get the cart provider

    return ListTile(
      leading: const Icon(Icons.shopping_cart),
      // Use any icon you want to represent the product
      title: Text(product.name),
      trailing: IconButton(
        icon: const Icon(Icons.remove),
        onPressed: () {
          cartProvider
              .removeProductFromCart(product); // Remove product from cart
        },
      ),
    );
  }
}
