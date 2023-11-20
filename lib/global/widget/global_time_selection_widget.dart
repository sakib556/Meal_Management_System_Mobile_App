import 'package:flutter/material.dart';
import 'package:meal_management/global/widget/global_text.dart';
import 'package:meal_management/utils/styles/styles.dart';

class GlobalTimeSelectionWidget extends StatelessWidget {
  final bool isEnabled;
  final int index;
  final bool isSelected;
  final Function(int index) onSelect;

  const GlobalTimeSelectionWidget({
    Key? key,
    required this.isEnabled,
    required this.isSelected,
    required this.index,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnabled
          ? () {
              onSelect(index);
            }
          : null,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: KColor.dashBack.color,
            border: Border.all(
                color:
                    isSelected ? KColor.primary.color : KColor.dashBack.color)),
        child: Center(
          child: GlobalText(
            "12.00 AM",
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: isEnabled ? null : KColor.grey.color,
          ),
        ),
      ),
    );
  }
}
