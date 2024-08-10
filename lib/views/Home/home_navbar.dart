// ignore_for_file: library_private_types_in_public_api

import 'package:cached_network_image/cached_network_image.dart';
import 'package:digital_market/controllers/home_controller.dart';
import 'package:digital_market/views/notifications/notification_screen.dart';
import 'package:digital_market/views/terms_and_conditions/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/cart_controller.dart';
import '../../utill/constants/color_manager.dart';
import '../widgets/custom_drawer.dart';
import 'HomePage.dart';

String appBarTitle = "Digitak Market";

class HomeNavbar extends StatefulWidget {
  const HomeNavbar({super.key});

  @override
  _HomeNavbarState createState() => _HomeNavbarState();
}

class _HomeNavbarState extends State<HomeNavbar> {
  int _currentIndex = 0;
  List<Widget> tabs = [
    HomePage(),
    const NotificationsScreen(),
    const TermsAndConditionsScreen(),
    // ProductsPage(),
  ];

  var cartController = Get.put(CartController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
              child: Text(
                "Digital Market",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                    ).fontFamily),
              ),
            ),
            leading: InkWell(
              onTap: () => _scaffoldKey.currentState?.openDrawer(),
              child: Container(
                margin: const EdgeInsets.only(left: 10.0),
                height: 32.h,
                width: 32.w,
                child: Image.asset(
                  'assets/icons/circular_side_nav.png',
                ),
              ),
            ),
            backgroundColor: ColorsManager.red,
            foregroundColor: ColorsManager.white,
            actions: [
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                height: 28.h,
                width: 28.w,
                child: Image.asset(
                  'assets/icons/cart_icon.png',
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Container(
                height: 33.h,
                width: 35.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorsManager.red,
                    width: 3.0,
                  ),
                ),
                child: ClipOval(
                    child: controller.userModel?.url?.isEmpty ?? true
                        ? Image.asset(
                            'assets/icons/user_icon.png',
                            height: 33.h,
                            width: 35.w,
                            fit: BoxFit.cover,
                          )
                        : CachedNetworkImage(
                            imageUrl: controller.userModel?.url ?? "",
                            height: 33.h,
                            width: 35.w,
                            fit: BoxFit.cover,
                          )),
              ),
              SizedBox(
                width: 12.w,
              ),
            ]),
        drawer: const CustomDrawer(),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        key: _scaffoldKey,
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 10,
          unselectedFontSize: 8,
          showUnselectedLabels: true,
          elevation: 6,
          backgroundColor: ColorsManager.white,
          selectedItemColor: ColorsManager.red,
          unselectedItemColor: ColorsManager.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_support),
              label: 'Contact Us',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}
