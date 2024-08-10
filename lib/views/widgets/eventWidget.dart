// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import '../../utill/constants/color_manager.dart';

InkWell eventWidget(
String? url, String? name, String? marketName,context) {
  return InkWell(
    onTap: () {
      // Get.to(EventDetailPage(img, name, subText, eventDate, eventModel));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment:Alignment.center,
        child: Container(
          // margin: EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width / 1.3,
          // height: MediaQuery.of(context).size.height / 1,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color:  ColorsManager.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(1, 4),
              ),
            ],
          ),
          child: Stack(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: url != null
                    ? Hero(
                  tag: url,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.width * 0.42,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: url != null
                          ? Image?.network(url, fit: BoxFit.fill)
                          : Container(),
                    ),
                  ),
                )
                    : Container(),
              ),
               Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Text(
                  name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    const SizedBox(width: 5),
                    Text(
                      marketName!,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
