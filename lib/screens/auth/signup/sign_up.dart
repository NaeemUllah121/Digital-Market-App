import 'package:aser_application/screens/StartUp/SplashScreen.dart';
import 'package:aser_application/screens/auth/login/login.dart';
import 'package:aser_application/utill/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utill/Colors.dart';
import '../widgets/text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  String? confirmPasswordValue;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

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
                                      top: 60.0, bottom: 20),
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
                                  controller: firstNameController,
                                  hintName: nameHint,
                                  inputType: TextInputType.name,
                                  isPass: false,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomTextField(
                                  inputLines: 1,
                                  controller: emailController,
                                  hintName: emailHint,
                                  inputType: TextInputType.emailAddress,
                                  isPass: false,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomTextField(
                                  inputLines: 1,
                                  controller: numberController,
                                  hintName: phoneNumberHint,
                                  inputType: TextInputType.number,
                                  isPass: false,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomTextField(
                                  inputLines: 1,
                                  controller: passwordController,
                                  hintName: passwordHint,
                                  inputType: TextInputType.visiblePassword,
                                  isPass: true,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomTextField(
                                    inputLines: 1,
                                    controller: confirmPasswordController,
                                    hintName: confirmPasswordHint,
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
                                            Get.to(LoginPage());
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
                                              // registerController.createUser(
                                              //     userName: firstNameController
                                              //             .text +
                                              //         lastNameController.text,
                                              //     email: emailController.text,
                                              //     password:
                                              //         passwordController.text);
                                            }
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
