import 'package:flutter/material.dart';

void pushNavigateTo(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

void popNavigate(BuildContext context) {
  Navigator.pop(context);
}
