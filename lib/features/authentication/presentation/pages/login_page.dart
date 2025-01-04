import 'dart:math';

import 'package:amozeshyar/config/service_locator.dart';
import 'package:amozeshyar/core/notifications/notification_service.dart';
import 'package:amozeshyar/core/routes/page_route.dart';
import 'package:amozeshyar/core/utils/app_size.dart';
import 'package:amozeshyar/core/widgets/custom_button.dart';
import 'package:amozeshyar/core/widgets/custom_container.dart';
import 'package:amozeshyar/core/widgets/custom_svg.dart';
import 'package:amozeshyar/core/widgets/custom_text.dart';
import 'package:amozeshyar/core/widgets/custom_text_form_field.dart';
import 'package:amozeshyar/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

  final TextEditingController studentNumberController = TextEditingController(),
      passwordController = TextEditingController(),
      captchaController = TextEditingController();

  String? captcha;

  String getRandomString(int length) {
    Random random = Random();
    return List.generate(length, (index) => chars[random.nextInt(chars.length)]).join();
  }

  @override
  void initState() {
    captcha = getRandomString(5);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: BlocListener<AuthenticationCubit, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticationErrorState) {
              sl<ToastNotifier>().showError(message: 'اطلاعات وارد شده صحیح نمی باشد');
              captcha = getRandomString(5);
            } else if (state is AuthenticationSuccessfulState) {
              sl<ToastNotifier>().showSuccess(message: 'شما وارد شدید');
              captcha = getRandomString(5);
              Navigator.pushNamed(context, homePage);
            }
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(AppSize.sixteen),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomSvg(
                      assetName: 'assets/svgs/azad-university-logo.svg',
                      height: 200.0,
                    ),
                    SizedBox(height: AppSize.thirtyEight),
                    CustomText(
                      data: 'ورود به پنل دانشجویی',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: AppSize.sixty * 2),
                    CustomTextFormField(
                      labelText: 'شماره دانشجویی',
                      hintText: 'شماره دانشجویی خود را وارد کنید',
                      textEditingController: studentNumberController,
                    ),
                    SizedBox(height: AppSize.sixteen),
                    CustomTextFormField(
                      labelText: 'رمز عبور',
                      hintText: 'رمز عبور خود را وارد کنید',
                      textEditingController: passwordController,
                    ),
                    SizedBox(height: AppSize.sixteen),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainer(
                          width: 100.0,
                          height: 50.0,
                          child: Center(
                            child: CustomText(
                              data: '$captcha',
                              fontSize: 20.0,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 250.0,
                          child: CustomTextFormField(
                            labelText: 'کپچا',
                            hintText: 'مقدار تصویر روبه رو را وارد کنید',
                            textEditingController: captchaController,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSize.sixteen),
                    BlocBuilder<AuthenticationCubit, AuthenticationState>(
                      builder: (context, state) {
                        return CustomButton(
                          onPressed: () {
                            if (studentNumberController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                              if (captcha == captchaController.text) {
                                BlocProvider.of<AuthenticationCubit>(context).checkUser(
                                  username: studentNumberController.text,
                                  password: passwordController.text,
                                );
                              } else {
                                sl<ToastNotifier>().showError(message: 'کپچا نامعتبر است.');
                                setState(() {
                                  captcha = getRandomString(5);
                                });
                              }
                            } else {
                              sl<ToastNotifier>().showError(message: 'اطلاعات را وارد کنید');
                              setState(() {
                                captcha = getRandomString(5);
                              });
                            }
                          },
                          text: state is AuthenticationLoadingState ? null : 'ورود',
                          child: state is AuthenticationLoadingState
                              ? SizedBox.square(
                                  dimension: 20.0,
                                  child: CircularProgressIndicator(),
                                )
                              : null,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
