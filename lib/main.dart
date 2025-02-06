import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/auth/login_user_page.dart';
import 'core/app_layout.dart';
import 'core/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
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
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.themeData,
          home: isAuthenticated ? const AppLayout() : LoginPMR(onLogin: login),
        );
      },
    );
  }
}
