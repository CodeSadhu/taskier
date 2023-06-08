import 'dart:async' show Future;
import 'package:appwrite_hack/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Shared preferences used data store and retrive
class SharedPrefs {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences> init() async {
    await _instance;
    _prefsInstance = await SharedPreferences.getInstance();
    return _prefsInstance!;
  }

  static Future<bool> clearPreferences() async {
    bool isCleared = false;
    await _prefsInstance!.clear().then((value) {
      isCleared = true;
    });
    return isCleared;
  }

  static setValue(String? key, String? value) async {
    if (value == null) return;
    var prefs = await _instance;
    prefs.setString(key!, value);
  }

  static getValue(String key) async {
    return _prefsInstance!.getString(key);
  }

  static setList(String? key, List<String>? list) async {
    if (list == null || list.isEmpty) return;
    var prefs = await _instance;
    prefs.setStringList(key!, list);
  }

  static getList(String key) async {
    return _prefsInstance!.getStringList(key);
  }

  static setToken(String? token) async {
    if (token == null) return;
    var prefs = await _instance;
    prefs.setString(Constants.accessToken, token);
  }

  static setRefreshToken(String? token) async {
    if (token == null) return;
    var prefs = await _instance;
    prefs.setString(Constants.refreshToken, token);
  }

  static String? getToken() {
    return _prefsInstance!.getString(Constants.accessToken);
  }

  static String? getRefreshToken() {
    return _prefsInstance!.getString(Constants.refreshToken);
  }
}
