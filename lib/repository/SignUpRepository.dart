// ignore_for_file: file_names

import 'dart:convert';
import 'package:digital_market/models/SignUpModel.dart';
import 'package:digital_market/store/local_store.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../utill/url_Paths.dart';
import '../utill/url_base.dart';

class SignUpRepository extends GetConnect {
  Future<SignUpModel> signUp(String fistName, String lastName, String email,
      String number, String userType, String password) async {
    final formData = {
      'userName': fistName,
      'mobile_number': number,
      'user_type': userType,
      'password': password
    };
    final jsonData = jsonEncode(formData);
    if (kDebugMode) {
      print(jsonData);
    }
    final response = await post(
      BaseUrl.baseUrl + UrlPathHelper.getValue(UrlPath.register),
      json.decode(jsonData),
      headers: {
        "Content-Type": "application/json",
      },
    );
    if (kDebugMode) {
      (SignUpModel.fromJson(response.body));
    }
    return SignUpModel.fromJson(response.body);
  }

  Future<SignUpModel> changePassword(
      String oldPassword, String newPassword) async {
    final formData = {
      'currentPassword': oldPassword,
      'newPassword': newPassword,
    };
    final jsonData = jsonEncode(formData);
    String accessToken = await LocalStore.instance.getAccessToken();
    if (kDebugMode) {
      print(jsonData);
    }
    if (kDebugMode) {
      print(accessToken);
    }
    final response = await post(
      BaseUrl.baseUrl + UrlPathHelper.getValue(UrlPath.changePassword),
      json.decode(jsonData),
      headers: {
        "Content-Type": "application/json",
        "Authorization": accessToken
      },
    );

    if (kDebugMode) {
      print(SignUpModel.fromJson(response.body));
    }
    return SignUpModel.fromJson(response.body);
  }

  Future<SignUpModel> verifyPin(String pin) async {
    final formData = {
      'code': pin,
    };
    final jsonData = jsonEncode(formData);
    String accessToken = await LocalStore.instance.getAccessToken();
    if (kDebugMode) {
      print(jsonData);
    }
    if (kDebugMode) {
      print(accessToken);
    }
    final response = await post(
      BaseUrl.baseUrl + UrlPathHelper.getValue(UrlPath.verifyPin),
      json.decode(jsonData),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (kDebugMode) {
      print(SignUpModel.fromJson(response.body));
    }
    return SignUpModel.fromJson(response.body);
  }

  Future<SignUpModel> forgetPasswordRequest(String phoneNumber) async {
    final formData = {
      'number': phoneNumber,
    };
    final jsonData = jsonEncode(formData);
    if (kDebugMode) {
      print(jsonData);
    }
    final response = await post(
      BaseUrl.baseUrl + UrlPathHelper.getValue(UrlPath.forgetPasswordRequest),
      json.decode(jsonData),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (kDebugMode) {
      print(SignUpModel.fromJson(response.body));
    }
    return SignUpModel.fromJson(response.body);
  }

  Future<SignUpModel> forgetPasswordComplete(
      String code, String password) async {
    final formData = {'code': code, 'password': password};
    final jsonData = jsonEncode(formData);
    if (kDebugMode) {
      print(jsonData);
    }
    final response = await post(
      BaseUrl.baseUrl + UrlPathHelper.getValue(UrlPath.forgetPasswordComplete),
      json.decode(jsonData),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (kDebugMode) {
      print(SignUpModel.fromJson(response.body));
    }
    return SignUpModel.fromJson(response.body);
  }
}
