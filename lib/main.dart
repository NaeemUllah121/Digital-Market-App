import 'package:aser_application/bindings/application_binding.dart';
import 'package:aser_application/screens/Home/HomePage.dart';
import 'package:aser_application/screens/StartUp/SplashScreen.dart';
import 'package:aser_application/utill/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: ApplicationBindings(),
      home:  SplashScreen(),
    );
  }
}
