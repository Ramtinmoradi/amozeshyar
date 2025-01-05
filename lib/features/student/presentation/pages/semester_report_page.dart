// ignore_for_file: unused_local_variable

import 'dart:math';

import 'package:amozeshyar/config/service_locator.dart';
import 'package:amozeshyar/core/extensions/color_extension.dart';
import 'package:amozeshyar/core/notifications/notification_service.dart';
import 'package:amozeshyar/core/utils/app_size.dart';
import 'package:amozeshyar/core/widgets/custom_container.dart';
import 'package:amozeshyar/core/widgets/custom_text.dart';
import 'package:amozeshyar/core/widgets/parameter_and_value.dart';
import 'package:amozeshyar/features/student/presentation/cubit/student_cubit.dart';
import 'package:amozeshyar/features/student/presentation/widgets/list_of_course_and_score_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SemesterReportPage extends StatefulWidget {
  const SemesterReportPage({super.key});

  @override
  State<SemesterReportPage> createState() => _SemesterReportPageState();
}

class _SemesterReportPageState extends State<SemesterReportPage> {
  final Random random = Random();

  List<int> scores = [];

  double average = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StudentCubit>(
      create: (context) => sl<StudentCubit>()..fetchStudents(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          centerTitle: true,
          title: CustomText(
            data: 'کارنامه نیمسال',
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: SafeArea(
          child: BlocConsumer<StudentCubit, StudentState>(
            listener: (context, state) {
              if (state is StudentErrorState) {
                sl<ToastNotifier>().showError(message: state.message);
              } else if (state is StudentLoadedSuccessfulState) {
                for (var element in state.students.first.courses!) {
                  scores.add(random.nextInt(21));
                }
                for (var element in scores) {
                  average += element;
                }
                average = average / scores.length;
              }
            },
            builder: (context, state) {
              if (state is StudentLoadedSuccessfulState) {
                return Column(
                  children: [
                    SizedBox(
                      height: (AppSize.sixty + 10) * state.students.first.courses!.length,
                      child: ListOfCourseAndScoreWidget(
                        scores: scores,
                        courses: state.students.first.courses!,
                      ),
                    ),
                    CustomContainer(
                      color: average >= 10 ? Colors.green.shade100 : Colors.red.shade100,
                      margin: EdgeInsets.all(AppSize.sixteen),
                      child: ParameterAndValue(
                        parameter: 'معدل نیمسال',
                        textValue: '$average',
                        isPrice: false,
                      ),
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
