// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:provider/provider.dart';
// import 'features/auth/login_user_page.dart';
// import 'core/app_layout.dart';
// import 'core/theme_provider.dart';

// Future<void> copyUsersJsonToAppDirectory() async {
//   try {
//     final directory = await getApplicationDocumentsDirectory();
//     final file = File('${directory.path}/users.json');

//     // Vérifiez si le fichier existe déjà
//     if (!await file.exists()) {
//       // Lire le fichier JSON depuis les assets
//       final data = await rootBundle.loadString('assets/users.json');
//       // Écrire le fichier JSON dans le répertoire de l'application
//       await file.writeAsString(data);
//       print("File copied successfully.");
//     } else {
//       print("File already exists.");
//     }
//   } catch (e) {
//     print("Error copying file: $e");
//   }
// }

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await copyUsersJsonToAppDirectory();
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => ThemeProvider(),
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool isAuthenticated = false; // Indique si l'utilisateur est connecté
//   String userEmail = ''; // Variable pour stocker l'email de l'utilisateur connecté

//   void login(String email) {
//     setState(() {
//       isAuthenticated = true; // Passe à la page principale après connexion
//       userEmail = email; // Stocke l'email de l'utilisateur connecté
//       print("Logged in user email: $email"); // Log pour vérifier l'email de l'utilisateur connecté
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ThemeProvider>(
//       builder: (context, themeProvider, child) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           theme: themeProvider.themeData,
//           home: isAuthenticated
//               ? AppLayout(userEmail: userEmail) // Passe l'email de l'utilisateur connecté à AppLayout
//               : LoginPMR(onLogin: login),
//         );
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/api_service.dart';
import 'core/theme_provider.dart';
import 'features/auth/login_user_page.dart';
import 'core/app_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Vérifier la connexion à l'API
  final apiService = ApiService();
  bool isConnected = await apiService.checkApiConnection();

  if (isConnected) {
    print("Connexion à l'API réussie.");
  } else {
    print("Échec de la connexion à l'API.");
  }

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
  bool isAuthenticated = false;
  String userEmail = '';

  void login(String email) {
    setState(() {
      isAuthenticated = true;
      userEmail = email;
      print("Logged in user email: $email");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.themeData,
          home: isAuthenticated
              ? AppLayout(userEmail: userEmail)
              : LoginPMR(onLogin: login),
        );
      },
    );
  }
}
