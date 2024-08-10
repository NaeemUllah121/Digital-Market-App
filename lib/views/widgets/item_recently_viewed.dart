import 'package:digital_market/views/products/widgets/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utill/constants/color_manager.dart';

class ItemRecentlyViewed extends StatelessWidget {
  String? productUri;
  String productId;

  ItemRecentlyViewed({this.productUri, super.key,required this.productId});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>         Get.to(() => const ProductDetailsPage(), arguments: productId)
,
      child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // margin: const EdgeInsets.only(left: 10.0, right: 15.0),
              height: 70,
              width: 70,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: CircleAvatar(
                backgroundColor: ColorsManager.circlbackground,
                backgroundImage: NetworkImage(productUri ?? ""),
              ),
            ),
          )),
    );
  }
}
