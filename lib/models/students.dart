class Student {
  Result? result;
  bool? status;
  String? message;

  Student({this.result, this.status, this.message});

  Student.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class Result {
  List<Data>? data;
  int? total;
  int? totalPage;
  int? currentPage;

  Result({this.data, this.total, this.totalPage, this.currentPage});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      if (json['data'] is List) {
        data =
            List<Data>.from(json['data']!.map((dynamic x) => Data.fromJson(x)));
      }
    }
    total = json['total'];
    totalPage = json['totalPage'];
    currentPage = json['currentPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['totalPage'] = totalPage;
    data['currentPage'] = currentPage;
    return data;
  }
}

class Data {
  int? id;
  String? studentName;
  int? age;
  String? gender;
  String? grade;
  String? schoolType;
  int? teacherId;
  String? createdDate;
  String? teacherName;

  Data({
    this.id,
    this.studentName,
    this.age,
    this.gender,
    this.grade,
    this.schoolType,
    this.teacherId,
    this.createdDate,
    this.teacherName,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentName = json['student_name'];
    age = json['age'];
    gender = json['gender'];
    grade = json['grade'];
    schoolType = json['school_type'];
    teacherId = json['teacher_Id'];
    createdDate = json['created_date'];
    teacherName = json['teacher_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['student_name'] = studentName;
    data['age'] = age;
    data['gender'] = gender;
    data['grade'] = grade;
    data['school_type'] = schoolType;
    data['teacher_Id'] = teacherId;
    data['created_date'] = createdDate;
    data['teacher_name'] = teacherName;
    return data;
  }
}
