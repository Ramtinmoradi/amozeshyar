import 'package:amozeshyar/core/extensions/color_extension.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.data,
    this.isNumber = false,
    this.style,
    this.textAlign,
    this.textDirection = TextDirection.rtl,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.height,
  });

  final String data;
  final bool isNumber;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: isNumber
          ? Theme.of(context).textTheme.titleMedium!.copyWith(
                fontFamily: 'IranSansNumber',
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: color ?? Theme.of(context).textColor,
                height: height,
              )
          : style ??
              Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontFamily: 'IranSans',
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    color: color ?? Theme.of(context).textColor,
                    height: height,
                  ),
      textAlign: textAlign,
      textDirection: textDirection,
    );
  }
}
