import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_management/constant/constant_list.dart';
import 'package:meal_management/global/model/member.dart';
import 'package:meal_management/global/widget/date_time_pickers.dart';
import 'package:meal_management/global/widget/form_with_button.dart';
import 'package:meal_management/global/widget/global_button.dart';
import 'package:meal_management/global/widget/global_dropdown.dart';
import 'package:meal_management/global/widget/global_space.dart';
import 'package:meal_management/global/widget/text_fields.dart';
import 'package:meal_management/global/widget/titles.dart';
import 'package:meal_management/modules/dashboard/sub_modules/member_form/controller/member_form_controller.dart';

const userId = 2;

final memberList = [NameId("Sakib", 1), NameId("Masud", 2), NameId("Ajad", 3)];

class MemberForm extends StatelessWidget {
  const MemberForm({Key? key, this.member}) : super(key: key);
  final Member? member;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final controller = ref.read(memberFormController.notifier);
        final state = ref.watch(memberFormController);
        return GlobalFormWithButton(
            button: member == null
                ? GlobalButton(
                    text: "Add Member",
                    loading: state.isButtonLoading,
                    onTap: () {
                      controller.submitForm();
                    })
                : GlobalButton(
                    text: "Update Member",
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
      final controller = ref.read(memberFormController.notifier);
      return Form(
        key: controller.formKey,
        child: Column(
          children: [
            BorderedTextField(
                label: "Member Name",
                controller: TextEditingController(text: controller.memberName),
                onChanged: (data) {
                  controller.memberName = data;
                }),
            const VerticalSpace(),
            GlobalConstantDropDown(
                title: "Gender",
                onChanged: (data) {
                  controller.gender = data;
                },
                items: genderList,
                selectedValue: controller.gender),
          ],
        ),
      );
    });
  }
}
