import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_management/constant/app_url.dart';
import 'package:meal_management/data_provider/api_client.dart';
import 'package:meal_management/modules/dashboard/controller/dashboard_state.dart';
import 'package:meal_management/modules/dashboard/model/dashboard_response.dart';
import 'package:meal_management/modules/dashboard/sub_modules/cost_form/views/cost_form.dart';
import 'package:meal_management/utils/enum.dart';
import 'package:meal_management/utils/extension.dart';

final dashboardController =
    StateNotifierProvider.autoDispose<DashboardController, DashboardState>(
        (ref) => DashboardController());

class DashboardController extends StateNotifier<DashboardState> {
  DashboardController()
      : super(const DashboardState(
          isLoading: false,
          dashboardResponse: null,
        ));

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  final ApiClient _apiClient = ApiClient();

  Future<void> getDashboardData() async {
    state = state.copyWith(isLoading: true);
    final String url =
        "${AppUrl.base.url}/dashboard.php?action=getDashboardInfo&startDate=$startDate&endDate=$endDate&userId=$userId";
    'url is: $url'.log();

    await _apiClient
        .request(
      url: url,
      method: Method.GET,
      onSuccessFunction: (response) {
        final DashboardResponse dashboardResponse =
            DashboardResponse.fromMap(response.data);
        state = state.copyWith(dashboardResponse: dashboardResponse);
      },
    )
        .catchError((e) {
      'Error is: $e'.log();
    });
    state = state.copyWith(isLoading: false);
  }
}
