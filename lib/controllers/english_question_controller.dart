import 'package:digital_market/models/english_question_model.dart';
import 'package:digital_market/store/local_store.dart';
import 'package:get/get.dart';

import '../repository/english_question_repository.dart';

class EnglishQuestionController extends GetxController
    with StateMixin<EnglishTest> {
  RxBool isLoading = true.obs;
  final EnglishQuestionRepo _repository = EnglishQuestionRepo();
  RxList<String> question = <String>[].obs;
  RxString instructions = ''.obs;
  RxBool showInstructions = false.obs;
  RxString categoryName = ''.obs;

  @override
  Future<void> onInit() async {
    String arguments = await LocalStore.getSampleAndCategoryId();
    List<String> argumentParts = arguments.split(',');
    String sampleId = argumentParts[0];
    String categoryId = argumentParts[1];
    await getQuestion(sampleId, categoryId);
    super.onInit();
  }

  Future<bool> getQuestion(String sampleId, String categoryId) async {
    isLoading(true).obs;
    try {
      final response = await _repository.getQuestion(sampleId, categoryId);
      if (response.status == true) {
        print("JSON Response: ${response.toJson()}"); // Add this line
        question.clear();
        question.assignAll(response.question?.text ?? []);
        instructions.value = response.question?.instruction ?? '';
         categoryName.value =response.question?.categoryName ?? '';
        print("dhjdb ${categoryName.toString()}");
        isLoading(false).obs;
        return true;
      } else {
        print("Error status: ${response.status}");
        isLoading(false).obs;
        print("object");
        return false;
      }
    } catch (error) {
      isLoading(false).obs;
      print("Error: $error");
      print("object");
      return false;
    }
  }
}