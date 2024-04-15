import 'package:flutter/foundation.dart';
import 'package:shopping_app_gemini/product_model.dart';

class ProductListProvider extends ChangeNotifier {
  final List<Product> _productList = [
    Product(id: 1, imageUrl: 'https://picsum.photos/seed/phone/200/200', name: 'Product 1'),
    Product(id: 2, imageUrl: 'https://picsum.photos/seed/phone/200/200', name: 'Product 2'),
    // Add more products to the list
  ];

  List<Product> get productList => _productList;

  void addProduct(Product product) {
    _productList.add(product);
    notifyListeners();
  }

  static final ProductListProvider instance = ProductListProvider();
}
