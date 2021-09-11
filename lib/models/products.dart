class Product {
  Product(
      {required this.price,
      required this.label,
      required this.image,
      required this.description,
      required this.unit});
  late String? label, description, image;
  late double? price;
  late int? unit;
}

class ProductsList {
  List<Product> productList = [
    Product(
        price: 25.99,
        label: "Fendi  Frames",
        image: "assets/images/fendi/fiery FENDI.jpg",
        description: "lorem",
        unit: 1),
  ];
}
