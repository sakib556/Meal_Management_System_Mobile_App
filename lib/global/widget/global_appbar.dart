import 'package:flutter/material.dart';
import 'package:meal_management/global/widget/global_text.dart';
import '../../utils/styles/styles.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = KColor.secondary.color;
  final String title;
  final bool? centerTitle;
  final List<Widget>? actions;

  GlobalAppBar({
    Key? key,
    required this.title,
    this.centerTitle,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      title: GlobalText(
        title,
        color: KColor.white.color,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
