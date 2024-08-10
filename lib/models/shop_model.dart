class ShopModel {
  String? name;
  String? shopMarket;
  String? url;

  ShopModel({
    this.name,
    this.shopMarket,
    this.url,
  });

  ShopModel.fromFireStore(Map<String, dynamic> doc) {
    shopMarket = doc['province'];
    name = doc['name'];
    url = doc['url'];
  }
}
