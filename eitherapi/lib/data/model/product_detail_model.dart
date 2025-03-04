class ProductDetail {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final List<String>? images;

  ProductDetail(
      {this.id, this.title, this.price, this.description, this.images});

  factory ProductDetail.fromJson(Map<String, dynamic> json) {
    return ProductDetail(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      images: json['images'],
    );
  }
}
