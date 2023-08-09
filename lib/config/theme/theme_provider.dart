import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/config/theme/theme_preferences.dart';

class ModelTheme extends ChangeNotifier {
  late bool _isDark;
  late MyThemePreferences _preferences;

  bool get isDarkMode => _isDark;

  ModelTheme() {
    _isDark = false;
    _preferences = MyThemePreferences();
    getPreferences();
  }

//Switching the themes
  set isDarkMode(bool value) {
    _isDark = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _isDark = await _preferences.getTheme();
    notifyListeners();
  }

  void toggleMode() {
    isDarkMode = !isDarkMode;
  }
}
