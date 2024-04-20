import 'package:flutter/material.dart';

import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addProductToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeProductFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  bool isProductInCart(Product product) {
    return _cartItems.contains(product);
  }
}
