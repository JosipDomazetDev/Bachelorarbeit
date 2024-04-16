import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_provider.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<ProductListProvider>(context).productList;

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
                  leading: Image.asset(product.imageUrl),
                  title: Text(product.name),
                  trailing: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      final provider = Provider.of<ProductListProvider>(context,
                          listen: false);
                      provider.productList
                          .removeWhere((p) => p.id == product.id);
                      provider.notifyListeners();
                    },
                  ),
                );
              },
            ),
    );
  }
}
