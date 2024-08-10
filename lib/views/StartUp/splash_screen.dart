// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:digital_market/store/local_store.dart';
import 'package:digital_market/views/auth/signup/sign_up.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../notifications/notification_services.dart';
import '../../utill/constants/color_manager.dart';
import '../Home/home_navbar.dart';
import '../auth/login/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    notificationServices.requestNotificationPermissions();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractNotification(context);
    notificationServices.isTokanRefresh();
    notificationServices.getDeviceTokan().then((value) {
      if (kDebugMode) {
        print("Device tokan");
      }
    });
    navigateToNextScreen();
  }

  Future<void> checkLoginStatus() async {
    final isUserLoggedIn = await LocalStore.checkLoginStatus();
    if (isUserLoggedIn) {
      Get.offAll(() => const HomeNavbar());
    } else {
      Get.offAll(() => LoginPage());
    }
  }

  void navigateToNextScreen() {
    Timer(
      const Duration(seconds: 3),
      () {
        checkLoginStatus();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsManager.red,
        body: Align(
          alignment: Alignment.center,
          child: Stack(
            children: [
              SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/signin.png',
                fit: BoxFit.cover,
              ),
            ),
             Center(
               child: Image.asset(
                'assets/images/applogo.png',
                width: 280,
                           ),
             ),
          ]),
        ));
  }
}
