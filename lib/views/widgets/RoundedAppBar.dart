import 'package:digital_market/utill/constants/color_manager.dart';
import 'package:digital_market/views/contact_us/ContactUs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class RoundedAppBar extends StatelessWidget {
  final String title;
  const RoundedAppBar({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        color:  ColorsManager.red,
        borderRadius: const BorderRadius.only(
          // bottomLeft: Radius.circular(20),
          // bottomRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
              color: Colors.yellow,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(const ContactUsPage());
                    },
                    child: Text(
                      title ?? "",
                      style: TextStyle(color:  ColorsManager.white, fontSize: 22,fontFamily: GoogleFonts.raleway().fontFamily,fontWeight: FontWeight.bold),
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     Get.to(ContactUsPage());
                  //   },
                  //   child: Text(
                  //     "Contact Us",
                  //     style: TextStyle(color:  ColorsManager.white, fontSize: 15),
                  //   ),
                  // ),
                  // Container(
                  //   height: 15,
                  //   child: VerticalDivider(
                  //     color:  ColorsManager.white,
                  //     thickness: 2,
                  //   ),
                  // ),
                  // InkWell(
                  //   onTap: () {
                  //     Get.to(AddShop(isForEditing: false));
                  //   },
                  //   child: Text(
                  //     "Register Shop",
                  //     style: TextStyle(color:  ColorsManager.white fontSize: 15),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 12,
                  //   child: VerticalDivider(
                  //     color:  ColorsManager.white,
                  //     thickness: 2,
                  //   ),
                  // ),
                  // InkWell(
                  //   onTap: () {
                  //     Get.to(TermsAndConditionsScreen());
                  //   },
                  //   child: Text(
                  //     "T&C",
                  //     style: TextStyle(color:  ColorsManager.white, fontSize: 15),
                  //   ),
                  // ),
                ],
              ),
            ),
            Container(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.search,
                  color:  ColorsManager.white,
                  size: 32,
                )),
          ],
        ),
      ),
    );
  }
}
