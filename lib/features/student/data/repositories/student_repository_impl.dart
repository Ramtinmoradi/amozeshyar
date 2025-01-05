import 'package:amozeshyar/features/student/data/datasource/student_local_datasource.dart';
import 'package:amozeshyar/features/student/domain/models/student_model.dart';
import 'package:amozeshyar/features/student/domain/repositories/student_repository.dart';

class StudentRepositoryImpl extends StudentRepository {
  StudentRepositoryImpl({required this.localDatasource});

  final StudentLocalDatasource localDatasource;

  @override
  Future<List<StudentModel>> getStudentData() async {
    try {
      return await localDatasource.loadJson();
    } catch (e) {
      throw Exception("Error in repository: $e");
    }
  }

  @override
  Future<List<Course>> searchStudentData({required String data}) async {
    try {
      return await localDatasource.searchData(data: data);
    } catch (e) {
      throw Exception("Error in repository: $e");
    }
  }
}
