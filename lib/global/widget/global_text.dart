import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalText extends StatelessWidget {
  final String str;
  final FontWeight fontWeight;
  final double? fontSize;
  final Color? color;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final TextDecoration? decoration;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final bool? softwrap;
  final double? height;
  final String? fontFamily;

  const GlobalText(
    this.str, {
    Key? key,
    this.fontWeight = FontWeight.w400,
    this.fontSize,
    this.fontStyle,
    this.color,
    this.letterSpacing,
    this.decoration,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.softwrap,
    this.height,
    this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      str,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      softWrap: softwrap,
      // style: TextStyle(
      //   color: color ?? Colors.black,
      //   fontSize: fontSize?.sp,
      //   fontWeight: fontWeight,
      //   letterSpacing: letterSpacing,
      //   decoration: decoration,
      //   height: height,
      //   fontStyle: fontStyle,
      //   fontFamily: fontFamily ?? AppConstant.FONTFAMILY.key,
      // ),
      style: GoogleFonts.roboto(
        color: color ?? Colors.black,
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        decoration: decoration,
        height: height,
        fontStyle: fontStyle,
      ),
    );
  }
}
