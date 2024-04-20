import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_view.dart';
import 'product_provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<ProductListProvider>(context).productList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const CartView()));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];
          return ListTile(
            leading: Image.network(product.imageUrl,
              errorBuilder: (context, error, stackTrace) {
                return const Text("Image not found");
              },
            ),
            title: Text(product.name),
            trailing: IconButton(
              icon: product.isAdded ? const Icon(Icons.check) : const Icon(Icons.add),
              onPressed: () {
                Provider.of<ProductListProvider>(context, listen: false)
                    .addProduct(product);
              },
            ),
          );
        },
      ),
    );
  }
}
