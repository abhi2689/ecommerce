import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool _isdarkTheme = false;
  String Theme_value = 'theme_value';
  bool get getDarkTheme => _isdarkTheme;

  ThemeProvider() {
    getTheme();
  }

  setdarkTheme(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(Theme_value, value);
    _isdarkTheme = value;
    notifyListeners();
  }

  Future<bool> getTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _isdarkTheme = preferences.getBool(Theme_value) ?? false;
    notifyListeners();
    return _isdarkTheme;
  }
}
