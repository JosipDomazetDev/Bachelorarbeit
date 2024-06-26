class Product {
  final int id;
  final String name;
  final double price;
  final String imageUrl;

  Product({required this.id, required this.name, required this.price, required this.imageUrl});
}

List<Product> products = [
  Product(id: 1, name: "Product 1", imageUrl: "https://picsum.photos/seed/phone/200/200", price: 10),
  Product(id: 2, name: "Product 2", imageUrl: "https://picsum.photos/seed/phone/200/200", price: 20),
  // Add more products as needed
];
