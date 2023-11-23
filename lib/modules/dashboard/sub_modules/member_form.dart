import 'package:flutter/material.dart';
import 'package:meal_management/global/widget/form_with_button.dart';
import 'package:meal_management/global/widget/global_button.dart';
import 'package:meal_management/global/widget/global_dropdown.dart';
import 'package:meal_management/global/widget/global_space.dart';
import 'package:meal_management/global/widget/text_fields.dart';

class MemberForm extends StatelessWidget {
  const MemberForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalFormWithButton(
        button: GlobalButton(text: "Add member", onTap: () {}),
        child: Column(
          children: [
            BorderedTextField(
                label: "Member Name",
                controller: TextEditingController(text: ""),
                onChanged: (data) {}),
            const VerticalSpace(),
            GlobalConstantDropDown(
                title: "Gender",
                onChanged: (data) {},
                items: ["Male", "Female"],
                selectedValue: null)
          ],
        ));
  }
}
