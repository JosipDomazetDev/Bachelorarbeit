import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_provider.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<ProductListProvider>(context).productList;

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];
          return ListTile(
            leading: Image.asset(product.imageUrl),
            title: Text(product.name),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // Simulate adding to cart (can be extended later)
                print('Adding product ${product.name} to cart');
              },
            ),
          );
        },
      ),
    );
  }
