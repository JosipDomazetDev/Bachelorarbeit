import 'package:flutter/foundation.dart';
import 'package:shopping_app_gemini/product_model.dart';

class ProductListProvider extends ChangeNotifier {
  final List<Product> _productList = [
    Product(id: 1, imageUrl: 'https://picsum.photos/seed/phone/200/200', name: 'Product 1' , price: 10.0),
    Product(id: 2, imageUrl: 'https://picsum.photos/seed/phone/200/200', name: 'Product 2', price: 20.0),
    // Add more products to the list
  ];

  List<Product> get productList => _productList;
  List<Product> get cartProductList => _productList.where((product) => product.isAdded).toList();

  void addProduct(Product product) {
    if (!cartProductList.contains(product)) {
      product.isAdded = true; // Set flag if added (optional)
      cartProductList.add(product);
    }
    notifyListeners();
  }

  static final ProductListProvider instance = ProductListProvider();
}
