// ignore_for_file: must_be_immutable

import 'package:digital_market/controllers/SignUpController.dart';
import 'package:digital_market/utill/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_overlay/loading_overlay.dart';
import '../../../utill/constants/color_manager.dart';
import '../../../utill/constants/string_manager.dart';
import '../../../utill/constants/text_helpers.dart';
import '../auth_methods.dart';
import '../login/login_page.dart';
import '../widgets/text_field.dart';

class SignUpPage extends GetView<SignUpController> {
  SignUpPage({super.key});

  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  String? usename;
  String? email;
  String? password;
  GlobalKey<FormState> Key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
        body: Obx((){
          return LoadingOverlay(
            progressIndicator:const CupertinoActivityIndicator(),
            opacity: 0.3,
            isLoading: controller.isLoading.value, 
          child: Stack(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/signin.png',
                fit: BoxFit.cover,
              ),
            ),
            Form(
              key: Key,
              child: ListView(
                padding: const EdgeInsets.all(12.0),
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 115.h, bottom: 32.h),
                    child: Center(
                      child: SizedBox(
                        child: Text(
                          StringManager.signUp,
                          style: TextStyle(
                            color: ColorsManager.darkTextColor,
                            fontSize: 32,
                            fontFamily: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold)
                                .fontFamily,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: TextFormFieldWidget(
                      hint: StringManager.email,
                      validator: validateEmail,
                      prefixIcon: const Icon(Icons.email),
                      controller:controller.emailController,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: TextFormFieldWidget(
                      hint: StringManager.password,
                      obscureText: true,
                      prefixIcon: const Icon(
                        Icons.lock,
                      ),
                      controller: controller.passwordController,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: TextFormFieldWidget(
                      hint: StringManager.confirmPassword,
                      obscureText: true,
                      validator: validatePassword,
                      prefixIcon: const Icon(Icons.lock),
                      controller: controller.confirmPasswordController,
                    ),
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.w, right: 50.w),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: textDifferentStyle()),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: SizedBox(
                        height: 45.h,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    ColorsManager.red),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4.r)))),
                            onPressed: () async {
                              // if (Key.currentState?.validate() ?? false) {
                                // try {
                                  if (controller.passwordController.text ==
                                      controller.confirmPasswordController.text) {
                                    controller.createUser();
                                  // }
                                // } catch (e) {
                                //   print("$Error e");
                                // }
                              }else{
                                errorSnackbar("Password does not macth");
                              }
                            },
                            child: Text(
                              StringManager.register,
                              style: TextStyle(
                                  color: ColorsManager.white,
                                  fontFamily: GoogleFonts.montserrat().fontFamily,
                                  fontSize: 20.sp),
                            ))),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  lightTextStyle(StringManager.continueWith, TextAlign.center,
                      ColorsManager.lightTextColor),
                  SizedBox(
                    height: 14.h,
                  ),
                  const Center(child: AuthMethods()),
                  SizedBox(
                    height: 14.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => LoginPage());
                    },
                    child: Center(
                      child: Wrap(
                        children: [
                          textStyle2(StringManager.iAlreadyHaveAnAccount,
                              TextAlign.center, ColorsManager.lightTextColor),
                          SizedBox(
                            width: 3.w,
                          ),
                          underlineTextStyle(StringManager.login,
                              TextAlign.center, ColorsManager.redTextColr)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        );},
    ));
  }
}
















