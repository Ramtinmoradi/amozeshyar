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

class SearchDataSuccessfulState extends StudentState {
  final List<Course> course;

  const SearchDataSuccessfulState(this.course);

  @override
  List<Object> get props => [course];
}

class StudentErrorState extends StudentState {
  final String message;

  const StudentErrorState(this.message);

  @override
  List<Object> get props => [message];
}
