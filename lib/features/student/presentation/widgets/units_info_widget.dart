import 'package:amozeshyar/core/utils/app_size.dart';
import 'package:amozeshyar/core/widgets/custom_container.dart';
import 'package:amozeshyar/core/widgets/parameter_and_value.dart';
import 'package:amozeshyar/features/student/domain/models/student_model.dart';
import 'package:flutter/material.dart';

class UnitsInfoWidget extends StatelessWidget {
  const UnitsInfoWidget({
    super.key,
    required this.students,
  });

  final List<StudentModel> students;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      hasHeader: true,
      headerTitle: 'وضعیت کلی نیمسال',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ParameterAndValue(
            isPrice: false,
            parameter: 'تعداد واحد ترم',
            textValue: '${students.first.unitsInfo?.totalUnits}',
          ),
          SizedBox(height: AppSize.sixteen),
          ParameterAndValue(
            isPrice: false,
            parameter: 'شهریه ثابت',
            textValue: '${students.first.unitsInfo?.fixedTuition}',
          ),
          SizedBox(height: AppSize.sixteen),
          ParameterAndValue(
            isPrice: false,
            parameter: 'بدهی به دانشگاه',
            textValue: '${students.first.unitsInfo?.variableTuition}',
          ),
          SizedBox(height: AppSize.sixteen),
          ParameterAndValue(
            isPrice: false,
            parameter: 'کل مبلغ پرداختی ترم',
            textValue: '${students.first.unitsInfo?.totalTuition}',
          ),
        ],
      ),
    );
  }
}
