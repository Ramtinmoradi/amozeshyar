import 'package:amozeshyar/core/utils/app_size.dart';
import 'package:amozeshyar/core/widgets/custom_container.dart';
import 'package:amozeshyar/core/widgets/parameter_and_value.dart';
import 'package:amozeshyar/features/student/domain/models/student_model.dart';
import 'package:flutter/material.dart';

class FinancialStatusWidget extends StatelessWidget {
  const FinancialStatusWidget({
    super.key,
    required this.financialStatus,
  });

  final FinancialStatus? financialStatus;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      hasHeader: true,
      headerTitle: 'وضعیت کلی مالی',
      child: Column(
        children: [
          ParameterAndValue(
            isPrice: false,
            parameter: 'جمع کل پرداختی',
            textValue: '${financialStatus?.credit}',
          ),
          SizedBox(height: AppSize.sixteen),
          ParameterAndValue(
            isPrice: false,
            parameter: 'جمع کل بدهکاری',
            textValue: '${financialStatus?.debt}',
          ),
          SizedBox(height: AppSize.sixteen),
          ParameterAndValue(
            isPrice: false,
            parameter: 'جمع کل بستانکاری',
            textValue: '${financialStatus?.finalBalance}',
          ),
        ],
      ),
    );
  }
}
