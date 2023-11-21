import 'dart:async';
import 'package:flutter/material.dart';

class FunctionsUtil {
  static void scrollToMaxScrollExtentAfterDelay(
      ScrollController scrollController) {
    Timer(const Duration(milliseconds: 10), () {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }

  static String colorToHex(Color color) {
    String value = color.value
        .toRadixString(16)
        .padLeft(8, '0')
        .substring(2)
        .toUpperCase();
    print("value is $value");
    return "#$value";
  }

  static Color? hexToColor(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");

    if (RegExp(r'^[0-9A-F]{6}$').hasMatch(hexColor)) {
      // Valid six-digit hex color
      return Color(int.parse("FF$hexColor", radix: 16));
    } else if (RegExp(r'^[0-9A-F]{8}$').hasMatch(hexColor)) {
      // Valid eight-digit hex color
      return Color(int.parse(hexColor, radix: 16));
    } else {
      // Invalid hex color format
      return null;
    }
  }
}
