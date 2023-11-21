import 'package:flutter/material.dart';

class GlobalFormWithButton extends StatelessWidget {
  final ScrollController? controller;
  final Widget child;
  final Widget button;

  const GlobalFormWithButton({
    super.key,
    this.controller,
    required this.child,
    required this.button,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            child,
            const SizedBox(height: 32),
            button,
          ],
        ),
      ),
    );
  }
}
