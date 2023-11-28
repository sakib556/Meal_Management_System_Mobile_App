import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_management/constant/constant_list.dart';
import 'package:meal_management/global/model/meal.dart';
import 'package:meal_management/global/widget/date_time_pickers.dart';
import 'package:meal_management/global/widget/form_with_button.dart';
import 'package:meal_management/global/widget/global_button.dart';
import 'package:meal_management/global/widget/global_dropdown.dart';
import 'package:meal_management/global/widget/global_space.dart';
import 'package:meal_management/global/widget/text_fields.dart';
import 'package:meal_management/global/widget/titles.dart';
import 'package:meal_management/modules/dashboard/sub_modules/meal_form/controller/meal_form_controller.dart';

const userId = 2;

final memberList = [NameId("Sakib", 1), NameId("Masud", 2), NameId("Ajad", 3)];

class MealForm extends StatelessWidget {
  const MealForm({Key? key, this.meal}) : super(key: key);
  final Meal? meal;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final controller = ref.read(mealFormController.notifier);
        final state = ref.watch(mealFormController);
        return GlobalFormWithButton(
            button: meal == null
                ? GlobalButton(
                    text: "Add Meal",
                    loading: state.isButtonLoading,
                    onTap: () {
                      controller.submitForm();
                    })
                : GlobalButton(
                    text: "Update Meal",
                    loading: state.isButtonLoading,
                    onTap: () {
                      controller.updateForm();
                    }),
            child: _form(context));
      },
    );
  }

  Widget _form(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final controller = ref.read(mealFormController.notifier);
      return Form(
        key: controller.formKey,
        child: Column(
          children: [
            GlobalDropDown(
              title: "Member",
              onChanged: (data) {
                controller.memberId = data;
              },
              items: memberList,
              selectedId: controller.memberId,
            ),
            const VerticalSpace(),
            BorderedTextField(
                label: "Total Meal",
                keyboardType: TextInputType.number,
                controller: TextEditingController(
                    text: controller.mealCount?.toString() ?? ""),
                onChanged: (data) {
                  controller.mealCount = int.parse(data ?? "");
                }),
            const VerticalSpace(),
            const SectionRequiredTitle(
              title: "Date",
              isRequired: true,
            ),
            GlobalDatePicker(
                selectedDate: controller.mealDate,
                onTap: (data) {
                  controller.mealDate = data;
                },
                hint: "Date",
                validationTitle: "Date"),
          ],
        ),
      );
    });
  }
}
