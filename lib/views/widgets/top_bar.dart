import 'package:cached_network_image/cached_network_image.dart';
import 'package:digital_market/utill/constants/color_manager.dart';
import 'package:digital_market/views/notifications/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TopBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  String? userImage;

  TopBar({super.key, required this.scaffoldKey, required this.userImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.backgroundColr,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 10.0),
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color:  ColorsManager.white,
                    width: 3.0,
                  ),
                ),
                child: ClipOval(
                    child: CachedNetworkImage(
                  imageUrl: userImage!,
                  width: 65,
                  height: 65,
                  fit: BoxFit.cover,
                )),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  // Get.to(ContactUsPage());
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 135,
                  decoration: BoxDecoration(
                      color:  ColorsManager.buttonColr,
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Text(
                    'My Activity',
                    style: TextStyle(color:  ColorsManager.white, fontSize: 15.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 25.0,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10.0),
                height: 55,
                width: 55,
                child: InkWell(
                  onTap: () {
                    Get.to(() => const NotificationsScreen());
                  },
                  child: CircleAvatar(
                    backgroundColor: ColorsManager.circlbackground,
                    radius: 60,
                    child: Flexible(
                      child: Stack(children: [
                        Icon(
                          Icons.notifications,
                          // 'assets/images/scan_icon.svg',
                          color:  ColorsManager.buttonColr,
                        ),
                        Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              margin: const EdgeInsets.only(
                                bottom: 0,
                              ),
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                  color:  ColorsManager.buttonColr, shape: BoxShape.circle),
                            ))
                      ]),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: InkWell(
                onTap: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  height: 55,
                  width: 55,
                  child: Stack(children: [
                    CircleAvatar(
                      backgroundColor: ColorsManager.circlbackground,
                      radius: 65,
                      child: SvgPicture.asset(
                        'assets/images/menu_icon.svg',
                        color:
                             ColorsManager.buttonColr, // You can customize the color of the SVG icon
                      ),
                    ),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              color:  ColorsManager.buttonColr, shape: BoxShape.circle),
                        ))
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
