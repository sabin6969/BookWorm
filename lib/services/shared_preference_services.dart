import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceServices {
  static late SharedPreferences _preferences;

  static final String _isDarkThemeKey = "isDarkTheme";

  static Future<void> initPrefs() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveTheme(bool isDarkTheme) async {
    await _preferences.setBool(_isDarkThemeKey, isDarkTheme);
  }

  static bool get isDarkTheme {
    return _preferences.getBool(_isDarkThemeKey) ?? false;
  }
}
