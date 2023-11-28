import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:meal_management/modules/dashboard/sub_modules/cost_form/views/cost_form.dart';
import 'package:meal_management/modules/dashboard/sub_modules/meal_form/views/meal_form.dart';
import 'package:meal_management/modules/dashboard/sub_modules/member_form/views/member_form.dart';
import 'package:meal_management/utils/bottom_sheet_util.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.add,
      foregroundColor: Colors.grey,
      animatedIcon: AnimatedIcons.menu_close,
      backgroundColor: Colors.white,
      overlayColor: Colors.black,
      overlayOpacity: 0.4,
      animationDuration: const Duration(milliseconds: 250),
      spacing: 10,
      curve: Curves.bounceIn,
      children: [
        SpeedDialChild(
          onTap: () {
            SheetUtil.globalBottomSheet(
                context: context, child: const MealForm());
          },
          backgroundColor: Colors.white,
          labelBackgroundColor: Colors.white,
          child: const Icon(
            Icons.restaurant,
            color: Colors.grey,
          ),
          label: 'Add Meal',
          labelStyle: const TextStyle(color: Colors.grey),
        ),
        SpeedDialChild(
          onTap: () {
            SheetUtil.globalBottomSheet(
                context: context, child: const CostForm());
          },
          backgroundColor: Colors.white,
          labelBackgroundColor: Colors.white,
          child: const Icon(
            Icons.shopping_cart,
            color: Colors.grey,
          ),
          label: 'Add Cost',
          labelStyle: const TextStyle(color: Colors.grey),
        ),
        SpeedDialChild(
          onTap: () {
            SheetUtil.globalBottomSheet(
                context: context, child: const MemberForm());
          },
          backgroundColor: Colors.white,
          labelBackgroundColor: Colors.white,
          child: const Icon(
            Icons.person,
            color: Colors.grey,
          ),
          label: 'Add Member',
          labelStyle: const TextStyle(color: Colors.grey),
        ),
        SpeedDialChild(
          backgroundColor: Colors.white,
          labelBackgroundColor: Colors.white,
          onTap: () {
            //Navigator.pushNamed(context, MemberList.routeName);
          },
          child: const Icon(
            Icons.calendar_month,
            color: Colors.grey,
          ),
          label: 'Other Month Details',
          labelStyle: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
