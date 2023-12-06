import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_management/constant/app_url.dart';
import 'package:meal_management/data_provider/api_client.dart';
import 'package:meal_management/global/model/cost.dart';
import 'package:meal_management/modules/dashboard/controller/dashboard_controller.dart';
import 'package:meal_management/modules/dashboard/sub_modules/cost_form/controller/cost_form_state.dart';
import 'package:meal_management/utils/enum.dart';
import 'package:meal_management/utils/extension.dart';
import 'package:meal_management/utils/navigation.dart';
import 'package:meal_management/utils/view_util.dart';

final costFormController =
    StateNotifierProvider.autoDispose<CostFormController, CostFormState>(
        (ref) => CostFormController());

class CostFormController extends StateNotifier<CostFormState> {
  CostFormController()
      : super(const CostFormState(
          isButtonLoading: false,
        ));
  int? id;
  int? memberId;
  double? amount;
  String? costType;
  String? details;
  DateTime costDate = DateTime.now();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ApiClient _apiClient = ApiClient();

  Future<void> submitForm() async {
    try {
      state = state.copyWith(isButtonLoading: true);
      print("$memberId $amount $costType $details $costDate");
      if (formKey.currentState!.validate()) {
        Cost cost = Cost(
            memberId: memberId!,
            amount: amount!,
            costType: costType!,
            details: details!,
            costDate: costDate);
        const String url = "/cost.php?action=createCost";
        'url is: $url'.log();
        print(cost.toJson());
        await _apiClient.request(
          url: url,
          method: Method.POST,
          params: cost.toJson(),
          onSuccessFunction: (response) {
            print("response is ${response.toString()}");
            Future(() {
              Navigation.key.currentState!.context
                  .read(dashboardController.notifier)
                  .getDashboardData();
              print("response get 2");
            });
            Navigation.key.currentState!.pop();
            ViewUtil.globalSnackbar("Cost created !");
            state = state.copyWith(isButtonLoading: false);
          },
        );
        state = state.copyWith(isButtonLoading: false);
      } else {
        ViewUtil.requiredMessage();
        state = state.copyWith(isButtonLoading: false);
      }
    } on Exception catch (e) {
      print("error is : $e");
      state = state.copyWith(isButtonLoading: false);
    }
  }

  Future<void> updateForm() async {
    try {
      state = state.copyWith(isButtonLoading: true);
      print("$id $memberId $amount $costType $details $costDate");
      if (formKey.currentState!.validate()) {
        Cost cost = Cost(
            id: id!,
            memberId: memberId!,
            amount: amount!,
            costType: costType!,
            details: details!,
            costDate: costDate);
        const String url = "/cost.php?action=updateCost";
        'url is: $url'.log();
        await _apiClient.request(
          url: url,
          method: Method.PUT,
          params: cost.toJson(),
          onSuccessFunction: (response) {
            print("response is $response");
            Future(() {
              Navigation.key.currentState!.context
                  .read(dashboardController.notifier)
                  .getDashboardData();
            });
            Navigation.key.currentState!.pop();
            ViewUtil.globalSnackbar("Cost Updated !");
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
