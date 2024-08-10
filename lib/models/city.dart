class CitiesModel {
  String? name;
  String? province;
  String? url;
  String? bannerImage;

  CitiesModel({
    this.name,
    this.province,
    this.url,
    this.bannerImage,
  });

  CitiesModel.fromFireStore(Map<String, dynamic> doc) {
    province = doc['province'];
    name = doc['name'];
    url = doc['url'];
    bannerImage = doc['bannerImage'];
  }
}
