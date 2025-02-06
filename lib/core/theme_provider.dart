import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = ThemeData.dark();

  ThemeData get themeData => _themeData;

  void setTheme(String theme) {
    switch (theme) {
      case 'Normal':
        _themeData = ThemeData.dark();
        break;
      case 'Daltonien (Deuteranopie)':
        _themeData = ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.green,
          hintColor: Colors.red,
        );
        break;
      case 'Daltonien (Protanopie)':
        _themeData = ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blue,
          hintColor: Colors.yellow,
        );
        break;
      case 'Daltonien (Tritanopie)':
        _themeData = ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.purple,
          hintColor: Colors.orange,
        );
        break;
      case 'Noir et Blanc':
        _themeData = ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.white,
          hintColor: Colors.black,
        );
        break;
    }
    notifyListeners();
  }
}
