class MarketsModel {
  String? name;
  String? cityName;
  String? url;
  String? bannerImage;

  MarketsModel({
    this.name,
    this.cityName,
    this.url,
    this.bannerImage,
  });

  MarketsModel.fromFireStore(Map<String, dynamic> doc) {
    cityName = doc['province'];
    name = doc['name'];
    url = doc['url'];
    bannerImage = doc['bannerImage'];
  }
}
