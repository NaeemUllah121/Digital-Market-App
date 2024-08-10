class ProductsModel {
  String? id;
  String? name;
  String? shopImage;
  String? shopUrl;
  String? description;
  List<dynamic>? productImages;
  List<dynamic>? category;
  String? bannerImage;
  String? price;

  ProductsModel({
    this.id,
    this.name,
    required this.shopImage,
    this.description,
    this.shopUrl,
    this.productImages,
    this.category,
    this.bannerImage,
    this.price,
  });

  ProductsModel.fromFireStore(Map<String, dynamic> doc) {
    id = doc['id'];
    shopImage = doc['bannerImage'];
    name = doc['name'];
    description = doc['description'];
    price = doc['price'];
    shopUrl = doc['shopUrl'];
    productImages = doc['productImage'];
    category = doc['categoriesName'];
    bannerImage = doc['bannerImage'];
  }
}
