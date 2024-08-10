import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utill/constants/color_manager.dart';

Future<void> showCustomBottomSheet() async {
  final List<String> items = ['For Shopkeepers', 'For users'];
  await Get.bottomSheet(
    Container(
      height: 110,
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color:  ColorsManager.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(items[index]),
                            trailing: const Icon(Icons.arrow_forward),
                          );
                        })),
              ],
            ),
          ),
        ),
      ),
    ),
    backgroundColor: Colors.transparent,
    isDismissible: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    enableDrag: false,
  );
}
