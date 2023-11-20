import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meal_management/global/widget/global_text.dart';
import 'package:meal_management/utils/styles/styles.dart';

class GlobalDateSelectionWidget extends StatelessWidget {
  final DateTime date;
  final bool isSelected;
  final Function(DateTime getDate) onSelect;

  const GlobalDateSelectionWidget({
    Key? key,
    required this.date,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelect(date);
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        height: 72,
        width: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: KColor.dashBack.color,
            border: Border.all(
                color:
                    isSelected ? KColor.primary.color : KColor.dashBack.color)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlobalText(
              DateFormat('EEE').format(date),
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(
              height: 4,
            ),
            GlobalText(
              "${date.day}",
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }
}
