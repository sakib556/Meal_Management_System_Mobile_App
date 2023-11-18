import 'package:meal_management/utils/enum.dart';

enum AppUrl {
  base,
  user
  // verifyOtpUrl,
  // serviceCategoriesUrl,
  // serviceByCategoryIdUrl,
  // serviceItemsByServiceIdUrl,
  // userMeUrl,
  // updateUserMeUrl,
  // homeBannersUrl,
  // couponsUrl,
  // splashScreenUrl,
  // fileUploadUrl,
  // allOrdersUrl,
}

extension AppUrlExtention on AppUrl {
  static const String _baseUrl = "https://mealmanagement556.000webhostapp.com";
  static String user = "user.php";

  static void setUrl(UrlLink urlLink) {
    switch (urlLink) {
      case UrlLink.isLive:
        // _baseUrl = "";

        break;

      case UrlLink.isDev:
        //_baseUrl = "";

        break;
      case UrlLink.isLocalServer:
        // set up your local server ip address.
        break;
    }
  }

  String get url {
    switch (this) {
      case AppUrl.base:
        return _baseUrl;
      case AppUrl.user:
        return user;
    }
  }
}
