import 'package:amozeshyar/core/utils/app_size.dart';
import 'package:amozeshyar/core/widgets/custom_container.dart';
import 'package:amozeshyar/core/widgets/parameter_and_value.dart';
import 'package:amozeshyar/features/student/domain/models/student_model.dart';
import 'package:flutter/material.dart';

class SearchUnitItemWidget extends StatelessWidget {
  const SearchUnitItemWidget({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: EdgeInsets.only(bottom: AppSize.sixteen),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ParameterAndValue(
            isPrice: false,
            parameter: 'نام درس',
            textValue: course.courseName ?? '',
          ),
          SizedBox(height: AppSize.eight),
          ParameterAndValue(
            isPrice: false,
            parameter: 'کد درس',
            textValue: course.courseCode ?? '',
          ),
          SizedBox(height: AppSize.eight),
          ParameterAndValue(
            isPrice: false,
            parameter: 'نام استاد',
            textValue: course.instructor ?? '',
          ),
          SizedBox(height: AppSize.eight),
          ParameterAndValue(
            isPrice: false,
            parameter: 'ساعات برگزاری کلاس',
            textValue: course.time ?? '',
          ),
        ],
      ),
    );
  }
}
