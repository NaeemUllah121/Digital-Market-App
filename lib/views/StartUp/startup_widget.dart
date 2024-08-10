// StartupScreen.dart
import 'package:digital_market/utill/constants/color_manager.dart';
import 'package:digital_market/utill/constants/string_manager.dart';
import 'package:digital_market/views/Home/home_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StartupScreen extends StatelessWidget {
  final String backgroundColor;
  final String imagePath;
  final String title;
  final String description;
  final int currentIndex;
  final int screenIndex;
  final PageController pageController;
  final String buttonTitle;

  const StartupScreen(
      {Key? key,
      required this.backgroundColor,
      required this.imagePath,
      required this.title,
      required this.description,
      required this.currentIndex,
      required this.screenIndex,
      required this.pageController,
      required this.buttonTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundColor),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () => Get.to(
                  () => const HomeNavbar(),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 17.w, vertical: 14.h),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Skip',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: ColorsManager.black,
                        fontSize: 15.sp,
                        fontFamily: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                        ).fontFamily,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 38.w, right: 38.w, top: 14.h),
                child: SizedBox(
                  child: Column(
                    children: [
                      Container(
                        height: 250.h,
                        width: 250.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 130.h),
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: ColorsManager.white,
                                fontFamily: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                ).fontFamily,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: ColorsManager.white,
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: SizedBox(
                              height: 45.h,
                              width: 317.w,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    ColorsManager.white,
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  currentIndex == 2
                                      ? Get.offAll(const HomeNavbar())
                                      : pageController.nextPage(
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.easeInOut);
                                },
                                child: Text(
                                  buttonTitle,
                                  style: TextStyle(
                                    color: ColorsManager.black,
                                    fontFamily:
                                        GoogleFonts.montserrat().fontFamily,
                                    fontSize: 20.sp,
                                  ),
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
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildDot(0),
                  buildDot(1),
                  buildDot(2),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      width: 15,
      height: 15,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentIndex == index ? ColorsManager.white : ColorsManager.grey,
      ),
    );
  }
}
