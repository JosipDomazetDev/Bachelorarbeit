class Product {
  final int id;
  final String imageUrl;
  final String name;
  final double price; // Optional, add if needed
  bool isAdded = false;

  Product({
    required this.id,
    required this.imageUrl,
    required this.name,
    this.price = 0.0, // Set default price if not provided
  });
}
