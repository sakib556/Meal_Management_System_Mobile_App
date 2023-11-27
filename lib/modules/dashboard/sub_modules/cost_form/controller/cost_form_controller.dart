import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_management/constant/app_url.dart';
import 'package:meal_management/data_provider/api_client.dart';
import 'package:meal_management/global/model/cost.dart';
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
        final String url = "${AppUrl.base.url}/cost.php?action=createCost";
        'url is: $url'.log();
        await _apiClient.request(
          url: url,
          method: Method.POST,
          params: cost.toJson(),
          showLoader: true,
          onSuccessFunction: (response) {
            // final ServiceResponse serviceResponse =
            //     ServiceResponse.fromJson(response.data);
            // state = state.copyWith(
            //   serviceList: serviceResponse.data ?? [],
            // );
            print("response is $response");
            Navigation.key.currentState!.pop();
            ViewUtil.globalSnackbar("Cost created !");
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
    state = state.copyWith(isButtonLoading: true);
    // Simulate an asynchronous operation (e.g., API call)
    await Future.delayed(const Duration(seconds: 2));

    // Your logic to create or update the Cost using the API
    print("$memberId $amount $costType $details $costDate");

    // Example navigation
    state = state.copyWith(isButtonLoading: false);
    Navigation.key.currentState!.pop();
  }
}
