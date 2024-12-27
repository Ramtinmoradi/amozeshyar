import 'package:flutter/widgets.dart';

class SizeConfig {
  static double? _screenWidth;
  static double? _screenHeight;
  static double? _blockWidth = 0;
  static double? _blockHeight = 0;

  static double? textMultiplier;
  static double? imageSizeMultiplier;
  static double? heightMultiplier;
  static double? widthMultiplier;
  static bool isPortrait = true;

  static const double deviceHeight = 8.12;
  static const double devicewidth = 3.75;

  static const double landScapeWidthItem = 135.3325; //( WidthScreen - bill width) /4
  static const double landScapeHeightItem = 36.5; // heightScreen /10

  void init(BoxConstraints constraints, Orientation orientation) {
    _screenWidth = constraints.maxWidth;
    _screenHeight = constraints.maxHeight;
    _blockWidth = _screenWidth! / 100;
    _blockHeight = _screenHeight! / 100;
    if (orientation == Orientation.portrait) {
      isPortrait = true;
    } else {
      isPortrait = false;
    }

    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;
  }
}

double calWidthScale(double size) =>
    (size / (SizeConfig.isPortrait ? SizeConfig.devicewidth : SizeConfig.deviceHeight) * SizeConfig.widthMultiplier!);
double calHeightScale(double size) =>
    (size / (SizeConfig.isPortrait ? SizeConfig.deviceHeight : SizeConfig.devicewidth) * SizeConfig.heightMultiplier!);
