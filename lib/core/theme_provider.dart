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
    primaryColor: Color(0xFF102432),
    scaffoldBackgroundColor: Color(0xFF102432),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF102432),
      iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
    ),
    cardColor: Color(0xFF102432),
    dividerColor: Color(0xFF2FB8DE),
    iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF102432),
      selectedItemColor: Color(0xFFFFFFFF),
      unselectedItemColor: Color(0xFFD3D3D3),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Color(0xFF2FB8DE),
      textTheme: ButtonTextTheme.primary,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Color(0xFF000000),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: Color(0xFFD3D3D3)),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFFFFFFF)),
      ),
    ),
  );
}


  ThemeData _buildLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFF102432),
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF102432),
      iconTheme: IconThemeData(color: Color(0xFF000000)),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(color: Color(0xFF000000), fontSize: 18, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: Color(0xFF000000), fontSize: 16),
    ),
    cardColor: Color(0xFFFFFFFF),
    dividerColor: Color(0xFFD3D3D3),
    iconTheme: IconThemeData(color: Color(0xFF000000)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF102432),
      selectedItemColor: Color(0xFFD3D3D3),
      unselectedItemColor: Color(0xFFD3D3D3),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Color(0xFF2FB8DE),
      textTheme: ButtonTextTheme.primary,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Color(0xFF000000),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: Color(0xFFD3D3D3)),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF000000)),
      ),
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
