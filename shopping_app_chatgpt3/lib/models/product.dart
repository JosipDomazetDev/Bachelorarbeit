class Product {
  final int id;
  final String name;
  final String imageUrl;

  Product({required this.id, required this.name, required this.imageUrl});
}

List<Product> products = [
  Product(id: 1, name: "Product 1", imageUrl: "url_to_image_1"),
  Product(id: 2, name: "Product 2", imageUrl: "url_to_image_2"),
  // Add more products as needed
];
