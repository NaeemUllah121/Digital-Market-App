import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utill/constants/color_manager.dart';

class HomeTitleTextWidget extends StatelessWidget {
  double fontSize;
  String title;
  HomeTitleTextWidget({super.key, required this.fontSize,required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: TextStyle(
              color: ColorsManager.titleTextColr,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              fontFamily:
              GoogleFonts
                  .montserrat()
                  .fontFamily),
        ),
      ),
    );
  }
}
