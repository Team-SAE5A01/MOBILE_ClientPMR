import 'package:flutter/material.dart';
import 'Login/Login_PMR.dart';

void main() {
  runApp(const MyApp());
}

// Classe principale de l'application
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  LoginPMR(), // Utilisation du widget LoginPMR
    );
  }
}
