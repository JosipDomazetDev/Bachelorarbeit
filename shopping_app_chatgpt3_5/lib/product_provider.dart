import 'package:flutter/material.dart';
import 'product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [
    Product(
      id: '1',
      name: 'iPhone 12',
      imageUrl: 'https://example.com/iphone12.jpg',
    ),
    Product(
      id: '2',
      name: 'Samsung Galaxy S21',
      imageUrl: 'https://example.com/galaxys21.jpg',
    ),
    // Add more products as needed
  ];

  List<Product> get products => _products;
}
