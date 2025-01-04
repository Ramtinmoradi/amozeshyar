import 'package:amozeshyar/core/extensions/color_extension.dart';
import 'package:amozeshyar/core/utils/app_size.dart';
import 'package:amozeshyar/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.hasHeader = false,
    this.headerTitle,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.color,
    this.onTap,
    this.radius,
    this.dashLength,
    this.dottedWidth,
    this.borderRadius,
    this.hasDottedborder = false,
  });

  final bool hasHeader;
  final String? headerTitle;
  final Widget? child;
  final double? width;
  final double? height;
  final Color? color;
  final double? radius;
  final double? dashLength;
  final double? dottedWidth;
  final BorderRadiusGeometry? borderRadius;

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool hasDottedborder;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: AppSize.sixteen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (hasHeader)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.sixteen),
              child: CustomText(
                data: headerTitle!,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (hasHeader) SizedBox(height: AppSize.eight),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: width ?? double.infinity,
              height: height,
              padding: margin ?? EdgeInsets.all(AppSize.eight),
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(radius ?? 8.0),
                ),
              ),
              decoration: BoxDecoration(
                color: color ?? Theme.of(context).whiteColor,
                borderRadius: borderRadius ??
                    BorderRadius.all(
                      Radius.circular(radius ?? 8.0),
                    ),
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
