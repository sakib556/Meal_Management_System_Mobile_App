import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget iconTextButton({
  required String text,
  required VoidCallback onPressed,
  required Color backgroundColor,
  required Color textColor,
  IconData? iconData,
  Color? iconColor,
  required double borderRadius,
  required double borderWidth,
  required Color borderColor,
}) {
  return Material(
    color: backgroundColor,
    borderRadius: BorderRadius.circular(borderRadius),
    child: InkWell(
      onTap: onPressed,
      radius: borderRadius,
      borderRadius: BorderRadius.circular(borderRadius),
      hoverColor: textColor,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: iconData == null ? 20 : 12,
            vertical: iconData == null ? 4 : 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: textColor,
                    fontSize: 16.0,
                  ),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            iconData != null
                ? Row(
                    children: [
                      const SizedBox(width: 5.0),
                      Icon(
                        iconData,
                        color: iconColor,
                      ),
                    ],
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    ),
  );
}
