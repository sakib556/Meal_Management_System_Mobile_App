import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
  final double? height;

  const VerticalSpace({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 16,
    );
  }
}

class HorizontalSpace extends StatelessWidget {
  final double? width;

  const HorizontalSpace({super.key, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 12,
    );
  }
}
