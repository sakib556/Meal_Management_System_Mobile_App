import 'package:flutter/material.dart';
import 'package:meal_management/utils/styles/k_colors.dart';

Widget roundHoverIconButton(
    {required IconData icon, required void Function() onTap}) {
  return Material(
    borderRadius: BorderRadius.circular(20),
    child: InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => onTap(),
      child: Icon(
        icon,
        color: KColor.primary.color,
        size: 30,
      ),
    ),
  );
}
