import 'package:digital_market/models/user_data_model.dart';

class HomeSubjects {
  List<Result>? result;
  List<Categories>? categories;
  List<Sample>? samples;
  bool? status;
  UserModel? userModel;

  HomeSubjects({
    this.result,
    this.status,
    this.categories,
    this.samples,
    this.userModel
  });

  HomeSubjects.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['samples'] != null) {
      samples = <Sample>[];
      json['samples'].forEach((v) {
        samples!.add(Sample.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (samples != null) {
      data['samples'] = samples!.map((e) => e.toJson()).toList();
    }

    data['status'] = status;
    return data;
  }
}

class Result {
  int? id;
  String? name;
  String? value;

  Result({this.id, this.name, this.value});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['value'] = value;
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? value;
  int? subject;

  Categories({this.id, this.name, this.value, this.subject});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    value = json['value'];
    subject = json['subject'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['value'] = value;
    data['subject'] = subject;
    return data;
  }
}

class Sample {
  int? id;
  String? name;
  String? value;
  int? subject;

  Sample({this.id, this.name, this.value, this.subject});

  Sample.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    value = json['value'];
    subject = json['subject'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['value'] = value;
    data['subject'] = subject;
    return data;
  }
}
