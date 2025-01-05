import 'package:amozeshyar/core/utils/app_size.dart';
import 'package:amozeshyar/core/widgets/custom_container.dart';
import 'package:amozeshyar/core/widgets/parameter_and_value.dart';
import 'package:amozeshyar/features/student/domain/models/student_model.dart';
import 'package:flutter/material.dart';

class CourseItemWidget extends StatelessWidget {
  const CourseItemWidget({
    super.key,
    required this.course,
  });

  final Course? course;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: EdgeInsets.symmetric(horizontal: AppSize.sixteen, vertical: AppSize.eight),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ParameterAndValue(
            isPrice: false,
            parameter: 'نام درس',
            textValue: '${course?.courseName}',
          ),
          SizedBox(height: AppSize.sixteen),
          ParameterAndValue(
            isPrice: false,
            parameter: 'کد درس',
            textValue: '${course?.courseCode}',
          ),
          SizedBox(height: AppSize.sixteen),
          ParameterAndValue(
            isPrice: false,
            parameter: 'واحد',
            textValue: '${course?.credits} واحد',
          ),
          SizedBox(height: AppSize.sixteen),
          ParameterAndValue(
            isPrice: false,
            parameter: 'استاد',
            textValue: '${course?.instructor}',
          ),
          SizedBox(height: AppSize.sixteen),
          ParameterAndValue(
            isPrice: false,
            parameter: 'محل برگذاری',
            textValue: '${course?.location}',
          ),
          SizedBox(height: AppSize.sixteen),
          ParameterAndValue(
            isPrice: false,
            parameter: 'زمان برگذاری کلاس',
            textValue: '${course?.time}',
          ),
        ],
      ),
    );
  }
}
