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

class SignUpController extends GetxController with StateMixin<SignUpModel> {
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
    


  final userType = 'Parent'.obs;
  RxBool isLoading = false.obs;
  RxString pickedImage = "".obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GetStorage box = GetStorage();
  SetUserData? setUserData;
  XFile? image;
  RxString photo = "".obs;
  File? file;
  String? imageUrl;

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

  pickImage() async {
    try {
      final imagePicker = ImagePicker();
      final pickedFile =
      await imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        pickedImage.value = pickedFile.path;
            await uploadImageToStorage(pickedFile);

      } else {
        pickedImage.value = "";
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error picking image: $e');
      }
      pickedImage.value = "";
    }
  }
  uploadImageToStorage(XFile? pickedFile) async {
    try {
      DateTime dateTime = DateTime.now();

      // Convert XFile to PickedFile
      PickedFile convertedPickedFile = PickedFile(pickedFile!.path);
      Reference reference = FirebaseStorage.instance.ref().child("url/$dateTime");
      await reference.putData(
          await convertedPickedFile.readAsBytes(),
          SettableMetadata(contentType: 'image/jpeg')
      );
      imageUrl = await reference.getDownloadURL();
      photo.value =imageUrl.toString();
      if (kDebugMode) {
        print(imageUrl);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error uploading image: $e');
      }
    }
  }
  createUser() async {
    isLoading(true).obs;
    try {
      UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      isLoading(false).obs;
      User user = userCredential.user!;
      // setUserData = SetUserData(userName: nameController.text, userImage: photo.value, email: emailController.text);

      DocumentReference reference =
      FirebaseFirestore.instance.collection('users').doc();
      await reference.set({
        'id': user.uid,
        'name': nameController.text,
        'email': emailController.text,
        'url': photo.value,
      });
      await user.sendEmailVerification();
      successSnackbar(
        "A verification email has been sent. Please check your email",
      );
      Get.off(LoginPage(), transition: Transition.zoom);
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print('Error registering user: $e');
      }
      if (e.code == 'weak-password') {
        errorSnackbar(
            'Weak password. Password should be at least 6 characters.');
      } else {
        errorSnackbar('Registration failed: $e');
      }
    } finally {
      isLoading(false).obs;
    }
  }
}
