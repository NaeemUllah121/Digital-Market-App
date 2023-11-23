class LoginModel {
  String? token;
  bool? status;
  String? message;
  Data? data;

  LoginModel({this.token, this.status, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? firstName;
  String? lastName;
  String? userType;
  String? email;
  String? mobileNumber;
  String? school;
  String? schoolType;

  Data(
      {this.id,
        this.firstName,
        this.lastName,
        this.userType,
        this.email,
        this.mobileNumber,
        this.school,
        this.schoolType});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userType = json['user_type'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    school = json['school'];
    schoolType = json['school_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['user_type'] = this.userType;
    data['email'] = this.email;
    data['mobile_number'] = this.mobileNumber;
    data['school'] = this.school;
    data['school_type'] = this.schoolType;
    return data;
  }
}
