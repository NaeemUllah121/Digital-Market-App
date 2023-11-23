import 'package:aser_application/models/SignUpModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController with StateMixin<SignUpModel> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final userType = ''.obs;
  var selectedTeacherType = ''.obs;
  void setUserType(String value) {
    userType.value = value;
  }
  setTeacherType(String teacherType) {
    selectedTeacherType.value = teacherType;
  }
}
