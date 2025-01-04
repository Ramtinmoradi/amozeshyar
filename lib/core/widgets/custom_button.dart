import 'package:amozeshyar/core/extensions/color_extension.dart';
import 'package:amozeshyar/core/utils/app_size.dart';
import 'package:amozeshyar/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    this.child,
    this.text,
    this.haveBorder = false,
    this.elevation,
    this.padding,
    this.height,
    this.width,
  });

  final VoidCallback? onPressed;
  final Widget? child;
  final String? text;
  final bool haveBorder;
  final double? elevation;
  final EdgeInsets? padding;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: elevation ?? 0,
        padding: padding ?? EdgeInsets.all(AppSize.twelve),
        fixedSize: Size(
          width ?? AppSize.setFullSizeWidth - (AppSize.sixteen * 2),
          AppSize.setFullSizeHeight * 0.045,
        ),
        backgroundColor: haveBorder ? Theme.of(context).whiteColor : Theme.of(context).primaryColor,
        disabledBackgroundColor: haveBorder ? Theme.of(context).whiteColor : Theme.of(context).inactiveColor,
        foregroundColor: haveBorder ? Theme.of(context).primaryColor : Theme.of(context).whiteColor,
        disabledForegroundColor: haveBorder ? Theme.of(context).inactiveColor : Theme.of(context).whiteColor,
        textStyle: Theme.of(context).textTheme.titleMedium,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: haveBorder ? 1 : 0,
            color: haveBorder
                ? onPressed != null
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).inactiveColor
                : Colors.transparent,
          ),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
      ),
      onPressed: onPressed,
      child: child ??
          CustomText(
            data: text!,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: haveBorder ? Theme.of(context).primaryColor : Theme.of(context).whiteColor,
                ),
          ),
    );
  }
}
