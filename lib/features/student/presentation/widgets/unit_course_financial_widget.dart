import 'package:amozeshyar/core/utils/app_size.dart';
import 'package:amozeshyar/core/widgets/custom_container.dart';
import 'package:amozeshyar/core/widgets/parameter_and_value.dart';
import 'package:amozeshyar/features/student/domain/models/student_model.dart';
import 'package:flutter/material.dart';

class UnitCourseFinancialWidget extends StatelessWidget {
  const UnitCourseFinancialWidget({
    super.key,
    required this.courses,
  });

  final List<Course> courses;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      hasHeader: true,
      headerTitle: 'هزینه واحد های نیمسال به تفکیک',
      margin: EdgeInsets.symmetric(horizontal: AppSize.sixteen),
      child: SizedBox(
        height: AppSize.thirtyEight * courses.length,
        child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: AppSize.eight),
              child: ParameterAndValue(
                isPrice: false,
                parameter: '${index + 1} - ${course.courseName}',
                textValue: '${course.tuition}',
              ),
            );
          },
        ),
      ),
    );
  }
}
