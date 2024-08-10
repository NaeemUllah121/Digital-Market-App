// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_market/models/SignUpModel.dart';
import 'package:digital_market/models/set_user_data.dart';
import 'package:digital_market/repository/SignUpRepository.dart';
import 'package:digital_market/utill/helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../views/auth/login/login_page.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController with StateMixin<SignUpModel> {
  final SignUpRepository repository = SignUpRepository();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController marketController = TextEditingController();
    final TextEditingController shoNameController = TextEditingController();
    

  RxBool isLoading = false.obs;



  // getImage() async {
  //   photo = await _picker.pickImage(source: ImageSource.gallery);
  //   PickedFile? pickedFile;
  //   if (photo != null) {
  //     image = photo;
  //     file = File(image!.path);
  //     pickedFile = PickedFile(file!.path);
  //     await uploadImageToStorage(pickedFile);
  //   }
  // }

}
