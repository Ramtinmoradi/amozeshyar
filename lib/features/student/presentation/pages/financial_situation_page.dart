import 'package:amozeshyar/config/service_locator.dart';
import 'package:amozeshyar/core/extensions/color_extension.dart';
import 'package:amozeshyar/core/notifications/notification_service.dart';
import 'package:amozeshyar/core/utils/app_size.dart';
import 'package:amozeshyar/core/widgets/custom_text.dart';
import 'package:amozeshyar/features/student/presentation/cubit/student_cubit.dart';
import 'package:amozeshyar/features/student/presentation/widgets/financial_status_widget.dart';
import 'package:amozeshyar/features/student/presentation/widgets/unit_course_financial_widget.dart';
import 'package:amozeshyar/features/student/presentation/widgets/units_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinancialSituationPage extends StatefulWidget {
  const FinancialSituationPage({super.key});

  @override
  State<FinancialSituationPage> createState() => _FinancialSituationPageState();
}

class _FinancialSituationPageState extends State<FinancialSituationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<StudentCubit>(
      create: (context) => sl<StudentCubit>()..fetchStudents(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          centerTitle: true,
          title: CustomText(
            data: 'وضعیت مالی',
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: SafeArea(
          child: BlocConsumer<StudentCubit, StudentState>(
            listener: (context, state) {
              if (state is StudentErrorState) {
                sl<ToastNotifier>().showError(message: state.message);
              }
            },
            builder: (context, state) {
              if (state is StudentLoadedSuccessfulState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FinancialStatusWidget(
                      financialStatus: state.students.first.financialStatus,
                    ),
                    SizedBox(height: AppSize.sixteen),
                    UnitsInfoWidget(
                      students: state.students,
                    ),
                    SizedBox(height: AppSize.sixteen),
                    UnitCourseFinancialWidget(
                      courses: state.students.first.courses!,
                    ),
                  ],
                );
              } else if (state is StudentLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
