import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_management/utils/styles/styles.dart';

class GlobalTextFormField extends StatelessWidget {
  final bool? obscureText;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxlength;
  final AutovalidateMode? autovalidateMode;
  final bool? readOnly;
  final Color? fillColor;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final bool? mandatoryLabel;
  final TextStyle? style;
  final int? line;
  final String? initialValue;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;

  const GlobalTextFormField({
    Key? key,
    this.obscureText,
    this.textInputType,
    this.controller,
    this.validator,
    this.fillColor,
    this.suffixIcon,
    this.prefixIcon,
    this.maxlength,
    this.initialValue,
    this.autovalidateMode,
    this.readOnly,
    this.hintText,
    this.labelText,
    this.hintStyle,
    this.mandatoryLabel,
    this.labelStyle,
    this.line = 1,
    this.style,
    this.onChanged,
    this.textInputAction = TextInputAction.done,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: TextFormField(
        initialValue: initialValue,
        maxLines: line,
        style: style ??
            GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: KColor.black.color,
            ),
        autovalidateMode: autovalidateMode,
        obscureText: obscureText ?? false,
        obscuringCharacter: '*',
        controller: controller,
        textInputAction: textInputAction,
        cursorColor: KColor.black.color,
        keyboardType: textInputType ?? TextInputType.text,
        onChanged: onChanged,
        maxLength: maxlength,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        decoration: InputDecoration(
          filled: true,
          fillColor: KColor.dashBack.color,
          border: InputBorder.none,
          hintText: hintText ?? "",
          hintStyle: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: KColor.grey.color,
          ),
        ),
        validator: validator,
        readOnly: readOnly ?? false,
      ),
    );
  }
}
