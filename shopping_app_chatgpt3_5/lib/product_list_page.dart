import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_provider.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: ListView.builder(
        itemCount: productProvider.products.length,
        itemBuilder: (ctx, i) => ListTile(
          leading: Image.network(productProvider.products[i].imageUrl),
          title: Text(productProvider.products[i].name),
          trailing: ElevatedButton(
            onPressed: () {
              // Implement add to cart functionality here
              print('Add to cart');
            },
            child: Text('Add'),
          ),
        ),
      ),
    );
  }
}