// import 'package:digital_market/controllers/SignUpController.dart';
// import 'package:digital_market/utill/constants/string_manager.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:loading_overlay/loading_overlay.dart';
//
// import '../../../utill/constants/color_manager.dart';
// import '../login/login_page.dart';
// import '../widgets/drop_down_menu.dart';
// import '../widgets/text_field.dart';
//
// import 'dart:io';
// import 'package:flutter/material.dart';
//
// class SignUpPage extends GetView<SignUpController> {
//   final _formKey = GlobalKey<FormState>();
//   bool isPasswordVisible = false;
//   String? confirmPasswordValue;
//   String selectedType = 'Parent';
//   String selectedTeacher = 'Government';
//   List<String> participantTypes = ['Parent', 'Teacher'];
//   List<String> teacherTypes = ['Government', 'Private'];
//   SignUpController signUpController = Get.put(SignUpController());
//   File? pickedImage; // Variable to store the picked image file
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor:  ColorsManager.buttonColr,
//         body: Obx(() {
//           return LoadingOverlay(
//             opacity: 0.3,
//             progressIndicator: const CircularProgressIndicator(),
//             isLoading: controller.isLoading.value,
//             child: SafeArea(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Stack(
//                       children: [
//                         Container(
//                           decoration: const BoxDecoration(
//                               image: DecorationImage(
//                                   image: AssetImage(
//                                       "assets/images/sign_up_page.png"),
//                                   fit: BoxFit.fill)),
//                         ),
//                         SingleChildScrollView(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Container(
//                                 height:
//                                     MediaQuery.of(context).size.height * .93,
//                                 padding: EdgeInsets.only(
//                                     top: MediaQuery.of(context).size.height *
//                                         .23,
//                                     left: 40,
//                                     right: 40),
//                                 child: Form(
//                                   key: _formKey,
//                                   child: Column(
//                                     children: [
//                                       const SizedBox(
//                                         height: 15,
//                                       ),
//                                       Container(
//                                         margin: const EdgeInsets.only(
//                                             left: 1.0, top: 3.0),
//                                         child: Align(
//                                           alignment: Alignment.topLeft,
//                                           child: SizedBox(
//                                             height: 110,
//                                             width: 110,
//                                             child: Stack(
//                                               alignment: Alignment.center,
//                                               children: [
//                                                 ClipOval(
//                                                   child: Container(
//                                                     width: 120,
//                                                     height: 120,
//                                                     color: backgroundColr,
//                                                     child: Obx(() {
//                                                       final imagePath =
//                                                           controller.pickedImage
//                                                               .value;
//                                                       return imagePath
//                                                               .isNotEmpty
//                                                           ? Image.file(
//                                                               File(imagePath),
//                                                               width: 110,
//                                                               height: 110,
//                                                               fit: BoxFit.cover,
//                                                             )
//                                                           : const SizedBox();
//                                                     }),
//                                                   ),
//                                                 ),
//                                                 if (controller
//                                                     .pickedImage.isEmpty)
//                                                   Positioned(
//                                                     bottom: 0,
//                                                     right: 0,
//                                                     left: 0,
//                                                     top: 0,
//                                                     child: IconButton(
//                                                       icon: Icon(Icons.add),
//                                                       onPressed: () async {
//                                                         File? image =
//                                                             await controller
//                                                                 .pickImage();
//                                                         if (image != null) {
//                                                           controller.pickedImage
//                                                                   .value =
//                                                               image.uri
//                                                                   .toString();
//                                                         }
//                                                       },
//                                                     ),
//                                                   ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 20,
//                                       ),
//                                       CustomTextField(
//                                         inputLines: 1,
//                                         controller: controller.nameController,
//                                         hintName: 'Name',
//                                         inputType: TextInputType.name,
//                                         isPass: false,
//                                       ),
//                                       const SizedBox(
//                                         height: 15,
//                                       ),
//                                       CustomTextField(
//                                         inputLines: 1,
//                                         controller: controller.emailController,
//                                         hintName: emailHint,
//                                         inputType: TextInputType.name,
//                                         isPass: false,
//                                       ),
//                                       const SizedBox(
//                                         height: 15,
//                                       ),
//                                       CustomTextField(
//                                         inputLines: 1,
//                                         controller:
//                                             controller.passwordController,
//                                         hintName: passwordHint,
//                                         inputType:
//                                             TextInputType.visiblePassword,
//                                         isPass: true,
//                                       ),
//                                       const SizedBox(
//                                         height: 15,
//                                       ),
//                                       CustomTextField(
//                                         inputLines: 1,
//                                         controller: controller
//                                             .confirmPasswordController,
//                                         hintName: 'Confirm Password',
//                                         inputType:
//                                             TextInputType.visiblePassword,
//                                         isPass: true,
//                                       ),
//                                       const SizedBox(
//                                         height: 30,
//                                       ),
//                                       InkWell(
//                                         onTap: () {
//                                           if (_formKey.currentState!
//                                               .validate()) {
//                                             if (controller
//                                                     .passwordController.text ==
//                                                 controller
//                                                     .confirmPasswordController
//                                                     .text) {
//                                               controller.createUser();
//                                             } else {
//                                               // Passwords don't match
//                                               // You can show an error message or handle it accordingly
//                                             }
//                                           }
//                                         },
//                                         child: Container(
//                                           width:
//                                               MediaQuery.of(context).size.width,
//                                           padding: EdgeInsets.all(15),
//                                           margin: EdgeInsets.only(
//                                               bottom: 0, right: 30, left: 30),
//                                           decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.all(
//                                               Radius.circular(10),
//                                             ),
//                                             color:  ColorsManager.buttonColr,
//                                           ),
//                                           child: const Center(
//                                             child: Text(
//                                               "Sign up",
//                                               style: TextStyle(
//                                                 color:  ColorsManager.white
//                                                 fontFamily: 'circe',
//                                                 fontWeight: FontWeight.w700,
//                                                 fontSize: 18,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 15,
//                                       ),
//                                       Text(
//                                         'Cancel',
//                                         style: TextStyle(
//                                           fontSize: 15.0,
//                                           color: Colors.grey,
//                                           fontFamily: GoogleFonts.nunitoSans()
//                                               .fontFamily,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
