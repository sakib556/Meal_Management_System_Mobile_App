import 'package:flutter/material.dart';
import 'package:meal_management/global/model/meal.dart';
import 'package:meal_management/global/widget/date_time_pickers.dart';
import 'package:meal_management/global/widget/form_with_button.dart';
import 'package:meal_management/global/widget/global_button.dart';
import 'package:meal_management/global/widget/global_dropdown.dart';
import 'package:meal_management/global/widget/global_space.dart';
import 'package:meal_management/global/widget/text_fields.dart';
import 'package:meal_management/global/widget/titles.dart';
import 'package:meal_management/modules/dashboard/sub_modules/cost_form.dart';
import 'package:meal_management/utils/repositories/meal_service.dart';
import 'package:meal_management/utils/view_util.dart';

class MealForm extends StatefulWidget {
  const MealForm({super.key, this.meal});
  final Meal? meal;

  @override
  State<MealForm> createState() => _MealFormState();
}

class _MealFormState extends State<MealForm> {
  final _formKey = GlobalKey<FormState>();
  int? id;
  int? memberId;
  int? mealCount;
  DateTime mealDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return GlobalFormWithButton(
        button: GlobalButton(
            text: "Add meal",
            onTap: () {
              print("$memberId $mealCount $mealDate");
              if (_formKey.currentState!.validate()) {
                Meal meal = Meal(
                    memberId: memberId!,
                    mealCount: mealCount!,
                    mealDate: mealDate);

                MealApi.createMeal(meal);
              } else {
                ViewUtil.requiredMessage();
              }
            }),
        child: _form());
  }

  Widget _form() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          GlobalDropDown(
            title: "Member",
            onChanged: (data) {
              memberId = data;
            },
            items: memberList,
            selectedId: memberId,
          ),
          const VerticalSpace(),
          BorderedTextField(
              label: "Total Meal",
              keyboardType: TextInputType.number,
              controller:
                  TextEditingController(text: mealCount?.toString() ?? ""),
              onChanged: (data) {
                mealCount = int.parse(data ?? "");
              }),
          const VerticalSpace(),
          const SectionRequiredTitle(
            title: "Date",
            isRequired: true,
          ),
          GlobalDatePicker(
              selectedDate: mealDate,
              onTap: (data) {
                mealDate = data;
              },
              hint: "Date",
              validationTitle: "Date"),
        ],
      ),
    );
  }
}
