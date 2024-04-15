import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Listing'),
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
    return ListTile(
      leading: Image.network(
        product.imageUrl,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
      title: Text(product.name),
      trailing: ElevatedButton(
        onPressed: () {
          // Add functionality to add product to cart
        },
        child: Text('Add'),
      ),
    );
  }
}
