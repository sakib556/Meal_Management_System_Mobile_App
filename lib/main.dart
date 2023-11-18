import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_management/constant/app_url.dart';
import 'package:meal_management/data_provider/pref_helper.dart';
import 'package:meal_management/screens/authentication/landing_screen.dart';
import 'package:meal_management/utils/enum.dart';
import 'package:meal_management/utils/navigation.dart';
import 'package:meal_management/utils/network_connection.dart';
import 'package:meal_management/utils/styles/styles.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  //Set Potraite Mode only
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(ProviderScope(child: MyApp()));
}

/// Make sure you always init shared pref first. It has token and token is need
/// to make API call
initServices() async {
  AppUrlExtention.setUrl(
    UrlLink.isDev,
  );
  await Firebase.initializeApp();

  await PrefHelper.init();
  await NetworkConnection.instance.InternetAvailable();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    return MaterialApp(
      title: 'Meal Management System',
      navigatorKey: Navigation.key,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: KColor.secondary.color,
        ),
        textTheme: GoogleFonts.robotoTextTheme(),
        primaryColor: KColor.primary.color,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: KColor.secondary.color,
            ),
      ),
      builder: (context, widget) {
        EasyLoading.init();
        return ScrollConfiguration(
          behavior: const ScrollBehaviorModified(),
          child: widget ?? const SizedBox(),
        );
      },
      home: const LandingScreen(),
    );
  }
}

class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.android:
        return const BouncingScrollPhysics();
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
    }
  }
}
