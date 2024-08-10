import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_manager.dart';

Text textStyle2(String title, TextAlign textAlign, Color color) {
  return Text(
    title,
    textAlign: textAlign,
    style: GoogleFonts.montserrat(
      fontSize: 12.sp,
      color: color,
      fontWeight: FontWeight.w400,
    ),
  );
}

Text lightTextStyle(String title, TextAlign textAlign, Color color) {
  return Text(
    title,
    textAlign: textAlign,
    style: GoogleFonts.montserrat(
      fontSize: 12.sp,
      color: color,
      fontWeight: FontWeight.w400,
    ),
  );
}

Widget textDifferentStyle() {
  return RichText(
    text: TextSpan(
      text: 'By clicking the ',
      style: TextStyle(
          color: ColorsManager.lightTextColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          fontFamily: GoogleFonts.montserrat().fontFamily),
      children: <TextSpan>[
        TextSpan(
          text: 'Register',
          style: TextStyle(
              color: ColorsManager.redTextColr,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.montserrat().fontFamily),
        ),
        TextSpan(
          text: ' button, you agree to the public offer ',
          style: TextStyle(
              color: ColorsManager.lightTextColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.montserrat().fontFamily),
        ),
      ],
    ),
  );
}

Text underlineTextStyle(String title, TextAlign textAlign, Color color) {
  return Text(
    title,
    textAlign: textAlign,
    style: GoogleFonts.montserrat(
      fontSize: 12.sp,
      color: color,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.underline,
    ),
  );
}

Text titleTextStyle(String title, TextAlign textAlign, Color color) {
  return Text(
    title,
    textAlign: textAlign,
    style: GoogleFonts.montserrat(
      fontSize: 32.sp,
      color: color,
      fontWeight: FontWeight.bold,
    ),
  );
}
