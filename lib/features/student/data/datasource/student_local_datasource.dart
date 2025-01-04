import 'dart:convert';

import 'package:amozeshyar/features/student/domain/models/student_model.dart';
import 'package:flutter/services.dart';

class StudentLocalDatasource {
  Future<List<StudentModel>> loadJson() async {
    try {
      String jsonString = await rootBundle.loadString('assets/jsons/example_json.json');
      List<dynamic> jsonData = json.decode(jsonString);
      return jsonData.map((item) => StudentModel.fromJson(item)).toList();
    } catch (e) {
      throw Exception("Error loading or parsing JSON: $e");
    }
  }
}
