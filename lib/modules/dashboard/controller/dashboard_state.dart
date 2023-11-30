import 'package:flutter/material.dart';
import 'package:meal_management/modules/dashboard/model/dashboard_response.dart';
import 'package:meal_management/modules/dashboard/model/user_response.dart';

@immutable
class DashboardState {
  final bool isLoading;
  final bool isUserDataLoading;
  final DashboardResponse? dashboardResponse;
  final UserData? userData;
  final bool isError;

  const DashboardState({
    required this.isLoading,
    required this.isError,
    required this.isUserDataLoading,
    required this.dashboardResponse,
    required this.userData,
  });

  DashboardState copyWith(
      {bool? isLoading,
      bool? isError,
      bool? isUserDataLoading,
      DashboardResponse? dashboardResponse,
      UserData? userData}) {
    return DashboardState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      isUserDataLoading: isUserDataLoading ?? this.isUserDataLoading,
      dashboardResponse: dashboardResponse ?? this.dashboardResponse,
      userData: userData ?? this.userData,
    );
  }
}
