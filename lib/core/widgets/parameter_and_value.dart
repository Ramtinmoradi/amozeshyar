import 'package:amozeshyar/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ParameterAndValue extends StatelessWidget {
  const ParameterAndValue({
    super.key,
    this.textValue,
    this.parameter,
    this.childValue,
    this.color,
    this.isPrice = true,
  });

  final String? textValue;
  final Widget? childValue;
  final String? parameter;
  final Color? color;
  final bool isPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (textValue != null)
          CustomText(
            data: textValue != null
                ? isPrice
                    ? '$textValue ریال'
                    : textValue ?? ''
                : '',
            isNumber: true,
            color: color,
            textDirection: TextDirection.rtl,
          ),
        if (childValue != null) childValue ?? SizedBox(),
        Spacer(),
        CustomText(
          data: parameter ?? '',
          color: color,
        ),
      ],
    );
  }
}
