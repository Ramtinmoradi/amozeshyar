import 'package:flutter/material.dart';

extension CustomColor on ThemeData {
  Color get primaryColor => brightness == Brightness.light ? const Color(0xff330099) : const Color(0xff330099);

  Color get backgroundColor => brightness == Brightness.light ? const Color(0xFFF6F7F9) : const Color(0xFFF6F7F9);

  Color get receptionCardColor => brightness == Brightness.light ? const Color(0xffFFFFFF) : const Color(0xFF1D223F);

  Color get successColor => brightness == Brightness.light ? const Color(0xff44BB55) : const Color(0xff44BB55);

  Color get warningColor => brightness == Brightness.light ? const Color(0xffB00020) : const Color(0xffB00020);

  Color get whiteColor => brightness == Brightness.light ? const Color(0xffFFFFFF) : const Color(0xffFFFFFF);

  Color get textColor => brightness == Brightness.light ? const Color(0xff1C2225) : const Color(0xffFFFFFF);

  Color get helperTextColor => brightness == Brightness.light ? const Color(0xff343434) : const Color(0xff343434);

  Color get hintColor => brightness == Brightness.light ? const Color(0xff6C757D) : const Color(0xff6C757D);

  Color get inactiveColor => brightness == Brightness.light ? const Color(0xffCCCCCC) : const Color(0xffCCCCCC);

  Color get shadowColor => brightness == Brightness.light ? const Color(0xffD9D9D9) : const Color(0xffD9D9D9);
}
