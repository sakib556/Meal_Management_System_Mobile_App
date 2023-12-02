import 'package:flutter/material.dart';
import 'package:meal_management/global/builders/member_list_builder.dart';
import 'package:meal_management/global/widget/global_dropdown.dart';

class MemberListDropdown extends StatelessWidget {
  final int? selectedId;
  final Function(int) onChanged;

  const MemberListDropdown({
    Key? key,
    this.selectedId,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MemberListBuilder(
      childBuilder: (list, isLoading, isError, onErrorTap) {
        return GlobalDropDown(
          title: "Member",
          onChanged: (id) {
            onChanged(id);
          },
          items: list,
          selectedId: selectedId,
          isLoading: isLoading,
          isError: isError,
          onErrorTap: () {
            onErrorTap();
          },
        );
      },
    );
  }
}
