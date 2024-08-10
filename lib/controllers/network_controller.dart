import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final _connectionStatusStream =
      StreamController<ConnectivityResult>.broadcast();
  var connectionStatus = Rx<ConnectivityResult>(ConnectivityResult.none).obs;

  @override
  void onInit() {
    super.onInit();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      connectionStatus.value = result.obs;
      _connectionStatusStream.add(result);
    });
  }

  Stream<ConnectivityResult> get connectionStatusStream =>
      _connectionStatusStream.stream;

  @override
  void onClose() {
    _connectionStatusStream.close();
    super.onClose();
  }
}
