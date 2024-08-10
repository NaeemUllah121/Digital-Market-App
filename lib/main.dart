import 'package:digital_market/bindings/application_binding.dart';
import 'package:digital_market/models/notifications/notification_model.dart';
import 'package:digital_market/utill/constants/string_manager.dart';
import 'package:digital_market/utill/firebase_options.dart';
import 'package:digital_market/views/StartUp/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'models/local_products/recently_viewed_products.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent));
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  messaging.subscribeToTopic('user_notifications');
  FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(NotificationModelAdapter());
  Hive.registerAdapter(LocalProductsAdapter());
  await Hive.openBox<NotificationModel>('notifications');
  await Hive.openBox<LocalProducts>('products');
  runApp(const MyApp());
}

@pragma('vm:entry-point')
Future<void> backgroundMessageHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: StringManager.appName,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialBinding: ApplicationBindings(),
            home: const SplashScreen(),
          );
        });
  }
}
