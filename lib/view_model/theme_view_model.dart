import 'package:bookworm/services/shared_preference_services.dart';
import 'package:flutter/material.dart';

class ThemeViewModel extends ChangeNotifier {
  bool _isDarkTheme = SharedPreferenceServices.isDarkTheme;
  bool get isDarkTheme => _isDarkTheme;

  set changeThemeMode(bool isDarkTheme) {
    _isDarkTheme = isDarkTheme;
    notifyListeners();
  }

  void toogleTheme() async {
    await SharedPreferenceServices.saveTheme(!_isDarkTheme);
    changeThemeMode = !_isDarkTheme;
  }
}
