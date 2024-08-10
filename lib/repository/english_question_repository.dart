import 'package:digital_market/models/english_question_model.dart';
import 'package:get/get_connect/connect.dart';
import '../utill/url_base.dart';

class EnglishQuestionRepo extends GetConnect {
  Future<EnglishTest> getQuestion(String sampleId, String categoryId) async {
    final response = await get(
      "${BaseUrl.baseUrl}english/get?sample=$sampleId&category=$categoryId",
      headers: {
        "Content-Type": "application/json",
      },
    );
    return EnglishTest.fromJson(response.body);
  }
}