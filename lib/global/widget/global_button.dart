import 'package:flutter/material.dart';
import 'package:meal_management/global/widget/global_text.dart';
import 'package:meal_management/utils/extension.dart';
import 'package:meal_management/utils/styles/styles.dart';

class GlobalButton extends StatelessWidget {
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final String text;
  final String? subTitle;
  final bool enable;
  final bool loading;
  final VoidCallback onTap;
  final bool? isAdaptive;
  final bool? isTextTranslatable;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final FontWeight fontWeight;
  final double? loaderSize;
  final Widget? suffix;
  final Widget? prefix;

  const GlobalButton({
    Key? key,
    this.margin = const EdgeInsets.symmetric(horizontal: 16),
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    required this.text,
    this.enable = true,
    this.loading = false,
    required this.onTap,
    this.isAdaptive = false,
    this.isTextTranslatable = true,
    this.color,
    this.fontSize = 20,
    this.fontWeight = FontWeight.w500,
    this.loaderSize,
    this.suffix = const SizedBox(),
    this.prefix = const SizedBox(),
    this.subTitle,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return loading == true
        ? const Center(child: CircularProgressIndicator())
        : InkWell(
            onTap: enable == true ? onTap : null,
            child: Container(
              margin: margin,
              width: isAdaptive == true ? null : context.width,
              padding: padding,
              decoration: BoxDecoration(
                color: enable == true
                    ? (color ?? KColor.primary.color)
                    : KColor.grey.color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        prefix ?? const SizedBox(),
                        GlobalText(
                          text,
                          fontSize: fontSize,
                          color: textColor ?? KColor.white.color,
                          fontWeight: fontWeight,
                        ),
                        suffix ?? const SizedBox(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
