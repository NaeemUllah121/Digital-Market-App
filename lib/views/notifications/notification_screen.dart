import 'package:digital_market/utill/constants/color_manager.dart';
import 'package:digital_market/utill/constants/string_manager.dart';
import 'package:digital_market/views/notifications/item_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/notifications/notification_model.dart';
import '../../notifications/notification_services.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  NotificationServices? notificationServices;

  @override
  void initState() {
    super.initState();
    notificationServices = NotificationServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor:  ColorsManager.buttonColr,
      //   leading: GestureDetector(
      //     onTap: (){
      //       Get.back();
      //     },
      //     child: const Icon(
      //       Icons.arrow_back,
      //       color:  ColorsManager.white,
      //     ),
      //   ),
      //   title: Text(
      //     StringManager.notification,
      //     style: TextStyle(color:  ColorsManager.white),
      //   ),
      // ),
      body: FutureBuilder<List<NotificationModel>>(
        future: notificationServices?.getNotifications(),
        builder: (context, AsyncSnapshot<List<NotificationModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          // } else if (snapshot.hasError) {
          //   print(snapshot.error);
          //   return Text('Error: ${snapshot.error}');
          }
           else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        print(snapshot.error);

            return const Text('No Announcement');
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
                Expanded(
                  child: snapshot.data!.isNotEmpty ? ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      // final reversedIndex = snapshot.data!.length - 1 - index;
                      return ItemNotifications(snapshot.data?[index], index);
                    },
                  )
                :Container())
              ],
            );
          }
        },
      ),
    );
  }
}
