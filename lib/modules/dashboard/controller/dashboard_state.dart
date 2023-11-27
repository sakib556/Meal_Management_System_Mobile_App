import 'package:flutter/material.dart';
import 'package:meal_management/modules/dashboard/model/dashboard_response.dart';

@immutable
class DashboardState {
  final bool isLoading;
  final DashboardResponse? dashboardResponse;

  const DashboardState({
    required this.isLoading,
    required this.dashboardResponse,
  });

  DashboardState copyWith(
      {bool? isLoading, DashboardResponse? dashboardResponse}) {
    return DashboardState(
      isLoading: isLoading ?? this.isLoading,
      dashboardResponse: dashboardResponse ?? this.dashboardResponse,
    );
  }
}
