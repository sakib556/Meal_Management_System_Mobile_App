import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_management/constant/constant_list.dart';
import 'package:meal_management/global/model/cost.dart';
import 'package:meal_management/global/widget/date_time_pickers.dart';
import 'package:meal_management/global/widget/dropdowns/member_list_dropdown.dart';
import 'package:meal_management/global/widget/form_with_button.dart';
import 'package:meal_management/global/widget/global_button.dart';
import 'package:meal_management/global/widget/global_dropdown.dart';
import 'package:meal_management/global/widget/global_space.dart';
import 'package:meal_management/global/widget/text_fields.dart';
import 'package:meal_management/global/widget/titles.dart';
import 'package:meal_management/modules/dashboard/sub_modules/cost_form/controller/cost_form_controller.dart';

// const userId = 2;

final memberList = [NameId("Sakib", 1), NameId("Masud", 2), NameId("Ajad", 3)];

class CostForm extends StatelessWidget {
  const CostForm({Key? key, this.cost}) : super(key: key);
  final Cost? cost;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final controller = ref.read(costFormController.notifier);
        final state = ref.watch(costFormController);
        return GlobalFormWithButton(
            button: cost == null
                ? GlobalButton(
                    text: "Add Cost",
                    loading: state.isButtonLoading,
                    onTap: () {
                      controller.submitForm();
                    })
                : GlobalButton(
                    text: "Update Cost",
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
      final controller = ref.read(costFormController.notifier);
      return Form(
        key: controller.formKey,
        child: Column(
          children: [
            MemberListDropdown(
                selectedId: cost?.memberId,
                onChanged: (selectedId) {
                  controller.memberId = selectedId;
                }),
            const VerticalSpace(),
            BorderedTextField(
                label: "Amount",
                keyboardType: TextInputType.number,
                controller: TextEditingController(
                    text: controller.amount?.toString() ?? ""),
                onChanged: (data) {
                  controller.amount = double.parse(data ?? "");
                }),
            const VerticalSpace(),
            GlobalConstantDropDown(
                title: "Cost Type",
                onChanged: (data) {
                  controller.costType = data;
                },
                items: costTypeList,
                selectedValue: controller.costType),
            const VerticalSpace(),
            BorderedDescriptionField(
                label: "Bazar or Other Details",
                controller: TextEditingController(text: controller.details),
                onChanged: (data) {
                  controller.details = data;
                }),
            const VerticalSpace(),
            const SectionRequiredTitle(
              title: "Date",
              isRequired: true,
            ),
            GlobalDatePicker(
                selectedDate: controller.costDate,
                onTap: (data) {
                  controller.costDate = data;
                },
                hint: "Date",
                validationTitle: "Date"),
          ],
        ),
      );
    });
  }
}
