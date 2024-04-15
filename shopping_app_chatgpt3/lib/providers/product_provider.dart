import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  ProductProvider() {
    // Initialize product list here (if required)
    _loadProducts();
  }

  void _loadProducts() {
    // Simulate loading product data
    _products = products; // Use your actual product data here
    notifyListeners();
  }
}
