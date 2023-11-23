import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:meal_management/utils/styles/k_colors.dart';

class GlobalIndicator extends StatelessWidget {
  const GlobalIndicator({super.key, this.size = 40, this.color});
  final double size;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFadingCircle(
        color: color ?? KColor.primary.color,
        size: size,
      ),
    );
  }
}
