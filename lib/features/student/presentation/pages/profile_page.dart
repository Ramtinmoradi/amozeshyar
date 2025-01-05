import 'package:amozeshyar/config/service_locator.dart';
import 'package:amozeshyar/core/extensions/color_extension.dart';
import 'package:amozeshyar/core/notifications/notification_service.dart';
import 'package:amozeshyar/core/utils/app_size.dart';
import 'package:amozeshyar/core/widgets/custom_container.dart';
import 'package:amozeshyar/core/widgets/custom_text.dart';
import 'package:amozeshyar/core/widgets/parameter_and_value.dart';
import 'package:amozeshyar/features/student/presentation/cubit/student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<StudentCubit>(
      create: (context) => sl<StudentCubit>()..fetchStudents(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).backgroundColor,
          title: CustomText(
            data: 'پروفایل',
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        body: BlocConsumer<StudentCubit, StudentState>(
          listener: (context, state) {
            if (state is StudentErrorState) {
              sl<ToastNotifier>().showError(message: state.message);
            }
          },
          builder: (context, state) {
            if (state is StudentLoadedSuccessfulState) {
              return SafeArea(
                child: CustomContainer(
                  hasHeader: true,
                  headerTitle: 'اطلاعات کاربری شما',
                  margin: EdgeInsets.all(AppSize.sixteen),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Theme.of(context).backgroundColor,
                        radius: 100.0,
                        child: Center(
                          child: Icon(
                            Icons.person,
                            size: 150.0,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: AppSize.sixty),
                      ParameterAndValue(
                        isPrice: false,
                        parameter: 'نام و نام خانوادگی',
                        textValue: '${state.students.first.studentInfo?.name}',
                      ),
                      SizedBox(height: AppSize.sixteen),
                      ParameterAndValue(
                        isPrice: false,
                        parameter: 'شماره دانشجویی',
                        textValue: '${state.students.first.studentInfo?.studentNumber}',
                      ),
                      SizedBox(height: AppSize.sixteen),
                      ParameterAndValue(
                        isPrice: false,
                        parameter: 'رشته تحصیلی',
                        textValue: '${state.students.first.studentInfo?.major}',
                      ),
                      SizedBox(height: AppSize.sixteen),
                      ParameterAndValue(
                        isPrice: false,
                        parameter: 'دانشکده',
                        textValue: '${state.students.first.studentInfo?.faculty}',
                      ),
                      SizedBox(height: AppSize.sixteen),
                      ParameterAndValue(
                        isPrice: false,
                        parameter: 'ورودی سال',
                        textValue: '${state.students.first.studentInfo?.entryYear}',
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is StudentLoadingState) {
              return SafeArea(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
