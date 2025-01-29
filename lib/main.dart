import 'package:flutter/material.dart';
import 'features/auth/Login_PMR.dart';

void main() {
  runApp(const MyApp());
}

// Classe principale de l'application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:  LoginPMR(), // Utilisation du widget LoginPMR
    );
  }
}
