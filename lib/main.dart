import 'package:flutter/material.dart';
import 'features/auth/login_user_page.dart';
import 'features/utilisateur/app_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isAuthenticated = false; // Indique si l'utilisateur est connecté

  void login() {
    setState(() {
      isAuthenticated = true; // Passe à la page principale après connexion
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isAuthenticated ? const AppLayout() : LoginPMR(onLogin: login),
    );
  }
}