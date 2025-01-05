import 'dart:convert';

import 'package:amozeshyar/features/student/domain/models/student_model.dart';
import 'package:flutter/services.dart';

class StudentLocalDatasource {
  Future<List<StudentModel>> loadJson() async {
    try {
      String jsonString = await rootBundle.loadString('assets/jsons/example_json.json');

      Map<String, dynamic> jsonData = json.decode(jsonString);

      List<StudentModel> studentsData = [StudentModel.fromJson(jsonData)];

      return studentsData;
    } catch (e) {
      throw Exception("Error loading or parsing JSON: $e");
    }
  }

  Future<List<Course>> searchData({required String data}) async {
    try {
      String jsonString = await rootBundle.loadString('assets/jsons/example_json.json');
      Map<String, dynamic> jsonData = json.decode(jsonString);

      List<dynamic> coursesData = jsonData['courses'];

      final fetchData = coursesData.map((item) => Course.fromJson(item)).toList();

      return fetchData.where((course) => course.courseName?.contains(data) ?? false).toList();
    } catch (e) {
      throw Exception("Error loading or parsing JSON: $e");
    }
  }
}
