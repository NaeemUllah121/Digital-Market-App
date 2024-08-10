import 'dart:convert';

import 'package:digital_market/models/students.dart';
import 'package:get/get.dart';
import '../store/local_store.dart';
import '../utill/url_Paths.dart';
import '../utill/url_base.dart';

class StudentRepository extends GetConnect {
  Future<Student> getStudentList(
      String perPage, String currentPage, String search) async {
    String accessToken = await LocalStore.instance.getAccessToken();
    final response = await get(
      "${BaseUrl.baseUrl}student/list?perPage=$perPage&page=$currentPage",
      headers: {
        "Content-Type": "application/json",
        "Authorization": accessToken
      },
    );
    return Student.fromJson(response.body);
  }

  Future<Student> searchStudent(
      String perPage, String currentPage, String search) async {
    String accessToken = await LocalStore.instance.getAccessToken();
    final response = await get(
      "${BaseUrl.baseUrl}student/list?perPage=$perPage&page=$currentPage&search=$search",
      headers: {
        "Content-Type": "application/json",
        "Authorization": accessToken
      },
    );
    return Student.fromJson(response.body);
  }

  Future<Student> addStudent(
      String studentName, String age, String grade, String gender) async {
    final formData = {
      'student_name': studentName,
      'age': age,
      'grade': grade,
      'gender': gender,
    };
    final jsonData = jsonEncode(formData);
    String accessToken = await LocalStore.instance.getAccessToken();
    print(jsonData);
    print(accessToken);
    final response = await post(
      BaseUrl.baseUrl + UrlPathHelper.getValue(UrlPath.homeSubject),
      json.decode(jsonData),
      headers: {
        "Content-Type": "application/json",
        "Authorization": accessToken
      },
    );

    return Student.fromJson(response.body);
  }

  Future<Student> deleteStudent(String studentId) async {
    String accessToken = await LocalStore.instance.getAccessToken();
    print(accessToken);
    final response = await delete(
      "${BaseUrl.baseUrl}student/delete/$studentId",
      headers: {
        "Content-Type": "application/json",
        "Authorization": accessToken
      },
    );

    return Student.fromJson(response.body);
  }

  Future<Student> editStudent(
      String id, String studentName, String age, String grade) async {
    final formData = {
      'student_name': studentName,
      'age': age,
      'grade': grade,
    };
    final jsonData = jsonEncode(formData);
    String accessToken = await LocalStore.instance.getAccessToken();
    print(jsonData);
    print("iddddd$id");
    print(accessToken);
    final response = await put(
      "${BaseUrl.baseUrl}student/update/$id",
      json.decode(jsonData),
      headers: {
        "Content-Type": "application/json",
        "Authorization": accessToken
      },
    );

    return Student.fromJson(response.body);
  }
}
