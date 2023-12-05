import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_management/data_provider/api_client.dart';
import 'package:meal_management/modules/dashboard/sub_modules/member_details/controller/member_details_state.dart';
import 'package:meal_management/modules/dashboard/sub_modules/member_details/model/member_details_response.dart';
import 'package:meal_management/utils/enum.dart';
import 'package:meal_management/utils/extension.dart';
import 'package:meal_management/utils/view_util.dart';

final memberDetailsController = StateNotifierProvider.autoDispose<
    MemberDetailsController,
    MemberDetailsState>((ref) => MemberDetailsController());

class MemberDetailsController extends StateNotifier<MemberDetailsState> {
  MemberDetailsController()
      : super(const MemberDetailsState(
            isLoading: true, memberDetailsResponse: null, isError: false));

  final ApiClient _apiClient = ApiClient();

  Future<void> getMemberDetailsData({
    required int memberId,
    required String startDate,
    required String endDate,
  }) async {
    state = state.copyWith(isLoading: true);

    final String url =
        "/member.php?action=getMealAndCostByMemberIdAndDateRange&memberId=$memberId&startDate=$startDate&endDate=$endDate";
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
        if (kDebugMode) {
          print("data is 2 $dataMap");
        }
        final MemberDetailsResponse memberDetailsResponse =
            MemberDetailsResponse.fromJson(dataMap);
        state = state.copyWith(memberDetailsResponse: memberDetailsResponse);
        print("data is 3${response.data}");
      },
    )
        .catchError((e) {
      print("data error is 44$e");
      'Error is: $e'.log();
      state = state.copyWith(isError: true);
    });
    state = state.copyWith(isLoading: false);
  }
}
