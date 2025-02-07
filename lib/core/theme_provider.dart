import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  late ThemeData _themeData;

  ThemeProvider() {
    _themeData = _buildDarkTheme(); // Initialisation dans le constructeur
  }

  ThemeData get themeData => _themeData;

  void setTheme(String theme) {
    switch (theme) {
      case 'Dark':
        _themeData = _buildDarkTheme();
        break;
      case 'Light':
        _themeData = _buildLightTheme();
        break;
      case 'Daltonien (Deuteranopie)':
        _themeData = _buildDeuteranopiaTheme();
        break;
      case 'Daltonien (Protanopie)':
        _themeData = _buildProtanopiaTheme();
        break;
      case 'Daltonien (Tritanopie)':
        _themeData = _buildTritanopiaTheme();
        break;
      case 'Noir et Blanc':
        _themeData = _buildBlackAndWhiteTheme();
        break;
      default:
        _themeData = _buildDarkTheme();
    }
    notifyListeners();
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.blue[900],
      scaffoldBackgroundColor: Colors.blue[900],
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue[900],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
      ),
      cardColor: Colors.blue[800],
      dividerColor: Colors.blue[700],
      iconTheme: IconThemeData(color: Colors.white),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.blue[900],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
      ),
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue[200],
      scaffoldBackgroundColor: Colors.blue[50],
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue[200],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
      ),
      cardColor: Colors.blue[100],
      dividerColor: Colors.blue[300],
      iconTheme: IconThemeData(color: Colors.black),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.blue[200],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
      ),
    );
  }

  ThemeData _buildDeuteranopiaTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
      ),
      cardColor: Colors.green[100],
      dividerColor: Colors.green[300],
      iconTheme: IconThemeData(color: Colors.black),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.green,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
      ),
    );
  }

  ThemeData _buildProtanopiaTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
      ),
      cardColor: Colors.blue[100],
      dividerColor: Colors.blue[300],
      iconTheme: IconThemeData(color: Colors.black),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
      ),
    );
  }

  ThemeData _buildTritanopiaTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.purple,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.purple,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
      ),
      cardColor: Colors.purple[100],
      dividerColor: Colors.purple[300],
      iconTheme: IconThemeData(color: Colors.black),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.purple,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
      ),
    );
  }

  ThemeData _buildBlackAndWhiteTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
      ),
      cardColor: Colors.grey[300],
      dividerColor: Colors.grey[500],
      iconTheme: IconThemeData(color: Colors.black),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
      ),
    );
  }
}
