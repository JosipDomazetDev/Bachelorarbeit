class Product {
  final int id;
  final String name;
  final String imageUrl;

  Product({required this.id, required this.name, required this.imageUrl});
}

List<Product> products = [
  Product(id: 1, name: "Product 1", imageUrl: "https://picsum.photos/seed/phone/200/200"),
  Product(id: 2, name: "Product 2", imageUrl: "https://picsum.photos/seed/phone/200/200"),
  // Add more products as needed
];
