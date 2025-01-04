import 'package:amozeshyar/core/extensions/color_extension.dart';
import 'package:amozeshyar/core/utils/app_size.dart';
import 'package:amozeshyar/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.labelText,
    this.hintText,
    this.prefixText,
    this.prefix,
    this.suffix,
    this.hintTextDirection,
    this.textDirection = TextDirection.rtl,
    this.textAlign = TextAlign.right,
    this.hintTextColor,
    this.hasBorder = false,
    this.maxLines,
    this.validateFunction,
    this.textEditingController,
    this.obscureText,
    this.onChanged,
    this.onSaved,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.keyboardType,
    this.textInputAction,
  });

  final String? labelText;
  final String? hintText;
  final String? prefixText;
  final Widget? prefix;
  final Widget? suffix;
  final TextDirection? hintTextDirection;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final Color? hintTextColor;
  final bool hasBorder;
  final int? maxLines;
  final TextEditingController? textEditingController;
  final Function(String?)? validateFunction;
  final bool? obscureText;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final Function(String)? onFieldSubmitted;
  final Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  String convertToEnglishNumbers(String input) {
    return input
        .replaceAll(RegExp(r'۰'), '0')
        .replaceAll(RegExp(r'۱'), '1')
        .replaceAll(RegExp(r'۲'), '2')
        .replaceAll(RegExp(r'۳'), '3')
        .replaceAll(RegExp(r'۴'), '4')
        .replaceAll(RegExp(r'۵'), '5')
        .replaceAll(RegExp(r'۶'), '6')
        .replaceAll(RegExp(r'۷'), '7')
        .replaceAll(RegExp(r'۸'), '8')
        .replaceAll(RegExp(r'۹'), '9');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: widget.labelText != null,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11.0),
                child: CustomText(
                  data: widget.labelText ?? '',
                  textAlign: TextAlign.right,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: AppSize.eight),
            ],
          ),
        ),
        Directionality(
          textDirection: widget.textDirection!,
          child: TextFormField(
            textInputAction: widget.textInputAction ?? TextInputAction.done,
            keyboardType: widget.keyboardType,
            onChanged: (value) {
              final englishValue = convertToEnglishNumbers(value);

              if (widget.onChanged != null) {
                widget.onChanged!(englishValue);
              }

              if (widget.textEditingController != null) {
                widget.textEditingController!.value = TextEditingValue(text: englishValue);
              }
            },
            onEditingComplete: widget.onEditingComplete,
            onSaved: widget.onSaved,
            onFieldSubmitted: (value) {
              final englishValue = convertToEnglishNumbers(value);
              if (widget.onFieldSubmitted != null) {
                widget.onFieldSubmitted!(englishValue);
              }
            },
            validator: (string) {
              final englishString = string != null ? convertToEnglishNumbers(string) : null;
              return widget.validateFunction != null ? widget.validateFunction!(englishString) : null;
            },
            textDirection: widget.textDirection,
            controller: widget.textEditingController,
            textAlign: widget.textAlign!,
            maxLines: widget.maxLines ?? 1,
            obscureText: widget.obscureText ?? false,
            obscuringCharacter: '*',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).helperTextColor,
                  fontFamily: 'IranSansNumber',
                ),
            decoration: InputDecoration(
              helperMaxLines: 0,
              hintText: widget.hintText,
              hintTextDirection: widget.hintTextDirection,
              hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: widget.hintTextColor ?? Theme.of(context).helperTextColor,
                    fontFamily: 'IranSansNumber',
                  ),
              filled: true,
              fillColor: Theme.of(context).whiteColor,
              prefixIcon: widget.prefix,
              suffixIcon: widget.suffix,
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8.0),
                ),
                borderSide: BorderSide(
                  color: widget.hasBorder ? Theme.of(context).inactiveColor : Colors.transparent,
                  width: widget.hasBorder ? 1.5 : 0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(
                  color: widget.hasBorder ? Theme.of(context).inactiveColor : Colors.transparent,
                  width: widget.hasBorder ? 1.5 : 0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8.0),
                ),
                borderSide: BorderSide(
                  color: widget.hasBorder ? Theme.of(context).inactiveColor : Colors.transparent,
                  width: widget.hasBorder ? 1.5 : 0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
