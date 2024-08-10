// ignore_for_file: must_be_immutable

import 'package:digital_market/controllers/SignUpController.dart';
import 'package:digital_market/utill/constants/string_manager.dart';
import 'package:digital_market/utill/constants/text_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utill/constants/color_manager.dart';
import '../widgets/text_field.dart';

class ForgetPasswordPage extends GetView<SignUpController> {
  bool isPasswordVisible = false;
  String? confirmPasswordValue;
  String selectedType = 'Parent';
  String selectedTeacher = 'Government';
  List<String> participantTypes = ['Parent', 'Teacher'];
  List<String> teacherTypes = ['Government', 'Private'];
  GlobalKey<FormState> Key = GlobalKey<FormState>();

  ForgetPasswordPage({super.key});

  SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/signin.png"),
                          fit: BoxFit.fill)),
                ),
                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Padding(
                              padding: EdgeInsets.only(top: 40.h),
                              child: titleTextStyle(
                                  StringManager.forgetPasswordMark,
                                  TextAlign.center,
                                  ColorsManager.black)),
                        ),
                        Form(
                          key: Key,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 28.w, vertical: 8.h),
                                child: TextFormFieldWidget(
                                  hint: StringManager.enterYourEmail,
                                  obscureText: false,
                                  validator: validatePassword,
                                  prefixIcon: const Icon(
                                    Icons.email,
                                  ),
                                  controller: controller.emailController,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.w, vertical: 15.h),
                                child: lightTextStyle(
                                    StringManager.weWillSendyou,
                                    TextAlign.start,
                                    ColorsManager.lightTextColor),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 35.w, vertical: 36.h),
                                child: SizedBox(
                                    height: 45.h,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(ColorsManager.red),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.r)))),
                                        onPressed: () async {
                                          if (Key.currentState?.validate() ??
                                              false) {
                                            try {} catch (e) {
                                              print("$Error e");
                                            }
                                          }
                                        },
                                        child: Text(
                                          StringManager.submit,
                                          style: TextStyle(
                                              color: ColorsManager.white,
                                              fontFamily:
                                                  GoogleFonts.montserrat()
                                                      .fontFamily,
                                              fontSize: 20.sp),
                                        ))),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
