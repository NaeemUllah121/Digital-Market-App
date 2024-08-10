import 'package:cached_network_image/cached_network_image.dart';
import 'package:digital_market/views/city/Cities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utill/constants/color_manager.dart';

class itemProvince extends StatelessWidget {
  String? img;
  String? itemName;
  String? itemPrice;

  itemProvince(
      {required this.img,
      required this.itemName,
      required this.itemPrice,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(CityPage(title: itemName??''), arguments: itemName);
      },
      child:  Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: Column(
            children: [
              Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        
                child: CachedNetworkImage(
                        height: 135.h,
                        width: 135.w,
                        imageUrl: img ?? "",
                        fit: BoxFit.fill,
                      ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.w,right: 7.w),
                child: Text(
                  itemName ?? "",
                  style: TextStyle(
                    color: ColorsManager.titleTextColr,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
