import 'package:meal_management/constant/constant_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static Future setString(String key, String value) async {
    var _pref = await _instance;
    await _pref.setString(key, value);
  }

  static Future setInt(String key, int value) async {
    var _pref = await _instance;
    await _pref.setInt(key, value);
  }

  static Future setBool(String key, bool value) async {
    var _pref = await _instance;
    await _pref.setBool(key, value);
  }

  static Future setDouble(String key, double value) async {
    var _pref = await _instance;
    await _pref.setDouble(key, value);
  }

  static Future setStringList(String key, List<String> value) async {
    var _pref = await _instance;
    await _pref.setStringList(key, value);
  }

  static getString(String key, [String defaultValue = ""]) {
    return _prefsInstance?.getString(key) ?? defaultValue;
  }

  static getInt(String key) {
    return _prefsInstance?.getInt(key) ?? 0;
  }

  static getBool(String key) {
    return _prefsInstance?.getBool(key) ?? false;
  }

  static getDouble(String key) {
    return _prefsInstance?.getDouble(key) ?? 0.0;
  }

  static getStringList(String key) {
    return _prefsInstance?.getStringList(key) ?? <String>[];
  }

  static getLanguage() {
    return _prefsInstance?.getInt(AppConstant.LANGUAGE.key) ?? 1;
  }

  static Future setToken(String value) async {
    var _pref = await _instance;
    await _pref.setString(AppConstant.TOKEN.key, value);
  }

  static Future setLoginStatus(bool value) async {
    var _pref = await _instance;
    await _pref.setBool(AppConstant.LOGIN_STATUS.key, value);
  }

  static String? getToken() {
    return _prefsInstance?.getString(AppConstant.TOKEN.key);
  }

  static bool getLoginStatus() {
    return _prefsInstance?.getBool(AppConstant.LOGIN_STATUS.key) ?? false;
  }

  static Future<void> logout() async {
    final languageValue = getLanguage();
    // _prefsInstance?.clear();
    await _prefsInstance?.setInt(AppConstant.LANGUAGE.key, languageValue);
    await _prefsInstance?.remove(AppConstant.TOKEN.key);
    await _prefsInstance?.remove(AppConstant.LOGIN_STATUS.key);
  }
}
