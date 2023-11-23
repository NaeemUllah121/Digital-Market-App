import 'package:aser_application/controllers/SignUpController.dart';
import 'package:aser_application/screens/StartUp/SplashScreen.dart';
import 'package:aser_application/screens/auth/login/login_page.dart';
import 'package:aser_application/utill/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utill/Colors.dart';
import '../widgets/text_field.dart';

class SignUpPage extends GetView<SignUpController> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  String? confirmPasswordValue;
  late String selectedProject;

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
                                  controller: controller.firstNameController,
                                  hintName: nameHint,
                                  inputType: TextInputType.name,
                                  isPass: false,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomTextField(
                                  inputLines: 1,
                                  controller: controller.emailController,
                                  hintName: emailHint,
                                  inputType: TextInputType.emailAddress,
                                  isPass: false,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomTextField(
                                  inputLines: 1,
                                  controller: controller.numberController,
                                  hintName: phoneNumberHint,
                                  inputType: TextInputType.number,
                                  isPass: false,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: DropdownButtonFormField(
                                    decoration: const InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(0)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(0)),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(0)),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(0)),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(0)),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                    ),
                                    validator: (value) =>
                                        value == null ? "Select a Type" : null,
                                    dropdownColor: Colors.white,
                                    hint: const Text("Select a Type"),
                                    value: selectedProject,
                                    onChanged: (String? newValue) {
                                      controller.setUserType(newValue!);
                                    },
                                    items: <String>[
                                      'Parent',
                                      'Teacher',
                                    ].map((String value) {
                                      return DropdownMenuItem<String>(
                                          enabled: true,
                                          value: value,
                                          child: Text(
                                            value,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          ));
                                    }).toList(),
                                  ),
                                ),

                                const SizedBox(
                                  height: 20,
                                ),
                                CustomTextField(
                                  inputLines: 1,
                                  controller: controller.passwordController,
                                  hintName: passwordHint,
                                  inputType: TextInputType.visiblePassword,
                                  isPass: true,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomTextField(
                                  inputLines: 1,
                                  controller:
                                      controller.confirmPasswordController,
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
