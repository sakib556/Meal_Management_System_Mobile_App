import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_management/global/widget/global_dropdown.dart';
import 'package:meal_management/modules/dashboard/controller/dashboard_controller.dart';
import 'package:meal_management/utils/extension.dart';

class MemberListBuilder extends StatefulWidget {
  const MemberListBuilder({Key? key, required this.childBuilder})
      : super(key: key);
  final Widget Function(List<NameId> currentList, bool isLoading, bool isError,
      void Function() onErrorTap) childBuilder;

  @override
  State<MemberListBuilder> createState() => _MemberListState();
}

class _MemberListState extends State<MemberListBuilder> {
  @override
  void initState() {
    Future(() => context.read(dashboardController.notifier).getAllMembers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, WidgetRef ref, __) {
      final state = ref.watch(dashboardController);
      List<NameId> currentList = [];

      if (state.members != null) {
        final list = state.members;
        currentList.clear();
        for (var i in list!) {
          NameId nameId = NameId(i.memberName, int.tryParse(i.id)!);
          currentList.add(nameId);
        }
      }
      return widget.childBuilder(
          currentList, state.isMembersLoading, state.isMembersError, () {
        context.read(dashboardController.notifier).getAllMembers();
      });
    });

    // return BlocBuilder<MemberListBloc, MemberListState>(
    //  builder: (context, state) {
    //     List<NameId> currentList = [];
    //     bool isLoading = true;
    //     bool isError = false;

    //     if (state is AllMemberListLoaded) {
    //       isLoading = false;
    //       isError = false;
    //       final list = state.list.userList;
    //       currentList.clear();
    //       for (var i in list) {
    //         NameId nameId = NameId(i.username ?? "No name", i.id);
    //         currentList.add(nameId);
    //       }
    //     } else if (state is MemberListError) {
    //       isLoading = false;
    //       isError = true;
    //     }

    //     return widget.childBuilder(currentList, isLoading, isError, () {
    //       userListBloc.add(const GetAllMemberList());
    //     });
    //   },
    // );
  }
}
