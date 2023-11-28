import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_management/constant/app_url.dart';
import 'package:meal_management/data_provider/api_client.dart';
import 'package:meal_management/global/model/member.dart';
import 'package:meal_management/modules/dashboard/controller/dashboard_controller.dart';
import 'package:meal_management/modules/dashboard/sub_modules/member_form/controller/member_form_state.dart';
import 'package:meal_management/utils/enum.dart';
import 'package:meal_management/utils/extension.dart';
import 'package:meal_management/utils/navigation.dart';
import 'package:meal_management/utils/view_util.dart';

final memberFormController =
    StateNotifierProvider.autoDispose<MemberFormController, MemberFormState>(
        (ref) => MemberFormController());

class MemberFormController extends StateNotifier<MemberFormState> {
  MemberFormController()
      : super(const MemberFormState(
          isButtonLoading: false,
        ));
  int? id;
  String? memberName, gender;
  int? userId;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ApiClient _apiClient = ApiClient();

  Future<void> submitForm() async {
    try {
      state = state.copyWith(isButtonLoading: true);
      print("$memberName $gender $userId");
      if (formKey.currentState!.validate()) {
        Member member =
            Member(memberName: memberName!, gender: gender!, userId: userId!);
        final String url = "${AppUrl.base.url}/member.php?action=createMember";
        'url is: $url'.log();
        await _apiClient.request(
          url: url,
          method: Method.POST,
          params: member.toJson(),
          onSuccessFunction: (response) {
            print("response is $response");
            Future(() {
              Navigation.key.currentState!.context
                  .read(dashboardController.notifier)
                  .getDashboardData();
            });
            Navigation.key.currentState!.pop();
            ViewUtil.globalSnackbar("Member created !");
            state = state.copyWith(isButtonLoading: false);
          },
        );
      } else {
        ViewUtil.requiredMessage();
      }
    } on Exception catch (e) {
      state = state.copyWith(isButtonLoading: false);
    }
  }

  Future<void> updateForm() async {
    try {
      state = state.copyWith(isButtonLoading: true);
      print("$id $memberName $gender $userId");
      if (formKey.currentState!.validate()) {
        Member member = Member(
            id: id!, memberName: memberName!, gender: gender!, userId: userId!);
        const String url = "/member.php?action=updateMember";
        'url is: $url'.log();
        await _apiClient.request(
          url: url,
          method: Method.PUT,
          params: member.toJson(),
          onSuccessFunction: (response) {
            print("response is $response");
            Future(() {
              Navigation.key.currentState!.context
                  .read(dashboardController.notifier)
                  .getDashboardData();
            });
            Navigation.key.currentState!.pop();
            ViewUtil.globalSnackbar("Member Updated !");
            state = state.copyWith(isButtonLoading: false);
          },
        );
      } else {
        ViewUtil.requiredMessage();
      }
    } on Exception catch (e) {
      state = state.copyWith(isButtonLoading: false);
    }
  }
}
