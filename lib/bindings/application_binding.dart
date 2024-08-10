import 'package:digital_market/controllers/LoginController.dart';
import 'package:digital_market/controllers/SignUpController.dart';
import 'package:digital_market/controllers/register_controller.dart';
import 'package:digital_market/controllers/student_controller.dart';
import 'package:get/get.dart';

class ApplicationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<SignUpController>(() => SignUpController());
    Get.lazyPut<StudentController>(() => StudentController());
    Get.lazyPut<RegisterController>(()=>RegisterController());
  }
}
