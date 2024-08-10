import 'package:digital_market/utill/constants/color_manager.dart';
import 'package:digital_market/views/register/register_screen.dart';
import 'package:digital_market/views/terms_and_conditions/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Home/home_navbar.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Drawer(
          // backgroundColor: Color.fromRGBO(255, 243, 228, 10),
          backgroundColor:  ColorsManager.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color:  ColorsManager.red,
                ),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 90,
                        width: 90,
                        child: Material(
                          elevation: 8.0, // Set the desired elevation value
                          shape: const CircleBorder(),
                          child: CircleAvatar(
                            backgroundColor: ColorsManager.backgroundColr,
                            child: Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/images/applogo.png',
                                width: 280,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Digital Pakistan',
                      style: TextStyle(
                        color:  ColorsManager.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                )),
              ),
              Divider(
                color: Colors.grey.shade300,
                height: 1,
              ),
              GestureDetector(
                onTap: () {
                  Get.offAll(()=>const HomeNavbar());
                },
                child: ListTile(
                  title: Text(
                    'Home',
                    style: TextStyle(
                        color: ColorsManager.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              GestureDetector(
                onTap: (){
                                    Get.to( RegistrationScreen());

                },
                child: const ListTile(
                  title: Text(
                    'Registration',
                    style: TextStyle(
                        color: ColorsManager.black, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Get.to(const TermsAndConditionsScreen());
                },
                child: ListTile(
                  title: Text(
                    'Terms and Conditions',
                    style: TextStyle(
                        color: ColorsManager.black, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
             const ListTile(
                title: Text(
                  'Feedback',
                  style: TextStyle(
                      color: ColorsManager.black, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              const ListTile(
                title: Text(
                  'Rate Us',
                  style: TextStyle(
                      color: ColorsManager.black, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              const ListTile(
                title: Text(
                  'Log Out',
                  style: TextStyle(
                      color: ColorsManager.black, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
