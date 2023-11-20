import 'package:flutter/material.dart';
import 'package:meal_management/global/widget/global_text.dart';

class GlobalNoDataFound extends StatelessWidget {
  const GlobalNoDataFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: GlobalText(
        "No Data Found",
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
