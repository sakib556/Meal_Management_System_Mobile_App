import 'package:flutter/material.dart';
import 'package:meal_management/screens/authentication/landing_screen.dart';

enum AppRoutes {
  landing,
}

extension AppRoutesExtention on AppRoutes {
  Widget buildWidget<T extends Object>({T? arguments}) {
    switch (this) {
      case AppRoutes.landing:
        return const LandingScreen();
    }
  }
}
