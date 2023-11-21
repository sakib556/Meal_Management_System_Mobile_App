import 'package:flutter/material.dart';
import 'package:meal_management/global/widget/global_text.dart';
import 'package:meal_management/utils/styles/k_colors.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color? textColor;
  final FontWeight fontWeight;

  const SectionTitle({
    Key? key,
    required this.title,
    this.fontSize = 16,
    this.textColor,
    this.fontWeight = FontWeight.w600,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 5),
      child: GlobalText(title,
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: textColor ?? KColor.black.color),
    );
  }
}

class SectionRequiredTitle extends StatelessWidget {
  final String title;
  final bool isRequired;

  const SectionRequiredTitle({
    Key? key,
    required this.title,
    required this.isRequired,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          if (isRequired)
            GlobalText(
              '*',
              color: Colors.red,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          GlobalText(
            title,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: KColor.black.color,
          ),
        ],
      ),
    );
  }
}
