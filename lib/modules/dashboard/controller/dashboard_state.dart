import 'package:flutter/material.dart';
import 'package:meal_management/modules/dashboard/model/dashboard_response.dart';
import 'package:meal_management/modules/dashboard/model/member_response.dart';
import 'package:meal_management/modules/dashboard/model/user_response.dart';

@immutable
class DashboardState {
  final bool isLoading;
  final bool isMembersLoading;
  final bool isMembersError;
  final bool isUserDataLoading;
  final DashboardResponse? dashboardResponse;
  final UserData? userData;
  final List<MemberModel>? members;
  final bool isError;

  const DashboardState({
    required this.isLoading,
    required this.isMembersLoading,
    required this.isMembersError,
    required this.isError,
    required this.isUserDataLoading,
    required this.dashboardResponse,
    required this.userData,
    required this.members,
  });

  DashboardState copyWith(
      {bool? isLoading,
      bool? isMembersLoading,
      bool? isMembersError,
      bool? isError,
      bool? isUserDataLoading,
      DashboardResponse? dashboardResponse,
      UserData? userData,
      List<MemberModel>? members}) {
    return DashboardState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      isMembersLoading: isMembersLoading ?? this.isMembersLoading,
      isMembersError: isMembersError ?? this.isMembersError,
      isUserDataLoading: isUserDataLoading ?? this.isUserDataLoading,
      dashboardResponse: dashboardResponse ?? this.dashboardResponse,
      userData: userData ?? this.userData,
      members: members ?? this.members,
    );
  }
}
