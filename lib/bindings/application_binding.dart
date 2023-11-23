import 'package:aser_application/controllers/LoginController.dart';
import 'package:get/get.dart';

class ApplicationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
