// ignore_for_file: must_be_immutable

import 'package:digital_market/controllers/LoginController.dart';
import 'package:digital_market/views/auth/signup/forget_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../utill/constants/color_manager.dart';
import '../../../utill/constants/string_manager.dart';
import '../../../utill/constants/text_helpers.dart';
import '../auth_methods.dart';
import '../signup/sign_up.dart';
import '../widgets/text_field.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({super.key});

  @override
  LoginController controller = Get.put(LoginController());
  GlobalKey<FormState> Key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => LoadingOverlay(isLoading: controller.isLoading.value,
        progressIndicator: const CupertinoActivityIndicator(),
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
                    padding: EdgeInsets.only(top: 165.h, bottom: 40.h),
                    child: Center(
                      child: SizedBox(
                        child: Text(
                          StringManager.login,
                          style: TextStyle(
                            color: ColorsManager.darkTextColor,
                            fontSize: 32.sp,
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
                      controller: controller.emailController.value,
                    ),
                  ),
                  SizedBox(
                    height: 16.0.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: TextFormFieldWidget(
                      hint: StringManager.password,
                      obscureText: true,
              
                      prefixIcon: const Icon(Icons.lock),
                      controller: controller.passwordController.value,
                    ),
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  InkWell(
                    onTap: () => Get.to(() => ForgetPasswordPage()),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: textStyle2(StringManager.forgetPassword,
                            TextAlign.right, ColorsManager.redTextColr),
                      ),
                    ),
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
                            onPressed: () {
                              if (Key.currentState?.validate() ?? false) {
                                try {
                                  controller.login();
                                } catch (e) {
                                  if (kDebugMode) {
                                    print(e);
                                  }
                                }
                              }
                            },
                            child: Text(
                              StringManager.login,
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
                      Get.to(() => SignUpPage());
                    },
                    child: Center(
                      child: Wrap(
                        children: [
                          textStyle2(StringManager.createAnAccount,
                              TextAlign.center, ColorsManager.lightTextColor),
                          SizedBox(
                            width: 3.w,
                          ),
                          underlineTextStyle(StringManager.signUp,
                              TextAlign.center, ColorsManager.redTextColr)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
        )
    );
  }
}












// import 'package:digital_market/controllers/LoginController.dart';
// import 'package:digital_market/utill/constants/string_manager.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:loading_overlay/loading_overlay.dart';
// import 'package:sign_in_button/sign_in_button.dart';
//
// import '../../../utill/constants/color_manager.dart';
// import '../signup/sign_up.dart';
// import '../widgets/text_field.dart';
//
// class LoginPage extends GetView<LoginController> {
//   final _formKey = GlobalKey<FormState>();
//   bool isPasswordVisible = false;
//   LoginController controller = Get.put(LoginController());
//
//   LoginPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor:  ColorsManager.buttonColr,
//         body: Obx(
//               () {
//             return LoadingOverlay(
//               opacity: 0.3,
//               progressIndicator: const CircularProgressIndicator(),
//               isLoading: controller.isLoading.value,
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
//                                       "assets/images/login_page.png"),
//                                   fit: BoxFit.fill)),
//                         ),
//                         SingleChildScrollView(
//                           child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   height:
//                                   MediaQuery
//                                       .of(context)
//                                       .size
//                                       .height * 1.2,
//                                   padding: EdgeInsets.only(
//                                       top: MediaQuery
//                                           .of(context)
//                                           .size
//                                           .height *
//                                           0.20,
//                                       left: 40,
//                                       right: 40),
//                                   child: Form(
//                                     key: _formKey,
//                                     child: Column(
//                                       children: [
//                                         const SizedBox(
//                                           height: 160,
//                                         ),
//                                         // Align(
//                                         //   alignment: Alignment.topLeft,
//                                         //   child: SizedBox(
//                                         //     height: 110,
//                                         //     width: 110,
//                                         //     child: CircleAvatar(
//                                         //       backgroundColor: backgroundColr,
//                                         //       child: Align(
//                                         //         alignment: Alignment.center,
//                                         //         child: Image.asset(
//                                         //           'assets/images/applogo.png',
//                                         //           width: 280,
//                                         //           // height: 0,
//                                         //         ),
//                                         //       ),
//                                         //     ),
//                                         //   ),
//                                         // ),
//                                         Container(
//                                           margin:
//                                           const EdgeInsets.only(left: 10),
//                                           child: Align(
//                                             alignment: Alignment.topLeft,
//                                             child: Text(
//                                               logIn,
//                                               style: TextStyle(
//                                                   color:  ColorsManager.buttonColr,
//                                                   fontSize: 30,
//                                                   fontWeight: FontWeight.w700),
//                                             ),
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           height: 20.0,
//                                         ),
//                                         CustomTextField(
//                                           inputLines: 1,
//                                           controller: controller
//                                               .phoneNumberController.value,
//                                           hintName: phoneNumberHint,
//                                           inputType: TextInputType.text,
//                                           isPass: false,
//                                         ),
//                                         const SizedBox(
//                                           height: 25,
//                                         ),
//                                         CustomTextField(
//                                           inputLines: 1,
//                                           controller: controller
//                                               .passwordController.value,
//                                           hintName: passwordHint,
//                                           inputType:
//                                           TextInputType.visiblePassword,
//                                           isPass: true,
//                                         ),
//                                         const SizedBox(
//                                           height: 15,
//                                         ),
//                                         Container(
//                                           margin:
//                                           const EdgeInsets.only(right: 15),
//                                           child: Align(
//                                             alignment: Alignment.topRight,
//                                             child: InkWell(
//                                               onTap: () {
//                                                 controller.resetPassword();
//                                               },
//                                               child: Text(
//                                                 forgetPassword,
//                                                 style: TextStyle(
//                                                   color:  ColorsManager.buttonColr,
//                                                   fontSize: 15,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//
//                                         const SizedBox(
//                                           height: 30,
//                                         ),
//                                         InkWell(
//                                           onTap: () {
//                                             controller.login();
//                                           },
//                                           child: Container(
//                                               width: MediaQuery
//                                                   .of(context)
//                                                   .size
//                                                   .width,
//                                               padding: EdgeInsets.all(15),
//                                               margin: EdgeInsets.only(
//                                                   bottom: 0,
//                                                   right: 30,
//                                                   left: 30),
//                                               decoration: BoxDecoration(
//                                                   borderRadius:
//                                                   BorderRadius.all(
//                                                       Radius.circular(10)),
//                                                   color:  ColorsManager.buttonColr),
//                                               child: const Center(
//                                                 child: Text(
//                                                   "Login",
//                                                   style: TextStyle(
//                                                       color:  ColorsManager.white
//                                                       fontFamily: 'circe',
//                                                       fontWeight:
//                                                       FontWeight.w700,
//                                                       fontSize: 18),
//                                                 ),
//                                               )),
//                                         ),
//                                         const SizedBox(
//                                           height: 15,
//                                         ),
//                                         Text(
//                                           'OR Login with',
//                                           style: TextStyle(
//                                               color: black,
//                                               fontWeight: FontWeight.w500,
//                                               fontSize: 15),
//                                         ),
//                                         const SizedBox(
//                                           height: 15,
//                                         ),
//                                         Align(
//                                           alignment: Alignment.center,
//                                           child: SizedBox(
//                                               width: 35,
//                                               height: 35,
//                                               child: Image.asset(
//                                                   'assets/images/google.png')),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ]),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
