// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvg extends StatelessWidget {
  const CustomSvg({
    super.key,
    required this.assetName,
    this.width,
    this.height,
    this.fit,
    this.theme,
    this.colorFilter,
    this.color,
  });

  final String assetName;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final SvgTheme? theme;
  final ColorFilter? colorFilter;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
      theme: theme,
      color: color,
      colorFilter: colorFilter,
    );
  }
}
