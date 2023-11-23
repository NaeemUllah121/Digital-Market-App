import 'package:aser_application/controllers/LoginController.dart';
import 'package:aser_application/screens/StartUp/SplashScreen.dart';
import 'package:aser_application/screens/auth/signup/sign_up.dart';
import 'package:aser_application/utill/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utill/Colors.dart';
import '../widgets/text_field.dart';

class LoginPage extends GetView<LoginController> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Transform.rotate(
                      angle: 0.79,
                      alignment: Alignment.topLeft,
                      child: Container(
                        color: higherBlue,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Transform.rotate(
                      angle: 0.79,
                      alignment: Alignment.bottomRight,
                      child: Container(
                        color: lightestBlue,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 150.0, bottom: 20),
                                  child: ClipRect(
                                    child: Container(
                                        height: 100,
                                        child: Image.asset(
                                            'assets/images/aser.png')),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                CustomTextField(
                                  inputLines: 1,
                                  controller: controller.emailController.value,
                                  hintName: emailHint,
                                  // inputType: TextInputType.number,
                                  isPass: false,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomTextField(
                                  inputLines: 1,
                                  controller: controller.passwordController.value,
                                  hintName: passwordHint,
                                  inputType: TextInputType.visiblePassword,
                                  isPass: true,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    higherBlue),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            Get.to(SignUpPage());
                                          },
                                          child: Text(
                                            'Sign Up',
                                            style: TextStyle(
                                                color: black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    white),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              controller.login();
                                            }
                                          },
                                          child: Text(
                                            'Sign In',
                                            style: TextStyle(
                                                color: black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
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
            ),
          ],
        ),
      ),
    );
  }
}
