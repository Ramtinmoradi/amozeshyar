import 'package:amozeshyar/features/student/domain/models/student_model.dart';

abstract class StudentRepository {
  Future<List<StudentModel>> getStudentData();
}
