import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_chatgpt4/test_utils.dart';
import 'product_provider.dart';
import 'cart_provider.dart';
import 'cart_page.dart'; // Assuming you have a CartPage widget defined

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        actions: <Widget>[
          IconButton(
            key: const ValueKey('cartButton'),
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: Provider.of<ProductProvider>(context).products.length,
        itemBuilder: (ctx, i) => _buildProductItem(ctx, i),
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, int index) {
    final product = Provider.of<ProductProvider>(context).products[index];
    final cartProvider = Provider.of<CartProvider>(context);

    return ListTile(
      leading: isTestMode()
          ? const SizedBox()
          : Image.network(
              product.imageUrl,
              errorBuilder: (context, error, stackTrace) {
                return const Text("Image not found");
              },
            ),
      title: Text(product.name),
      trailing: cartProvider.isProductInCart(product.id)
          ? Icon(Icons.check_circle, color: Colors.green)
          : ElevatedButton(
        onPressed: () {
          cartProvider.addProduct(product);
        },
        child: Text('Add'),
      ),
    );
  }
}
