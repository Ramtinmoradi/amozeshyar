import 'dart:async';

import 'package:amozeshyar/features/student/domain/models/student_model.dart';
import 'package:amozeshyar/features/student/domain/repositories/student_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  final StudentRepository studentRepository;

  StudentCubit(this.studentRepository) : super(StudentInitial());

  FutureOr<void> fetchStudents() async {
    try {
      emit(StudentLoadingState());
      final students = await studentRepository.getStudentData();
      emit(StudentLoadedSuccessfulState(students));
    } catch (e) {
      emit(StudentErrorState(e.toString()));
    }
  }
}
