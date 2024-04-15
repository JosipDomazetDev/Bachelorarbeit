import 'package:flutter/foundation.dart';
import 'package:shopping_app_gemini/product_model.dart';

class ProductListProvider extends ChangeNotifier {
  final List<Product> _productList = [
    Product(id: 1, imageUrl: 'assets/images/product1.jpg', name: 'Product 1'),
    Product(id: 2, imageUrl: 'assets/images/product2.jpg', name: 'Product 2'),
    // Add more products to the list
  ];

  List<Product> get productList => _productList;

  void addProduct(Product product) {
    _productList.add(product);
    notifyListeners();
  }

  static final ProductListProvider instance = ProductListProvider();
}
