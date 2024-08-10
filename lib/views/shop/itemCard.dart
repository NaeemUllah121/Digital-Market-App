// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:digital_market/views/products/widgets/Products.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../utill/constants/color_manager.dart';

Widget itemsCard({
  required BuildContext context, // Add BuildContext as a parameter
  img,
  itemName,
  itemPrice,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () {
        Get.to(() => ProductsPage(title: itemName,), arguments: itemName);
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 20,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Card(
          elevation: 2.0,
          color:  ColorsManager.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: img,
                    fit: BoxFit.cover,
                    placeholder: (context, val) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.image),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          // right: 8.0,
                          // left: 8.0,
                        ),
                        child: Text(
                          itemName ?? "",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
