import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;

  Future<void> changeNotifier(ThemeMode newTheme) async {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isDark", newTheme == ThemeMode.dark);
  }
}
