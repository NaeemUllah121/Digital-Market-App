import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class FCMController extends GetxController {
  late FirebaseMessaging _firebaseMessaging;

  @override
  void onInit() {
    super.onInit();
    _firebaseMessaging = FirebaseMessaging.instance;

    // Handle onMessage when the app is in the foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("FCM Message received: ${message.notification?.title}");
      // You can handle the incoming message here
    });

    // Handle onResume when the app is in the background but opened by the user
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("FCM Message opened app: ${message.notification?.title}");
      // You can handle the message here
    });

    // Handle onBackgroundMessage when the app is in terminated state
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);

    // Request FCM token
    _firebaseMessaging.getToken().then((token) {
      print("FCM Token: $token");
      // Save the token or send it to your server
    });
  }

  // Handle FCM background messages
  Future<void> _handleBackgroundMessage(RemoteMessage message) async {
    print("FCM Background Message received: ${message.notification?.title}");
    // You can handle the message here
  }
}
