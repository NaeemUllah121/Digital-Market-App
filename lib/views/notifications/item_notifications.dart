import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/notifications/notification_model.dart';
import '../../utill/constants/color_manager.dart';

class ItemNotifications extends StatefulWidget {
  final NotificationModel? notification;
  final int index;

  const ItemNotifications(this.notification, this.index, {super.key});

  @override
  State<ItemNotifications> createState() => _ItemNotificationsState();
}

class _ItemNotificationsState extends State<ItemNotifications> {
  bool isSelected = false;
  late SharedPreferences prefs;
  bool isRead =  false;

  @override
  void initState() {
    super.initState();
    _loadSelectedState();
  }

  Future<void> _loadSelectedState() async {
    prefs = await SharedPreferences.getInstance();
    isRead = prefs.getBool('isRead${widget.index}') ?? false;
    setState(() {
      isSelected = isRead;
    });
  }

  Future<void> _saveSelectedState(bool value) async {
    await prefs.setBool('isRead${widget.index}', value);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          isSelected = true;
        });
        await _saveSelectedState(isSelected);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected ?  ColorsManager.white : ColorsManager.lightestBlue,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text(
            widget.notification?.message ?? '',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            widget.notification?.title ?? '',
          ),
          trailing:  const SizedBox(
            width: 100,
            child: Row(
              children: <Widget>[
                // Add your trailing widgets here
              ],
            ),
          ),
        ),
      ),
    );
  }
}
