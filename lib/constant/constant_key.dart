enum AppConstant {
  USER_ID,
  TOKEN,
  LOGIN_STATUS,
  MY_BASKET_PREF_KEY,
  LANGUAGE,
  YYYY_MM_DD,
  DD_MM_YYYY,
  DD_MM_YYYY_SLASH,
  D_MMM_Y_HM,
  D_MMM_Y,
  D_MM_Y,
  YYYY_MM,
  MMM,
  MMMM,
  MMMM_Y,
  APPLICATION_JSON,
  BEARER,
  MULTIPART_FORM_DATA,
  IS_SWITCHED,
  DEVICE_ID,
  DEVICE_OS,
  USER_AGENT,
  APP_VERSION,
  BUILD_NUMBER,
  ANDROID,
  IOS,
  IPN_URL,
  STORE_ID,
  STORE_PASSWORD,
  MOBILE,
  EMAIL,
  PUSH_ID,
  EN,
  BN,
  FONTFAMILY,
  
}

extension AppConstantExtention on AppConstant {
  String get key {
    switch (this) {
      case AppConstant.USER_ID:
        return "USER_ID";
      case AppConstant.TOKEN:
        return "TOKEN";
      case AppConstant.LOGIN_STATUS:
        return "LOGIN_STATUS";
      case AppConstant.MY_BASKET_PREF_KEY:
        return "MY_BASKET_PREF_KEY";
      case AppConstant.LANGUAGE:
        return "language";
      case AppConstant.DD_MM_YYYY:
        return "dd-MM-yyyy";
      case AppConstant.DD_MM_YYYY_SLASH:
        return "dd/MM/yyyy hh:mm a";
      case AppConstant.D_MMM_Y_HM:
        return "d MMMM y hh:mm a";
      case AppConstant.D_MM_Y:
        return "d MMM y";
      case AppConstant.D_MMM_Y:
        return "d MMMM y";
      case AppConstant.MMMM_Y:
        return "MMMM y";
      case AppConstant.MMM:
        return "MMM";
      case AppConstant.MMM:
        return "MMMM";
      case AppConstant.YYYY_MM:
        return 'yyyy-MM';
      case AppConstant.YYYY_MM_DD:
        return "yyyy-MM-dd";
      case AppConstant.APPLICATION_JSON:
        return "application/json";
      case AppConstant.BEARER:
        return "Bearer";
      case AppConstant.MULTIPART_FORM_DATA:
        return "multipart/form-data";
      case AppConstant.IS_SWITCHED:
        return "IS_SWITCHED";
      case AppConstant.USER_AGENT:
        return "user-agent";
      case AppConstant.BUILD_NUMBER:
        return "build";
      case AppConstant.DEVICE_ID:
        return "device-id";
      case AppConstant.APP_VERSION:
        return "app-version";
      case AppConstant.DEVICE_OS:
        return "device-os";
      case AppConstant.PUSH_ID:
        return "push-id";
      case AppConstant.ANDROID:
        return "android";
      case AppConstant.IOS:
        return "ios";
      case AppConstant.IPN_URL:
        return "ipn_url";
      case AppConstant.STORE_ID:
        return "store_id";
      case AppConstant.STORE_PASSWORD:
        return "store_password";
      case AppConstant.MOBILE:
        return "mobile";
      case AppConstant.EMAIL:
        return "email";
      case AppConstant.EN:
        return 'en';
      case AppConstant.BN:
        return 'bn';
      case AppConstant.FONTFAMILY:
        return 'Arboria';
    

      default:
        return "";
    }
  }
}



