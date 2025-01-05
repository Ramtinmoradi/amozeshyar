import 'dart:async';

import 'package:amozeshyar/features/student/domain/models/student_model.dart';
import 'package:amozeshyar/features/student/domain/repositories/student_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  final StudentRepository studentRepository;

  StudentCubit({required this.studentRepository}) : super(StudentInitial());

  FutureOr<void> fetchStudents() async {
    try {
      emit(StudentLoadingState());
      Future.delayed(Duration(milliseconds: 1000)).then((_) async {
        final students = await studentRepository.getStudentData();
        emit(StudentLoadedSuccessfulState(students));
      });
    } catch (e) {
      emit(StudentErrorState(e.toString()));
    }
  }

  FutureOr<void> searchData({required String data}) async {
    try {
      emit(StudentLoadingState());
      Future.delayed(Duration(milliseconds: 1000)).then((_) async {
        final students = await studentRepository.searchStudentData(data: data);
        emit(SearchDataSuccessfulState(students));
      });
    } catch (e) {
      emit(StudentErrorState(e.toString()));
    }
  }
}
