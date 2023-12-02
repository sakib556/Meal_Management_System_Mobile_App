import 'package:flutter/material.dart';

enum KColor {
  primary,
  secondary,
  background,
  accent,
  deepPrimary,
  softPrimary,
  red,
  white,
  black,
  softGrey,
  grey,
  grey2,
  deepGrey,
  line,
  deep,
  deep2,
  deep3,
  deep4,
  divider,
  fill,
  transparent,
  enableBorder,
  border,
  fromText,
  statusBar,
  addbtn,
  formtextFill,
  dashBack,
  drawerHeader,
  dropDownfill,
  bookingText,
  homeGradientStart,
  homeGradientEnd,
}

extension KColorExtention on KColor {
  Color get color {
    switch (this) {
      case KColor.primary:
        return Color.fromARGB(255, 18, 22, 214);
      // return const Color(0xff190482);
      //  return const Color(0xff645cbb);
      case KColor.secondary:
        return const Color(0xff645cbb);
      case KColor.accent:
        return const Color(0xff0D9488);
      case KColor.softPrimary:
        return const Color(0xFFC2D9FF);
      case KColor.deepPrimary:
        return Color.fromARGB(255, 8, 0, 49);
      case KColor.background:
        return const Color.fromARGB(255, 251, 250, 250);
      case KColor.red:
        return const Color(0xffE42B2B);
      case KColor.softGrey:
        return const Color(0xff959B9A);
      case KColor.grey:
        return const Color(0xffABB3BB);
      case KColor.grey2:
        return const Color(0xFFC1C1C1);
      case KColor.deepGrey:
        return const Color(0xFF666465);
      case KColor.line:
        return const Color(0xffC3C7E5);
      case KColor.addbtn:
        return const Color(0xFFA8CFFF);
      case KColor.black:
        return Colors.black;
      case KColor.deep:
        return const Color(0xFF1E263C);
      case KColor.deep2:
        return const Color(0xFF2C2328);
      case KColor.deep3:
        return const Color(0xFF666465);
      case KColor.deep4:
        return const Color(0xFF40363C);
      case KColor.divider:
        return const Color(0xffE6E6E6);
      case KColor.enableBorder:
        return const Color(0xffDAD0DA);
      case KColor.border:
        return const Color(0xffEAECF8);
      case KColor.fill:
        return const Color.fromARGB(255, 247, 246, 246);
      case KColor.fromText:
        return const Color(0xff7B7A7A);
      case KColor.white:
        return Colors.white;
      case KColor.statusBar:
        return const Color(0xff3E95FF);
      case KColor.transparent:
        return Colors.transparent;
      case KColor.formtextFill:
        return const Color(0xffFCFCFC);
      case KColor.drawerHeader:
        return const Color(0xFF5EA7FF);
      case KColor.dropDownfill:
        return const Color(0xFFFCFCFC);
      case KColor.dashBack:
        return const Color(0xffF8F8F8);
      case KColor.bookingText:
        return const Color(0xff808080);
      case KColor.homeGradientStart:
        return const Color(0xffFFF7F9);
      case KColor.homeGradientEnd:
        return const Color(0x00FDF2F5);
      default:
        return Colors.blue;
    }
  }
}
