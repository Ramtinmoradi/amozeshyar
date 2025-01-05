import 'package:amozeshyar/config/service_locator.dart';
import 'package:amozeshyar/core/extensions/color_extension.dart';
import 'package:amozeshyar/core/notifications/notification_service.dart';
import 'package:amozeshyar/core/utils/app_size.dart';
import 'package:amozeshyar/core/widgets/custom_text.dart';
import 'package:amozeshyar/core/widgets/custom_text_form_field.dart';
import 'package:amozeshyar/features/student/presentation/cubit/student_cubit.dart';
import 'package:amozeshyar/features/student/presentation/widgets/select_unit_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnitSelectionPage extends StatefulWidget {
  const UnitSelectionPage({super.key});

  @override
  State<UnitSelectionPage> createState() => _UnitSelectionPageState();
}

class _UnitSelectionPageState extends State<UnitSelectionPage> {
  final TextEditingController studentSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StudentCubit>(
      create: (context) => sl<StudentCubit>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          centerTitle: true,
          title: CustomText(
            data: 'انتخاب واحد',
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AppSize.sixteen),
            child: BlocConsumer<StudentCubit, StudentState>(
              listener: (context, state) {
                if (state is StudentErrorState) {
                  sl<ToastNotifier>().showError(message: state.message);
                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    CustomTextFormField(
                      textEditingController: studentSearchController,
                      labelText: 'نام درس را وارد کنید',
                      hintText: 'برنامه نویسی',
                      suffix: GestureDetector(
                        onTap: () {
                          BlocProvider.of<StudentCubit>(context).searchData(
                            data: studentSearchController.text,
                          );
                        },
                        child: Icon(
                          CupertinoIcons.search,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(height: AppSize.sixteen),
                    if (state is StudentLoadingState)
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    if (state is SearchDataSuccessfulState && state.course.isEmpty)
                      CustomText(data: 'هیچ درسی یافت نشد.'),
                    if (state is SearchDataSuccessfulState && state.course.isNotEmpty)
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.course.length,
                          itemBuilder: (context, index) {
                            return SelectUnitItemWidget(
                              course: state.course[index],
                            );
                          },
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
