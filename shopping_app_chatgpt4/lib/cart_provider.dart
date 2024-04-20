import 'package:flutter/material.dart';
import 'product.dart';

class CartProvider with ChangeNotifier {
  final Map<String, Product> _items = {};

  Map<String, Product> get items => _items;

  double get totalPrice => _items.values.fold(0.0, (sum, item) => sum + item.price);

  void addProduct(Product product) {
    if (_items.containsKey(product.id)) {
      // Product is already in cart, this case can be expanded to increase quantity
      return;
    } else {
      _items.putIfAbsent(product.id, () => product);
      notifyListeners();
    }
  }

  void removeProduct(String productId) {
    if (_items.containsKey(productId)) {
      _items.remove(productId);
      notifyListeners();
    }
  }

  bool isProductInCart(String productId) {
    return _items.containsKey(productId);
  }
}
