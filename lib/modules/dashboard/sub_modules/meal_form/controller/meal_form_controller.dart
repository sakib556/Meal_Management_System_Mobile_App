import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_management/constant/app_url.dart';
import 'package:meal_management/data_provider/api_client.dart';
import 'package:meal_management/global/model/meal.dart';
import 'package:meal_management/modules/dashboard/controller/dashboard_controller.dart';
import 'package:meal_management/modules/dashboard/sub_modules/meal_form/controller/meal_form_state.dart';
import 'package:meal_management/utils/enum.dart';
import 'package:meal_management/utils/extension.dart';
import 'package:meal_management/utils/navigation.dart';
import 'package:meal_management/utils/view_util.dart';

final mealFormController =
    StateNotifierProvider.autoDispose<MealFormController, MealFormState>(
        (ref) => MealFormController());

class MealFormController extends StateNotifier<MealFormState> {
  MealFormController()
      : super(const MealFormState(
          isButtonLoading: false,
        ));
  int? id;
  int? memberId;
  int? mealCount;
  DateTime mealDate = DateTime.now();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ApiClient _apiClient = ApiClient();

  Future<void> submitForm() async {
    try {
      state = state.copyWith(isButtonLoading: true);
      print("$memberId $mealCount $mealDate");
      if (formKey.currentState!.validate()) {
        Meal meal = Meal(
            memberId: memberId!, mealCount: mealCount!, mealDate: mealDate);
        const String url = "/meal.php?action=createMeal";
        'url is: $url'.log();
        await _apiClient.request(
          url: url,
          method: Method.POST,
          params: meal.toJson(),
          onSuccessFunction: (response) {
            print("response is $response");
            Future(() {
              Navigation.key.currentState!.context
                  .read(dashboardController.notifier)
                  .getDashboardData();
            });
            Navigation.key.currentState!.pop();
            ViewUtil.globalSnackbar("Meal created !");
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
      print("$id $memberId $mealCount $mealDate");
      if (formKey.currentState!.validate()) {
        Meal meal = Meal(
            id: id!,
            memberId: memberId!,
            mealCount: mealCount!,
            mealDate: mealDate);
        const String url = "/meal.php?action=updateMeal";
        'url is: $url'.log();
        await _apiClient.request(
          url: url,
          method: Method.PUT,
          params: meal.toJson(),
          onSuccessFunction: (response) {
            print("response is $response");
            Future(() {
              Navigation.key.currentState!.context
                  .read(dashboardController.notifier)
                  .getDashboardData();
            });
            Navigation.key.currentState!.pop();
            ViewUtil.globalSnackbar("Meal Updated !");
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
