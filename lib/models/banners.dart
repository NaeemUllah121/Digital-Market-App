class BannersModel {
  String? name;
  String? marketName;
  String? url;
  String? bannerImage;

  BannersModel({
    this.name,
    this.marketName,
    this.url,
    this.bannerImage,
  });

  BannersModel.fromFireStore(Map<String, dynamic> doc) {
    marketName = doc['marketName'];
    name = doc['name'];
    url = doc['url'];
    bannerImage = doc['bannerImage'];
  }
}
