import "package:flutter/material.dart";

// here we are going to implement logic for dark theme using provider

class ThemeChanger with ChangeNotifier {
  // inittial we have light mode S
  var _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;
  void setTheme(themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}
