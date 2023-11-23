import 'package:aser_application/models/LoginModel.dart';
import 'package:aser_application/repository/LoginRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with StateMixin<LoginModel>{
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final LoginRepository _repository = LoginRepository();

  Future<bool> login() async {
    final email = emailController.value.text;
    final password = passwordController.value.text;

    try {
      final response = await _repository.login(email, password);
      print(response);

      if (response.status == true) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
      return false;
    }
  }
}