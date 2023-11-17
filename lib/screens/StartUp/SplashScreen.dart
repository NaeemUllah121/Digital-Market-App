import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utill/Colors.dart';
import '../Home/HomePage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }
  void navigateToNextScreen() {
    Timer(
      const Duration(seconds: 3),
      () {
        Get.to(const HomePage());
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    // navigateToNextScreen();
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        // flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(top: 80.0),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Image.asset(
                              'assets/images/ita.png',
                              width: 110,
                              height: 120,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        // flex: 1,
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/aser.png',
                            width: 110,
                            height: 120,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(
                            'assets/images/unicef.png',
                            width: 70,
                            height: 80,
                          ),
                        ),
                      ),
                    ],
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
