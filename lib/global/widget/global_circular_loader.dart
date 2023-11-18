import 'package:flutter/material.dart';

class GlobalCircularLoader extends StatelessWidget {
  const GlobalCircularLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
