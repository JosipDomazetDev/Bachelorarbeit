import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../providers/cart_provider.dart';

class ProductListingScreen extends StatelessWidget {
  const ProductListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Listing'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(
                  context, '/cart'); // Navigate to the cart view
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return _buildProductItem(context, products[index]);
        },
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, Product product) {
    final cartProvider = Provider.of<CartProvider>(context,
        listen: false); // Get the cart provider

    return ListTile(
      leading: Image.network(
        product.imageUrl,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Text("Image not found");
        },
      ),
      title: Text(product.name),
      trailing: Consumer<CartProvider>(
        builder: (context, cart, _) {
          return IconButton(
            icon: cart.isProductInCart(product)
                ? const Icon(Icons.check)
                : const Icon(Icons.add),
            onPressed: () {
              if (!cart.isProductInCart(product)) {
                cart.addProductToCart(product);
              }
            },
          );
        },
      ),
    );
  }
}
