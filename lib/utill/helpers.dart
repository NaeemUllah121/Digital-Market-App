import 'package:connectivity/connectivity.dart';
import 'package:digital_market/controllers/network_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'constants/color_manager.dart';

errorSnackbar(String successMsg) {
  return Get.snackbar(
    "Error".tr,
    successMsg,
    icon: const Icon(
      Icons.error_outline,
      color: ColorsManager.white,
    ),
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.red,
    duration: const Duration(seconds: 2),
    colorText: ColorsManager.white,
    snackbarStatus: (status) {
      if (status == SnackbarStatus.CLOSED) {}
    },
  );
}

successSnackbar(String successMsg) {
  return Get.snackbar(
    "Notification",
    successMsg,
    icon: const Icon(
      Icons.check,
      color: ColorsManager.white,
    ),
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.orange,
    colorText: ColorsManager.white,
    snackbarStatus: (status) {
      if (status == SnackbarStatus.CLOSED) {}
    },
  );
}

successSnackbarReplace(int index, String successMsg) {
  return Get.snackbar(
    "notification",
    successMsg,
    icon: const Icon(Icons.check, color: ColorsManager.white),
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.orange,
    colorText: ColorsManager.white,
    snackbarStatus: (status) {
      if (status == SnackbarStatus.CLOSED) {
        ///forgot
        if (index == 0) {}
      }
    },
  );
}

class NetworkToast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
        stream: Get.find<NetworkController>().connectionStatusStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData || snapshot.data == ConnectivityResult.none) {
            Fluttertoast.showToast(
                msg: "Network Connection Lost!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }

          return Container();
        });
  }
}
