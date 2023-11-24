import 'package:flutter/material.dart';
import 'package:meal_management/constant/constant_list.dart';
import 'package:meal_management/global/model/cost.dart';
import 'package:meal_management/global/widget/date_time_pickers.dart';
import 'package:meal_management/global/widget/form_with_button.dart';
import 'package:meal_management/global/widget/global_button.dart';
import 'package:meal_management/global/widget/global_dropdown.dart';
import 'package:meal_management/global/widget/global_space.dart';
import 'package:meal_management/global/widget/text_fields.dart';
import 'package:meal_management/global/widget/titles.dart';
import 'package:meal_management/utils/repositories/cost_service.dart';
import 'package:meal_management/utils/view_util.dart';

class CostForm extends StatefulWidget {
  const CostForm({super.key, this.member});
  final Cost? member;

  @override
  State<CostForm> createState() => _CostFormState();
}

class _CostFormState extends State<CostForm> {
  final _formKey = GlobalKey<FormState>();
  int? memberId;
  double? amount;
  String? costType;
  String? details;
  DateTime costDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return GlobalFormWithButton(
        button: GlobalButton(
            text: "Add member",
            onTap: () {
              print("$memberId $amount $costType $details $costDate");
              if (_formKey.currentState!.validate()) {
                // print("object 1");
                Cost cost = Cost(
                    memberId: memberId!,
                    amount: amount!,
                    costType: costType!,
                    details: details!,
                    costDate: costDate);

                // Member member = Member(
                //     memberName: memberName!, gender: gender!, userId: userId!);
                CostApi.createCost(cost);
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
              label: "Amount",
              keyboardType: TextInputType.number,
              controller: TextEditingController(text: amount?.toString() ?? ""),
              onChanged: (data) {
                amount = double.parse(data ?? "");
              }),
          const VerticalSpace(),
          GlobalConstantDropDown(
              title: "Cost Type",
              onChanged: (data) {
                costType = data;
              },
              items: costTypeList,
              selectedValue: costType),
          const VerticalSpace(),
          BorderedDescriptionField(
              label: "Bazar or Other Details",
              controller: TextEditingController(text: details),
              onChanged: (data) {
                details = data;
              }),
          const VerticalSpace(),
          const SectionRequiredTitle(
            title: "Date",
            isRequired: true,
          ),
          GlobalDatePicker(
              selectedDate: costDate,
              onTap: (data) {
                costDate = data;
              },
              hint: "Date",
              validationTitle: "Date"),
        ],
      ),
    );
  }
}

final memberList = [NameId("Sakib", 1), NameId("Masud", 2), NameId("Ajad", 3)];
