class UserModel {
  String? id;
  String? name;
  String? email;
  String? url;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.url,
  });

  UserModel.fromFirestore(Map<String, dynamic> doc) {
    id = doc['id'];
    name = doc['name'];
    email = doc['email'];
    url = doc['url'];
  }
}
