import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_base_code/app/config/config.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool isPassword;
  final Widget? suffixIcons;
  final Function()? suffixOnTap;
  final Widget? prefixIcons;
  final Function()? prefixOnTap;
  final Color backgroundColor;
  final Color activeColor;
  final int maxLines;
  final TextInputType textInputType;
  final Function(String)? onChanged;
  final List<TextInputFormatter> inputFormatters;
  final bool enable;
  final String? Function(String?)? validator;
  final bool autoFocus;
  final TextAlign textAlign;
  final double? fontSize;

  final Function()? onTap;
  final bool readOnly;
  const CustomTextField({
    super.key,
    required this.controller,
    this.hint = '',
    this.isPassword = false,
    this.suffixIcons,
    this.suffixOnTap,
    this.prefixIcons,
    this.prefixOnTap,
    this.backgroundColor = Colors.white,
    this.activeColor = const Color(0xffD7DEDB),
    this.maxLines = 1,
    this.onChanged,
    this.textInputType = TextInputType.text,
    this.inputFormatters = const [],
    this.enable = true,
    this.validator,
    this.onTap,
    this.readOnly = false,
    this.autoFocus = false,
    this.textAlign = TextAlign.start,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autoFocus,
      textAlign: textAlign,
      style: AppFont.exoBlack1.copyWith(fontSize: fontSize),
      controller: controller,
      readOnly: readOnly,
      enabled: enable,
      onTap: onTap,
      keyboardType: textInputType,
      obscureText: isPassword,
      maxLines: maxLines,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: AppColor.grey2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: activeColor),
        ),
        fillColor: backgroundColor,
        isDense: true,
        filled: true,
        hintText: hint,
        hintStyle: AppFont.interGrey3.copyWith(fontSize: fontSize),
        suffixIcon: suffixIcons == null
            ? null
            : GestureDetector(onTap: suffixOnTap, child: suffixIcons),
        prefixIconColor: AppColor.grey3,
        prefixIcon: prefixIcons == null
            ? null
            : GestureDetector(onTap: prefixOnTap, child: prefixIcons),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(color: AppColor.red1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(color: AppColor.red1),
        ),
      ),
    );
  }
}
