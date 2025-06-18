import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  CacheHelper._internal();
  static final CacheHelper _instance = CacheHelper._internal();
  factory CacheHelper() => _instance;
  static late SharedPreferences sharedPreferences;
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  ///Below method is to set the string value in the SharedPreferences.
  Future<dynamic> setString(String key, String stringValue) async {
    await sharedPreferences.setString(key, stringValue);
  }

  ///Below method is to get the string value from the SharedPreferences.
  String? getString(String key) {
    return sharedPreferences.getString(key);
  }

  ///Below method is to set the boolean value in the SharedPreferences.
  Future<dynamic> setBoolean(String key, bool booleanValue) async {
    await sharedPreferences.setBool(key, booleanValue);
  }

  ///Below method is to get the boolean value from the SharedPreferences.
  bool? getBoolean(String key) {
    return sharedPreferences.getBool(key);
  }

  ///Below method is to set the double value in the SharedPreferences.
  Future<dynamic> setDouble(String key, double doubleValue) async {
    await sharedPreferences.setDouble(key, doubleValue);
  }

  ///Below method is to set the double value from the SharedPreferences.
  double? getDouble(String key) {
    return sharedPreferences.getDouble(key);
  }

  ///Below method is to set the int value in the SharedPreferences.
  Future<dynamic> setInt(String key, int intValue) async {
    await sharedPreferences.setInt(key, intValue);
  }

  ///Below method is to get the int value from the SharedPreferences.
  int? getInt(String key) {
    return sharedPreferences.getInt(key);
  }

  ///Below method is to remove the received preference.
  Future<dynamic> delete(String key) async {
    await sharedPreferences.remove(key);
  }

  ///Below method is to clear the SharedPreference.
  Future<dynamic> clear() async {
    await sharedPreferences.clear();
  }
}
