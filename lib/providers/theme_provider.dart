import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _value = true;

  void changeTheme() {
    _value = !_value;
    notifyListeners();
  }

  bool get getThemeValue => _value;
}
