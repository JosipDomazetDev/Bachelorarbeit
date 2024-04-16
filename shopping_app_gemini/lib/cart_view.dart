import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_gemini/product_model.dart';

import 'product_provider.dart';

class CartView extends StatelessWidget {
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
        title: Text('Shopping Cart'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: productList.isEmpty
          ? Center(child: Text('No items in the cart'))
          : ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final product = productList[index];
                return ListTile(
                  leading: Image.network(product.imageUrl),
                  title: Text(product.name),
                  trailing: IconButton(
                    icon: Icon(Icons.remove),
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
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Price:'),
                Text(
                  NumberFormat.currency(symbol: '\$')
                      .format(calculateTotalPrice(productList)),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Purchased'),
                  ),
                );
              },
              child: Text('Buy'),
            ),
          ],
        ),
      ),
    );
  }
}
