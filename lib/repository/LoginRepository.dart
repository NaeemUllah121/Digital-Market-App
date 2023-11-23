import 'dart:convert'; // Import the dart:convert library
import 'package:aser_application/models/LoginModel.dart';
import 'package:aser_application/utill/url_Paths.dart';
import 'package:aser_application/utill/url_base.dart';
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

    print(response.statusCode);

    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      print(LoginModel.fromJson(response.body));
      return LoginModel.fromJson(response.body);
    }
  }
}
