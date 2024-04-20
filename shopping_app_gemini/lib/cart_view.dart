import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_gemini/product_model.dart';

import 'product_provider.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  double calculateTotalPrice(List<Product> products) {
    double totalPrice = 0.0;
    for (var product in products) {
      totalPrice += product.price; // Assuming price exists in the product model
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    final productList =
        Provider.of<ProductListProvider>(context).cartProductList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: productList.isEmpty
          ? const Center(child: Text('No items in the cart'))
          : ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final product = productList[index];
                return ListTile(
                  leading: Image.network(
                    product.imageUrl,
                    errorBuilder: (context, error, stackTrace) {
                      return const Text("Image not found");
                    },
                  ),
                  title: Text(product.name),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      final provider = Provider.of<ProductListProvider>(context,
                          listen: false);
                      product.isAdded = false;
                      provider.notifyListeners();
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Price:'),
                Text(
                  calculateTotalPrice(productList).toStringAsFixed(2),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
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
    );
  }
}
