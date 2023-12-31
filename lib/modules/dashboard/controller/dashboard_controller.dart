import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_management/data_provider/api_client.dart';
import 'package:meal_management/modules/dashboard/controller/dashboard_state.dart';
import 'package:meal_management/modules/dashboard/model/dashboard_response.dart';
import 'package:meal_management/modules/dashboard/model/member_response.dart';
import 'package:meal_management/modules/dashboard/model/user_response.dart';
import 'package:meal_management/modules/dashboard/sub_modules/cost_form/views/cost_form.dart';
import 'package:meal_management/utils/date_time_util.dart';
import 'package:meal_management/utils/enum.dart';
import 'package:meal_management/utils/extension.dart';
import 'package:meal_management/utils/view_util.dart';

final dashboardController =
    StateNotifierProvider.autoDispose<DashboardController, DashboardState>(
        (ref) => DashboardController());

class DashboardController extends StateNotifier<DashboardState> {
  DashboardController()
      : super(const DashboardState(
            isLoading: true,
            isUserDataLoading: true,
            isMembersLoading: true,
            dashboardResponse: null,
            userData: null,
            isError: false,
            isMembersError: false,
            members: null));

  DateTime startDate = DateTimeUtil.getDefaultRange().startTime;
  DateTime endDate = DateTimeUtil.getDefaultRange().endTime;

  final ApiClient _apiClient = ApiClient();

  Future<void> getDashboardData() async {
    final String? userId = state.userData?.id;
    state = state.copyWith(isLoading: true);
    if (userId == null) {
      ViewUtil.globalSnackbar("Your userId not found.");
      state = state.copyWith(isError: true, isLoading: false);
      return;
    }
    final String url =
        "/dashboard.php?action=getDashboardInfo&startDate=$startDate&endDate=$endDate&userId=$userId";
    'url is: $url'.log();

    print("data is start");
    await _apiClient
        .request(
      url: url,
      method: Method.GET,
      onSuccessFunction: (response) {
        print("data is ${response.data.toString()}");
        final Map<String, dynamic> dataMap = json.decode(response.data);
        if (kDebugMode) {
          print("data is 2222 $dataMap");
        }

        final DashboardResponse dashboardResponse =
            DashboardResponse.fromMap(dataMap);
        state = state.copyWith(dashboardResponse: dashboardResponse);
        print("data is 3${response.data}");
      },
    )
        .catchError((e) {
      print("data error is 44$e");
      'Error is: $e'.log();
      EasyLoading.showError("Something went wrong !");
      state = state.copyWith(isError: true);
    });
    state = state.copyWith(isLoading: false);
  }

  void reload() {
    getDashboardData();
  }

  Future<void> getAllMembers() async {
    final String? userId = state.userData?.id;
    state = state.copyWith(isMembersLoading: true);
    if (userId == null) {
      ViewUtil.globalSnackbar("Your userId not found.");
      state = state.copyWith(isMembersLoading: false);
      return;
    }
    final String url =
        "/member.php?action=getAllMembersByUserId&userId=$userId";
    'url is: $url'.log();

    print("data is start");
    await _apiClient
        .request(
      url: url,
      method: Method.GET,
      onSuccessFunction: (response) {
        print("data is ${response.data}");
        final Map<String, dynamic> dataMap = json.decode(response.data);
        if (kDebugMode) {
          print("data is 2222 $dataMap");
        }
        final MemberResponse memberResponse = MemberResponse.fromJson(dataMap);
        state = state.copyWith(
            members: memberResponse.data.members, isMembersLoading: false);
        print("data is 3${response.data}");
      },
    )
        .catchError((e) {
      print("data error is 44$e");
      'Error is: $e'.log();
      state = state.copyWith(isMembersLoading: false, isError: true);
    });
  }

  Future<void> getUserData() async {
    state = state.copyWith(isUserDataLoading: true, isError: false);
    final String url =
        "/user.php?action=getUserByEmail&email=${FirebaseAuth.instance.currentUser?.email ?? ""}";
    'url is: $url'.log();

    print("data is start");
    await _apiClient
        .request(
      url: url,
      method: Method.GET,
      onSuccessFunction: (response) {
        print("data is ${response.data}");
        final Map<String, dynamic> dataMap = json.decode(response.data);
        if (kDebugMode) {
          print("dataMap is $dataMap");
        }
        final UserData userData = UserResponse.fromMap(dataMap).data!;
        state = state.copyWith(userData: userData);
        Future(() {
          getDashboardData();
        });
        print("data is ${response.data}");
      },
    )
        .catchError((e) {
      print("data error is $e");
      'Error is: $e'.log();
      state = state.copyWith(isError: true);
    });
    state = state.copyWith(isUserDataLoading: false);
  }
}
