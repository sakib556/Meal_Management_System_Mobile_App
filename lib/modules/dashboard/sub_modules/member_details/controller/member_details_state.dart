import 'package:flutter/material.dart';
import 'package:meal_management/modules/dashboard/sub_modules/member_details/model/member_details_response.dart';

@immutable
class MemberDetailsState {
  final bool isLoading;
  final MemberDetailsResponse? memberDetailsResponse;
  final bool isError;

  const MemberDetailsState({
    required this.isLoading,
    required this.isError,
    required this.memberDetailsResponse,
  });

  MemberDetailsState copyWith(
      {bool? isLoading,
      bool? isError,
      MemberDetailsResponse? memberDetailsResponse}) {
    return MemberDetailsState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      memberDetailsResponse:
          memberDetailsResponse ?? this.memberDetailsResponse,
    );
  }
}
