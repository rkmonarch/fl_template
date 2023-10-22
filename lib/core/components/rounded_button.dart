import 'package:fl_template/core/resources/shared_style.dart';
import 'package:fl_template/core/utils/ui_helpers.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.child,
      this.color,
      this.width,
      this.textStyle,
      this.height,
      this.borderRadius,
      this.borderColor,
      this.gradient});

  final String text;
  final Function onPressed;
  final Widget? child;
  final Color? color;
  final double? width;
  final double? height;
  final Color? borderColor;
  final TextStyle? textStyle;
  final double? borderRadius;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed as void Function()?,
      child: Container(
        height: height ?? 65,
        width: width ?? deviceWidth(context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 50),
            color: Colors.black,
            border: Border.all(color: borderColor ?? Colors.white, width: 2),
            gradient: gradient),
        child: Center(
          child: child ??
              Center(
                child: Text(
                  text,
                  style: textStyle ?? kButtonTextStyle,
                ),
              ),
        ),
      ),
    );
  }
}
