import 'package:flutter/material.dart';
import 'package:meal_management/global/widget/global_text.dart';
import 'package:meal_management/utils/styles/k_colors.dart';

class TitleWithIcon extends StatelessWidget {
  final String title;
  final Function onTap;
  final IconData? icon;
  const TitleWithIcon({
    Key? key,
    required this.title,
    required this.onTap,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(10),
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.grey.withOpacity(0.2),
      //       spreadRadius: 1,
      //       blurRadius: 3,
      //       offset: const Offset(0, 2),
      //     ),
      //   ],
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 8,
            child: GlobalText(
              title,
              fontSize: 24.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          GestureDetector(
            onTap: () {
              onTap();
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: KColor.primary.color,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon ?? Icons.edit,
                color: KColor.white.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
