import 'package:flutter/material.dart';
import 'package:meal_management/modules/authentication/landing_screen.dart';
import 'package:meal_management/modules/dashboard/dashboard_screen.dart';
import 'package:meal_management/modules/dashboard/sub_modules/member_details/model/member_details_response.dart';
import 'package:meal_management/modules/dashboard/sub_modules/member_details/views/member_details_screen.dart';

enum AppRoutes {
  landing,
  dashboard,
  memberDetails,
}

extension AppRoutesExtention on AppRoutes {
  Widget buildWidget<T extends Object>({T? arguments}) {
    switch (this) {
      case AppRoutes.landing:
        return const LandingScreen();
      case AppRoutes.dashboard:
        return const DashboardScreen();
      case AppRoutes.memberDetails:
        return MemberDetailsScreen(
          memberParameter: arguments as MemberParameter,
        );
    }
  }
}
