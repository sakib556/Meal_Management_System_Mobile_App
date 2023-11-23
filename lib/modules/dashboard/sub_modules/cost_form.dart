import 'package:flutter/material.dart';
import 'package:meal_management/global/widget/date_time_pickers.dart';
import 'package:meal_management/global/widget/form_with_button.dart';
import 'package:meal_management/global/widget/global_button.dart';
import 'package:meal_management/global/widget/global_dropdown.dart';
import 'package:meal_management/global/widget/global_space.dart';
import 'package:meal_management/global/widget/text_fields.dart';
import 'package:meal_management/global/widget/titles.dart';

class CostForm extends StatelessWidget {
  const CostForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalFormWithButton(
        button: GlobalButton(text: "Add cost", onTap: () {}),
        //     button: widget.data == null
        // ? GlobalButton(
        //     buttonText: "Add Designation",
        //     loadingText: "Designation adding...",
        //     isLoading: state is DesignationHistoryLoading ? true : false,
        //     onPressed: () {
        //       if (_formKey.currentState!.validate()) {
        //         DesignationHistory data = DesignationHistory(
        //           userId: userId,
        //           designationId: designationId,
        //           startDate: startDate,
        //           endDate: endDate,
        //           comment: comment,
        //         );
        //         designationHistoryBloc
        //             .add(AddDesignationHistory(data: data));
        //       } else {
        //         ViewUtil.requiredMessage();
        //       }
        //     })
        // : GlobalButton(
        //     isLoading: state is DesignationHistoryLoading ? true : false,
        //     buttonText: "Save",
        //     loadingText: "Designation updating...",
        //     onPressed: () {
        //       if (_formKey.currentState!.validate()) {
        //         DesignationHistory data = DesignationHistory(
        //           id: id,
        //           userId: userId,
        //           designationId: designationId,
        //           startDate: startDate,
        //           endDate: endDate,
        //           comment: comment,
        //         );
        //         designationHistoryBloc
        //             .add(UpdateDesignationHistory(data: data, id: id!));
        //       } else {
        //         ViewUtil.requiredMessage();
        //       }
        //     }),
        child: Column(
          children: [
            GlobalConstantDropDown(
                title: "Member",
                onChanged: (data) {},
                items: memberList,
                selectedValue: null),
            const VerticalSpace(),
            BorderedTextField(
                label: "Amount",
                keyboardType: TextInputType.number,
                controller: TextEditingController(text: ""),
                onChanged: (data) {}),
            const VerticalSpace(),
            GlobalConstantDropDown(
                title: "Cost Type",
                onChanged: (data) {},
                items: costTypeList,
                selectedValue: null),
            const VerticalSpace(),
            BorderedDescriptionField(
                label: "Bazar or Other Details",
                controller: TextEditingController(text: ""),
                onChanged: (data) {}),
            const VerticalSpace(),
            SectionRequiredTitle(
              title: "Date",
              isRequired: true,
            ),
            GlobalDatePicker(
                selectedDate: DateTime.now(),
                onTap: (data) {},
                hint: "Date",
                validationTitle: "Date"),
          ],
        ));
  }
}

final memberList = [
  "Sakib",
  "Sojib",
  "Rimon",
  "Others",
];
final costTypeList = [
  "Bazar",
  "Current bill",
  "Gas bill",
  "Others",
];
