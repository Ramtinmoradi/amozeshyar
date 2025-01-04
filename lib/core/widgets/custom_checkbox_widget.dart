import 'package:amozeshyar/core/utils/app_size.dart';
import 'package:amozeshyar/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
    required this.title,
    required this.onTap,
    this.value = false,
  });

  final String title;
  final VoidCallback onTap;
  final bool value;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
            width: AppSize.twentyFour,
            height: AppSize.twentyFour,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 1.0,
              ),
            ),
            child: Container(
              margin: EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                color: widget.value ? Theme.of(context).secondaryColor : Colors.transparent,
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: AppSize.twelve),
        CustomText(
          data: widget.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}

extension on ThemeData {
  get secondaryColor => null;
}
