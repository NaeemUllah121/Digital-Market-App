class SetUserData {
  String userName;
  String userImage;
  String email;

  SetUserData(
      {required this.userName, required this.userImage, required this.email});

  // Convert SetUserData to a map for serialization
  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'userImage': userImage,
      'email': email,
    };
  }

  // Create a SetUserData from a map (deserialization)
  factory SetUserData.fromMap(Map<String, dynamic> map) {
    return SetUserData(
      userName: map['userName'],
      userImage: map['userImage'],
      email: map['email'],
    );
  }
}
