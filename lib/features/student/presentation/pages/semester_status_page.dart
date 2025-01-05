import 'package:amozeshyar/config/service_locator.dart';
import 'package:amozeshyar/core/extensions/color_extension.dart';
import 'package:amozeshyar/core/notifications/notification_service.dart';
import 'package:amozeshyar/core/utils/app_size.dart';
import 'package:amozeshyar/core/widgets/custom_text.dart';
import 'package:amozeshyar/features/student/presentation/cubit/student_cubit.dart';
import 'package:amozeshyar/features/student/presentation/widgets/course_item_widget.dart';
import 'package:amozeshyar/features/student/presentation/widgets/units_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SemesterStatusPage extends StatefulWidget {
  const SemesterStatusPage({super.key});

  @override
  State<SemesterStatusPage> createState() => _SemesterStatusPageState();
}

class _SemesterStatusPageState extends State<SemesterStatusPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<StudentCubit>(
      create: (context) => sl<StudentCubit>()..fetchStudents(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          centerTitle: true,
          title: CustomText(
            data: 'وضعیت نیمسال',
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
                    UnitsInfoWidget(students: state.students),
                    SizedBox(height: AppSize.sixteen),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSize.sixteen * 2),
                      child: CustomText(
                        data: 'واحد های نیمسال',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: AppSize.setFullSizeHeight * 0.7,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: state.students.first.courses?.length,
                        itemBuilder: (context, index) {
                          return CourseItemWidget(
                            course: state.students.first.courses?[index],
                          );
                        },
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
