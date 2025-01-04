import 'package:flutter/material.dart';

class AppSize {
  static double setFullSizeWidth = 0;
  static double setFullSizeHeight = 0;

  static List<double> initSize(BuildContext context) {
    setFullSizeHeight = MediaQuery.of(context).size.height;
    setFullSizeWidth = MediaQuery.of(context).size.width;
    return [setFullSizeWidth, setFullSizeHeight];
  }

  static double four = setFullSizeHeight * 0.004;
  static double six = setFullSizeHeight * 0.006;
  static double eight = setFullSizeHeight * 0.008;
  static double twelve = setFullSizeHeight * 0.012;
  static double sixteen = setFullSizeHeight * 0.016;
  static double twenty = setFullSizeHeight * 0.020;
  static double twentyFour = setFullSizeHeight * 0.024;
  static double twentyEight = setFullSizeHeight * 0.028;
  static double thirtyEight = setFullSizeHeight * 0.038;
  static double forty = setFullSizeHeight * 0.040;
  static double sixty = setFullSizeHeight * 0.060;
}
