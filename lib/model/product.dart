class Product {
  final int id;
  final String title;
  final String description;
  final String price;
  final String category;
  final String image;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.category,
      required this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toString(),
      category: json['category']['name'],
      image: json['images'][0],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'image': image,
    };
  }
}
