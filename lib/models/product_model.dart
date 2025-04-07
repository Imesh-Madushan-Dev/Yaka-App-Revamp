class Product {
  final String title;
  final String price;
  final String imagePath;
  final double rating;

  Product(
      {required this.title,
      required this.price,
      required this.imagePath,
      this.rating = 0.0});
}