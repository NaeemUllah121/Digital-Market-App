// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:math';
import 'package:app_settings/app_settings.dart';
import 'package:digital_market/views/products/widgets/product_details.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../models/notifications/notification_model.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String boxName = 'notifications';
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void initLocalNotifications(
      BuildContext context, RemoteMessage message) async {
    var androidInitialization = const AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    var iosInitialization = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: androidInitialization, iOS: iosInitialization);
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (payLoad) async {
        handleMessage(context, message);
        if (kDebugMode) {
          print("Notification response received: ${payLoad.payload}");
        }
      },
    );
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      if (kDebugMode) {
        print(message.notification!.title.toString());
        print(message.notification!.body.toString());
        print(message.data.toString());
        // print(message.data['type'] + "kjsdsldk");
        // print(message.data['id']);
        setupInteractNotification(context);
      }
      if (Platform.isAndroid) {
        initLocalNotifications(context, message);
        showNotifications(message);
      } else {
        showNotifications(message);
      }
    });
  }

  Future<void> showNotifications(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
        Random.secure().nextInt(100000).toString(),
        'High Importance Notification',
        importance: Importance.max);

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            channel.id.toString(), channel.name.toString(),
            channelDescription: 'Your channel description',
            importance: Importance.high,
            priority: Priority.high,
            icon: '@mipmap/ic_launcher',
            ticker: 'ticker');

    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);
    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
          0,
          message.notification?.title.toString() ?? "",
          message.notification?.body.toString() ?? "",
          notificationDetails);
    });
  }

  void requestNotificationPermissions() async {
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('user granted permissions');
      }
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('user granted provisional permissions');
      }
    } else {
      AppSettings.openAppSettings(type: AppSettingsType.notification);
      if (kDebugMode) {
        print('user denied permissions');
      }
    }
  }

  Future<String> getDeviceTokan() async {
    String? tokan = await messaging.getToken();
    return tokan ?? "";
  }

  void isTokanRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
    });
  }

  Future<void> setupInteractNotification(BuildContext context) async {
    //When app is terminated
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      if (kDebugMode) {
        print('this is my message$initialMessage');
      }
      handleMessage(context, initialMessage);
    }

    //when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });
  }

  void handleMessage(BuildContext context, RemoteMessage message) async {
    await saveNotification(NotificationModel(
        id: message.data['id'],
        title: message.notification?.body,
        message: message.notification?.title,
        createdAt: DateTime.now(),
        notificationType: "home"));

    if (message.data['type'] == 'product') {
      await saveNotification(NotificationModel(
          id: message.data['id'],
          title: message.notification?.body,
          message: message.notification?.title,
          createdAt: DateTime.now(),
          notificationType: 'newProduct'));
      Get.to(() => const ProductDetailsPage());
    }
  }

  static Future<void> saveNotification(NotificationModel notification) async {
    final Box<NotificationModel> box =
        await Hive.openBox<NotificationModel>('notifications');
    await box.add(notification);
    if (kDebugMode) {
      print('Notification added: $notification');
    }
  }

  Future<List<NotificationModel>> getNotifications() async {
    final Box<NotificationModel> box =
        await Hive.openBox<NotificationModel>('notifications');
    final List<NotificationModel> notifications = box.values.toList();
    if (kDebugMode) {
      print('Notifications retrieved: ${notifications[0].message}');
    }
    return notifications;
  }
}
