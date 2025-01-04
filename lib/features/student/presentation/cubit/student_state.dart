part of 'student_cubit.dart';

sealed class StudentState extends Equatable {
  const StudentState();

  @override
  List<Object> get props => [];
}

final class StudentInitial extends StudentState {}

class StudentLoadingState extends StudentState {}

class StudentLoadedSuccessfulState extends StudentState {
  final List<StudentModel> students;

  const StudentLoadedSuccessfulState(this.students);

  @override
  List<Object> get props => [students];
}

class StudentErrorState extends StudentState {
  final String message;

  const StudentErrorState(this.message);

  @override
  List<Object> get props => [message];
}
