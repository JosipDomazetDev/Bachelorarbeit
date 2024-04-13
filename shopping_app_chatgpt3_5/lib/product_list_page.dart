import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_provider.dart';
import 'cart_provider.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: ListView.builder(
        itemCount: productProvider.products.length,
        itemBuilder: (ctx, i) {
          var product = productProvider.products[i];
          bool isInCart = cartProvider.isProductInCart(product.id);

          return ListTile(
            leading: Image.network(product.imageUrl),
            title: Text(product.name),
            trailing: isInCart
                ? Icon(Icons.check_circle, color: Colors.green)
                : ElevatedButton(
              onPressed: () {
                cartProvider.addProduct(product);
              },
              child: Text('Add'),
            ),
          );
        },
      ),
    );
  }
}
