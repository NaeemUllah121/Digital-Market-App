// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:digital_market/controllers/SignUpController.dart';
import 'package:digital_market/controllers/register_controller.dart';
import 'package:digital_market/utill/helpers.dart';
import 'package:digital_market/views/auth/auth_methods.dart';
import 'package:digital_market/views/auth/login/login_page.dart';
import 'package:digital_market/views/auth/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utill/constants/color_manager.dart';
import '../../../utill/constants/string_manager.dart';
import '../../../utill/constants/text_helpers.dart';

class RegistrationScreen extends GetView<RegisterController> {
  RegistrationScreen({super.key});

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
                          StringManager.registerHere,
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

                  Row(children: [ Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 28.w),
                      child: TextFormFieldWidget(
                        hint: StringManager.fistName,
                        validator: validateEmail,
                        // prefixIcon: const Icon(Icons.email),
                        controller:controller.firstNameController,
                      ),
                    ),
              ),
              const SizedBox(
                    width: 16.0,
                  ),
              Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 28.w),
                      child: TextFormFieldWidget(
                        hint: StringManager.lastNameHint,
                        validator: validateEmail,
                        // prefixIcon: const Icon(Icons.email),
                        controller:controller.lastNameController,
                      ),
                    ),
              )],),
              const SizedBox(
                    height: 16.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: TextFormFieldWidget(
                      hint: StringManager.email,
                      validator: validateEmail,
                      // prefixIcon: const Icon(Icons.email),
                      controller:controller.emailController,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),

                   Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: TextFormFieldWidget(
                      hint: 'Enter you City',
                      // validator: validateEmail,
                      // prefixIcon: const Icon(Icons.location_city),
                      controller:controller.cityController,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),

                   Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: TextFormFieldWidget(
                      hint: 'Enter you Market Name',
                      // validator: validateEmail,
                      // prefixIcon: const Icon(Icons.market),
                      controller:controller.marketController,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),

                   Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: TextFormFieldWidget(
                      hint: 'Enter you Shop Name',
                      // validator: validateEmail,
                      // prefixIcon: const Icon(Icons.location_city),
                      controller:controller.shoNameController,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: TextFormFieldWidget(
                      hint: StringManager.phoneNumberHint,
                      // obscureText: true,
                      // prefixIcon: const Icon(
                      //   Icons.phone_rounded,
                      // ),
                      controller: controller.numberController,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
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
                                backgroundColor: WidgetStateProperty.all<Color>(
                                    ColorsManager.red),
                                shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4.r)))),
                            onPressed: () async {

                                  String message = '''
Regitration Request: 
Name: ${controller.firstNameController.text} ${controller.lastNameController.text}
Email: ${controller.emailController.text}
City: ${controller.cityController.text}
Market Name: ${controller.marketController.text}
Shop Name: ${controller.shoNameController.text}
Phone Number: ${controller.numberController.text}
''';

  String phoneNumber = '+923076580587';
  Navigator.pop(context);
                            },
                            child: Text(
                              StringManager.register,
                              style: TextStyle(
                                  color: ColorsManager.white,
                                  fontFamily: GoogleFonts.montserrat().fontFamily,
                                  fontSize: 20.sp),
                            ))),
                  ),
                  
                 
                ],
              ),
            ),
          ]),
        );},
    ));
  

}

}
