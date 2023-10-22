import 'package:fl_template/core/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget(
      {super.key,
      required this.controller,
      required this.hinttext,
      required this.maxlines,
      required this.inputType,
      this.onChange,
      this.lableText,
      this.prefix,
      this.textStyle,
      this.height,
      this.readonly,
      this.suffix,
      this.onEditingComplete,
      this.isPassword,
      this.validator,
      this.textCapitalization = TextCapitalization.none,
      this.inputFormatters,
      this.onTap,
      this.scrollPadding,
      this.hasError = false,
      this.maxLength,
      this.borderRadius,
      this.fill,
      this.fillColor,
      this.errortext,
      this.hintStyle,
      this.borderColor,
      this.textAlign,
      this.focusNode,
      required this.width});
  final String? hinttext;
  final double width;
  final Widget? prefix;
  final String? lableText;
  final bool hasError;
  final int maxlines;
  final TextCapitalization textCapitalization;
  final TextEditingController controller;
  final TextInputType inputType;
  final void Function(String)? onChange;
  final bool? fill;
  final Color? fillColor;
  final double? height;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final bool? readonly;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isPassword;
  final EdgeInsets? scrollPadding;
  final String? errortext;
  final double? borderRadius;
  final Color? borderColor;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        scrollPadding: scrollPadding ?? const EdgeInsets.all(0),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textCapitalization: textCapitalization,
        onChanged: onChange,
        maxLines: maxlines,
        maxLength: maxLength,
        keyboardType: inputType,
        controller: controller,
        obscureText: isPassword ?? false,
        textAlign: textAlign ?? TextAlign.start,
        inputFormatters: inputFormatters ?? [],
        readOnly: readonly ?? false,
        onTap: onTap,
        focusNode: focusNode,
        onEditingComplete: onEditingComplete,
        validator: validator ?? (input) => input!.isNotEmpty ? null : "",
        style: textStyle ?? const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: fill ?? false,
          fillColor: fillColor ?? Colors.transparent,
          errorText: hasError ? "$errortext" : null,
          prefixIcon: prefix,
          suffix: suffix,
          labelText: lableText,
          hintStyle: hintStyle ?? const TextStyle(color: Colors.white),
          border: hasError
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 8),
                  borderSide: BorderSide(
                      width: deviceHeight(context) * 0.002, color: Colors.red),
                )
              : null,
          hintText: hinttext,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
            borderSide: BorderSide(
                width: deviceHeight(context) * 0.002,
                color: borderColor ?? const Color(0xffA5A5A5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
            borderSide: BorderSide(
                width: deviceHeight(context) * 0.002,
                color: borderColor ?? const Color(0xffA5A5A5)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
            borderSide: BorderSide(
                width: deviceHeight(context) * 0.002, color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
            borderSide: BorderSide(
                width: deviceHeight(context) * 0.002, color: Colors.red),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          labelStyle: const TextStyle(color: Color(0xff8994A3)),
        ),
      ),
    );
  }
}
