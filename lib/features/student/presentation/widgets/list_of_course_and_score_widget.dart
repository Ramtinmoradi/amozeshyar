import 'package:amozeshyar/core/utils/app_size.dart';
import 'package:amozeshyar/core/widgets/custom_container.dart';
import 'package:amozeshyar/core/widgets/parameter_and_value.dart';
import 'package:amozeshyar/features/student/domain/models/student_model.dart';
import 'package:flutter/material.dart';

class ListOfCourseAndScoreWidget extends StatelessWidget {
  const ListOfCourseAndScoreWidget({
    super.key,
    required this.scores,
    required this.courses,
  });

  final List<int> scores;
  final List<Course> courses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];

        return CustomContainer(
          color: scores[index] >= 10 ? Colors.green.shade50 : Colors.red.shade50,
          margin: EdgeInsets.all(AppSize.sixteen),
          padding: EdgeInsets.symmetric(horizontal: AppSize.sixteen, vertical: AppSize.eight),
          child: ParameterAndValue(
            isPrice: false,
            parameter: '${course.courseName}',
            textValue: 'نمره: ${scores[index]}',
          ),
        );
      },
    );
  }
}
