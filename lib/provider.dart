import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class App_Config extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.dark;
  Locale applocale = Locale('en');

  void changeTheme(ThemeMode newMode) {
    if (appTheme == newMode) {
      return;
    }
    appTheme = newMode;
    notifyListeners();
  }

  void changeLocale(Locale newLocale) {
    if (applocale == newLocale) {
      return;
    }
    applocale = newLocale;
    notifyListeners();
  }
}
