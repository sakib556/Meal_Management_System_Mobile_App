import 'package:flutter/material.dart';

class DashboardWidgetModel {
  final String iconPath;
  final String title;
  final Widget child;

  const DashboardWidgetModel({
    required this.iconPath,
    required this.title,
    required this.child,
  });
}
