import 'package:flutter/material.dart';
import 'package:meal_management/constant/constant_list.dart';
import 'package:meal_management/global/model/member.dart';
import 'package:meal_management/global/widget/form_with_button.dart';
import 'package:meal_management/global/widget/global_button.dart';
import 'package:meal_management/global/widget/global_dropdown.dart';
import 'package:meal_management/global/widget/global_space.dart';
import 'package:meal_management/global/widget/text_fields.dart';
import 'package:meal_management/utils/repositories/member.dart';
import 'package:meal_management/utils/view_util.dart';

class MemberForm extends StatefulWidget {
  const MemberForm({super.key, this.member});
  final Member? member;

  @override
  State<MemberForm> createState() => _MemberFormState();
}

class _MemberFormState extends State<MemberForm> {
  final _formKey = GlobalKey<FormState>();
  String? memberName, gender;
  int? userId;
  @override
  Widget build(BuildContext context) {
    return GlobalFormWithButton(
        button: GlobalButton(
            text: "Add member",
            onTap: () {
              userId = 2;
              print("$memberName $gender $userId");
              if (_formKey.currentState!.validate()) {
                print("object 1");
                Member member = Member(
                    memberName: memberName!, gender: gender!, userId: userId!);
                MemberApi.createMember(member);
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
          BorderedTextField(
              label: "Member Name",
              controller: TextEditingController(text: memberName),
              onChanged: (data) {
                memberName = data;
              }),
          const VerticalSpace(),
          GlobalConstantDropDown(
              title: "Gender",
              onChanged: (data) {
                gender = data;
              },
              items: genderList,
              selectedValue: gender),
        ],
      ),
    );
  }
}
