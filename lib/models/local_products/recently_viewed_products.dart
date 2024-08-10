import 'package:hive/hive.dart';

part 'recently_viewed_products.g.dart';

@HiveType(typeId: 1)
class LocalProducts extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? shopImage;
  @HiveField(3)
  String? shopUrl;
  @HiveField(4)
  String? description;
  @HiveField(5)
  List<dynamic>? productImages;
  @HiveField(6)
  List<dynamic>? category;
  @HiveField(7)
  String? bannerImage;
  @HiveField(8)
  String? price;

  LocalProducts(
      {this.id,
      this.name,
      this.shopUrl,
      this.description,
      this.productImages,
      this.category,
      this.bannerImage,
      this.price,
      this.shopImage});
}
