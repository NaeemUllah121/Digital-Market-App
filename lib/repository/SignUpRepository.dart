import 'dart:convert';

import 'package:get/get.dart';
import '../models/LoginModel.dart';
import '../utill/url_Paths.dart';
import '../utill/url_base.dart';

class SignUpRepository extends GetConnect{
  Future<LoginModel> login(String number, String password) async {
    final formData = {'mobile_number': number, 'password': password};
    final jsonData = jsonEncode(formData);

    final response = await post(
      BaseUrl.baseUrl + UrlPathHelper.getValue(UrlPath.login),
      json.decode(jsonData),
      headers: {
        "Content-Type": "application/json",
      },
    );

    print(response.statusCode);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      print(LoginModel.fromJson(response.body));
      return LoginModel.fromJson(response.body);
    }
  }
}