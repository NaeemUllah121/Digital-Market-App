import 'package:digital_market/models/students.dart';
import 'package:digital_market/repository/student_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../utill/helpers.dart';
import '../views/Home/home_navbar.dart';

class StudentController extends GetxController with StateMixin<Student> {
  final StudentRepository _repository = StudentRepository();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController gradeController = TextEditingController();

  RxList<Data> students = <Data>[].obs;
  RxBool isLoading = true.obs;
  final gender = ''.obs;
  final userType = 'Islamabad'.obs;
  @override
  void onInit() {
    getStudentList();
    super.onInit();
  }

  void setUserType(String value) {
    userType.value = value;
  }
  void setGender(String value) {
    gender.value = value;
  }

  Future<void> getStudentList(
      {String perPage = "5",
      String currentPage = "1",
      String search = ""}) async {
    try {
      isLoading(true);
      final response =
          await _repository.getStudentList(perPage, currentPage, search);
      if (response.status == true) {
        students.assignAll(response.result?.data ?? []);
      } else {
        if (kDebugMode) {
          print("Error status: ${response.status}");
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print("Error: $error");
      }
    } finally {
      isLoading(false); // Set loading indicator to false
    }
  }

  void observeText(String search) {
    searStudent(search: search);
  }

  Future<void> searStudent(
      {String perPage = "5",
      String currentPage = "1",
      required String search}) async {
    try {
      isLoading(true);
      final response =
          await _repository.searchStudent(perPage, currentPage, search);
      if (response.status == true) {
        students.assignAll(response.result?.data ?? []);
      } else {
        if (kDebugMode) {
          print("Error status: ${response.status}");
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print("Error: $error");
      }
    } finally {
      isLoading(false); // Set loading indicator to false
    }
  }

  Future<bool> addStudent() async {
    final studentName = nameController.value.text;
    final age = ageController.value.text;
    final grade = gradeController.value.text;
    final selectedGender = gender.value;

    try {
      isLoading(true).obs;
      final response =
          await _repository.addStudent(studentName, age, grade, selectedGender);
      if (response.status == true) {
        isLoading(false).obs;
        Get.offAll(() => const HomeNavbar());
        successSnackbar(response.message.toString());
        return true;
      } else {
        isLoading(false).obs;
        // errorSnackbar(response.message.toString());
        return false;
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      isLoading(false).obs;
      return false;
    }
  }

  Future<bool> deleteStudent(String studentId) async {
    isLoading(true).obs;
    try {
      final response = await _repository.deleteStudent(studentId);
      if (response.status == true) {
        students.removeWhere((student) => student.id.toString() == studentId);
        isLoading(false).obs;
        Get.back();
        successSnackbar(response.message.toString());
        return true;
      } else {
        isLoading(false).obs;
        // errorSnackbar(response.message.toString());
        return false;
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      isLoading(false).obs;
      return false;
    }
  }

  Future<bool> editStudent(String pin) async {
    final studentName = nameController.value.text;
    final age = ageController.value.text;
    final grade = gradeController.value.text;
    try {
      isLoading(true).obs;
      final response =
          await _repository.editStudent(pin, studentName, age, grade);
      if (kDebugMode) {
        print(response.message);
      }
      if (response.status == true) {
        await getStudentList();
        isLoading(false).obs;
        Get.back();
        successSnackbar(response.message.toString());
        return true;
      } else {
        isLoading(false).obs;
        // errorSnackbar(response.message.toString());
        return false;
      }
    } catch (error) {
      isLoading(false).obs;
      if (kDebugMode) {
        (error);
      }
      return false;
    }
  }
}
