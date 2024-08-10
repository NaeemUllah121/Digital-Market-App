class EnglishTest {
  Question? question;
  bool? status;

  EnglishTest({this.question, this.status});

  EnglishTest.fromJson(Map<String, dynamic> json) {
    question = json['question'] != null
        ? Question.fromJson(json['question'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (question != null) {
      data['question'] = question!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class Question {
  int? id;
  int? sample;
  int? category;
  List<String>? text;
  String? instruction;
  String? categoryName;

  Question(
      {this.id,
        this.sample,
        this.category,
        this.text,
        this.instruction,
        this.categoryName});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sample = json['sample'];
    category = json['category'];
    text = json['text'].cast<String>();
    instruction = json['instruction'];
    categoryName = json['categoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sample'] = sample;
    data['category'] = category;
    data['text'] = text;
    data['instruction'] = instruction;
    data['categoryName'] = categoryName;
    return data;
  }
}
