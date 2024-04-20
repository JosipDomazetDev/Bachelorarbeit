import 'package:flutter/material.dart';
import 'product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'iPhone 12',
      imageUrl: 'https://picsum.photos/seed/phone/200/200',
      price: 10
    ),
    Product(
      id: '2',
      name: 'Samsung Galaxy S21',
      imageUrl: 'https://picsum.photos/seed/phone/200/200',
      price: 20
    ),
    // Add more products as needed
  ];

  List<Product> get products => _products;
}
