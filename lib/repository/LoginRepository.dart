// ignore_for_file: file_names

import 'dart:convert'; // Import the dart:convert library
import 'package:digital_market/models/LoginModel.dart';
import 'package:digital_market/utill/url_Paths.dart';
import 'package:digital_market/utill/url_base.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class LoginRepository extends GetConnect {
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
    if (kDebugMode) {
      print(response.statusCode);
    }


      if (kDebugMode) {
        print(LoginModel.fromJson(response.body));
      }
      return LoginModel.fromJson(response.body);
    }

}
