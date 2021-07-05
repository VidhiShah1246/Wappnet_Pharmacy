
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtils{
  static String userData = 'userData';

  SharedPrefUtils();

  static late SharedPreferences prefs;

  SharedPrefUtils.setString(key, value) {
    _setString(key, value);
  }

  SharedPrefUtils.setInt(key, value) {
    _setInt(key, value);
  }

  SharedPrefUtils.setBoolean(key, value) {
    getPref().whenComplete(() {
      _setBoolean(key, value);
    });
  }

  static Future<SharedPreferences> getPref() async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  // string pref
  _setString(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String?> getString(key) async {
    await getPref();
    String? result  = prefs.getString(key);
    return result;
  }

  // int pref
  _setInt(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  Future<int> getInt(key) async {
    await getPref();
    int? result = prefs.getInt(key);
    return result??0;
  }

  // boolean pref
  _setBoolean(key, value) async {
    await prefs.setBool(key, value);
  }

  Future<bool?> getBoolean(key) async {
    await getPref();
    bool? result = prefs.getBool(key);
    return result;
  }

}