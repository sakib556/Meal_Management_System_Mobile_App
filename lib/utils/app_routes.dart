import 'package:flutter/material.dart';
import 'package:meal_management/modules/authentication/landing_screen.dart';
import 'package:meal_management/modules/dashboard/components/dashboard_screen.dart';

enum AppRoutes {
  landing,
  dashboard,
}

extension AppRoutesExtention on AppRoutes {
  Widget buildWidget<T extends Object>({T? arguments}) {
    switch (this) {
      case AppRoutes.landing:
        return const LandingScreen();
      case AppRoutes.dashboard:
        return const DashboardScreen();
    }
  }
}
