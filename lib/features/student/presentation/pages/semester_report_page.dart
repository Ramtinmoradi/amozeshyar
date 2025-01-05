import 'package:amozeshyar/config/service_locator.dart';
import 'package:amozeshyar/core/extensions/color_extension.dart';
import 'package:amozeshyar/core/widgets/custom_text.dart';
import 'package:amozeshyar/features/student/presentation/cubit/student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SemesterReportPage extends StatefulWidget {
  const SemesterReportPage({super.key});

  @override
  State<SemesterReportPage> createState() => _SemesterReportPageState();
}

class _SemesterReportPageState extends State<SemesterReportPage> {
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
      ),
    );
  }
}
