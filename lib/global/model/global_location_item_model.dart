import 'dart:ui';

import 'package:flutter/cupertino.dart';

class GlobalLocationItemModel {
  final String address1;
  final String address2;
  final bool isSelected;
  final int index;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final EdgeInsets? margin;

  const GlobalLocationItemModel({
    required this.address1,
    required this.address2,
    this.isSelected = false,
    required this.index,
    required this.onTap,
    required this.onDelete,
    required this.onEdit,
    this.margin,
  });
}
