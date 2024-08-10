import 'package:digital_market/models/home_subject.dart';
import 'package:digital_market/utill/url_Paths.dart';
import 'package:digital_market/utill/url_base.dart';
import 'package:get/get.dart';

class HomeRepository extends GetConnect {
  Future<HomeSubjects> homeSubjects() async {
    final response = await get(
      BaseUrl.baseUrl + UrlPathHelper.getValue(UrlPath.homeSubject),
      headers: {
        "Content-Type": "application/json",
      },
    );
    return HomeSubjects.fromJson(response.body);
  }
  Future<HomeSubjects> getCategories(subjectId) async {
    final response = await get(
      "${BaseUrl.baseUrl}category/get?subject=$subjectId",
      headers: {
        "Content-Type": "application/json",
      },
    );
    return HomeSubjects.fromJson(response.body);
  }



}
