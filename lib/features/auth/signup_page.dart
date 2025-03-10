// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:mobilite_pmr/features/utilisateur/home_user_page.dart';
// import 'package:mobilite_pmr/main.dart';

// class SignupPage extends StatefulWidget {
//   const SignupPage({super.key});

//   @override
//   _SignupPageState createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {
//   bool isMobilityReduced = false;
//   String? selectedPMRType;
//   String? selectedGender;
//   String? selectedProfileType;
//   final TextEditingController _dateController = TextEditingController();
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _confirmEmailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();
//   final TextEditingController _locationController = TextEditingController();
//   final TextEditingController _aboutController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   final List<String> pmrTypes = [
//     'Mental',
//     'Moteur',
//     'Auditif',
//     'Visuel',
//     'Psychique',
//     'Enceinte',
//     'Personne âgée',
//     'Autre'
//   ];

//   final List<String> genders = ['Homme', 'Femme', 'Autre'];

//   final List<String> profileTypes = ['PMR', 'Accompagnateur', 'Agent'];

//   Future<void> _selectDate() async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//     if (picked != null) {
//       setState(() {
//         _dateController.text = picked.toString().split(' ')[0];
//       });
//     }
//   }

//   String? _validateEmail(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Veuillez entrer une adresse e-mail';
//     }
//     if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//       return 'Veuillez entrer une adresse e-mail valide';
//     }
//     return null;
//   }

//   String? _validatePassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Veuillez entrer un mot de passe';
//     }
//     if (value.length < 8) {
//       return 'Le mot de passe doit contenir au moins 8 caractères';
//     }
//     if (!RegExp(r'[0-9]').hasMatch(value)) {
//       return 'Le mot de passe doit contenir au moins un chiffre';
//     }
//     if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
//       return 'Le mot de passe doit contenir au moins un caractère spécial';
//     }
//     if (!RegExp(r'[A-Z]').hasMatch(value)) {
//       return 'Le mot de passe doit contenir au moins une majuscule';
//     }
//     return null;
//   }

//   String? _validateConfirmPassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Veuillez confirmer le mot de passe';
//     }
//     if (value != _passwordController.text) {
//       return 'Les mots de passe ne correspondent pas';
//     }
//     return null;
//   }

//   Future<void> _saveUserData() async {
//     // Lire le fichier JSON existant
//     final directory = await getApplicationDocumentsDirectory();
//     final file = File('${directory.path}/users.json');
//     String fileContents = await file.readAsString();
//     List<dynamic> usersData = json.decode(fileContents)['users'];

//     // Créer un nouvel utilisateur
//     Map<String, dynamic> newUser = {
//       "id": usersData.length + 1,
//       "firstName": _firstNameController.text,
//       "lastName": _lastNameController.text,
//       "email": _emailController.text,
//       "password": _passwordController.text,
//       "dateOfBirth": _dateController.text,
//       "location": _locationController.text,
//       "profileType": selectedProfileType,
//       "pmrType": selectedPMRType ?? '',
//       "role": selectedProfileType == 'Agent' ? 'agent' : 'user',
//       "gender": selectedGender,
//       "routesCompleted": 0,
//       "reviewsReceived": 0,
//       "averageRating": 0.0,
//       "nextTrip": '',
//       "about": _aboutController.text,
//     };

//     // Ajouter le nouvel utilisateur à la liste
//     usersData.add(newUser);

//     // Écrire les données mises à jour dans le fichier JSON
//     final updatedJson = json.encode({"users": usersData});
//     await file.writeAsString(updatedJson);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,
//       appBar: AppBar(
//         backgroundColor: theme.appBarTheme.backgroundColor,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Champ Prénom
//               Text(
//                 'Prénom',
//                 style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
//               ),
//               const SizedBox(height: 6),
//               TextFormField(
//                 controller: _firstNameController,
//                 style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
//                 decoration: InputDecoration(
//                   hintText: 'Entrer le prénom',
//                   hintStyle: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
//                   filled: true,
//                   fillColor: theme.cardColor,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(16),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Veuillez entrer votre prénom';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),

//               // Champ Nom
//               Text(
//                 'Nom',
//                 style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
//               ),
//               const SizedBox(height: 6),
//               TextFormField(
//                 controller: _lastNameController,
//                 style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
//                 decoration: InputDecoration(
//                   hintText: 'Entrer le nom',
//                   hintStyle: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
//                   filled: true,
//                   fillColor: theme.cardColor,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(16),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Veuillez entrer votre nom';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),

//               // Champ date de naissance
//               Text(
//                 'Date de naissance',
//                 style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
//               ),
//               TextFormField(
//                 controller: _dateController,
//                 decoration: InputDecoration(
//                   hintText: 'Date de naissance',
//                   hintStyle: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
//                   filled: true,
//                   fillColor: theme.cardColor,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(16),
//                     borderSide: BorderSide.none,
//                   ),
//                   suffixIcon: Icon(Icons.calendar_today, color: theme.hintColor),
//                 ),
//                 readOnly: true,
//                 onTap: () {
//                   _selectDate();
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Veuillez sélectionner votre date de naissance';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),

//               // Champ pour le genre
//               Text(
//                 'Genre',
//                 style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
//               ),
//               const SizedBox(height: 6),
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(
//                   labelStyle: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
//                   filled: true,
//                   fillColor: theme.cardColor,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(16),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//                 dropdownColor: theme.cardColor,
//                 style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
//                 value: selectedGender,
//                 items: genders.map((String gender) {
//                   return DropdownMenuItem<String>(
//                     value: gender,
//                     child: Text(gender, style: theme.textTheme.bodyLarge),
//                   );
//                 }).toList(),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     selectedGender = newValue;
//                   });
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Veuillez sélectionner votre genre';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),

//               // Champ pour le type de profil
//               Text(
//                 'Type de profil',
//                 style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
//               ),
//               const SizedBox(height: 6),
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(
//                   labelStyle: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
//                   filled: true,
//                   fillColor: theme.cardColor,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(16),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//                 dropdownColor: theme.cardColor,
//                 style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
//                 value: selectedProfileType,
//                 items: profileTypes.map((String type) {
//                   return DropdownMenuItem<String>(
//                     value: type,
//                     child: Text(type, style: theme.textTheme.bodyLarge),
//                   );
//                 }).toList(),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     selectedProfileType = newValue;
//                     if (newValue == 'PMR') {
//                       isMobilityReduced = true;
//                     } else {
//                       isMobilityReduced = false;
//                       selectedPMRType = null;
//                     }
//                   });
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Veuillez sélectionner votre type de profil';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),

//               // Checkbox pour la mobilité réduite
//               if (isMobilityReduced) ...[
//                 // Dropdown pour sélectionner le type de PMR
//                 Text(
//                   'Type de PMR',
//                   style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
//                 ),
//                 const SizedBox(height: 6),
//                 DropdownButtonFormField<String>(
//                   decoration: InputDecoration(
//                     labelStyle: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
//                     filled: true,
//                     fillColor: theme.cardColor,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(16),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                   dropdownColor: theme.cardColor,
//                   style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
//                   value: selectedPMRType,
//                   items: pmrTypes.map((String type) {
//                     return DropdownMenuItem<String>(
//                       value: type,
//                       child: Text(type, style: theme.textTheme.bodyLarge),
//                     );
//                   }).toList(),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       selectedPMRType = newValue;
//                     });
//                   },
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Veuillez sélectionner un type de PMR';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),
//               ],

//               // Champ Adresse mail
//               Text(
//                 'Adresse mail',
//                 style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
//               ),
//               const SizedBox(height: 6),
//               TextFormField(
//                 controller: _emailController,
//                 style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
//                 decoration: InputDecoration(
//                   hintText: 'Entrer une adresse mail',
//                   hintStyle: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
//                   filled: true,
//                   fillColor: theme.cardColor,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(16),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//                 validator: _validateEmail,
//               ),
//               const SizedBox(height: 16),

//               // Champ confirmation de l'adresse mail
//               Text(
//                 'Confirmation de l\'adresse mail',
//                 style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
//               ),
//               const SizedBox(height: 6),
//               TextFormField(
//                 controller: _confirmEmailController,
//                 style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
//                 decoration: InputDecoration(
//                   hintText: 'Confirmer l\'adresse mail',
//                   hintStyle: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
//                   filled: true,
//                   fillColor: theme.cardColor,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(16),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Veuillez confirmer votre adresse e-mail';
//                   }
//                   if (value != _emailController.text) {
//                     return 'Les adresses e-mail ne correspondent pas';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),

//               // Champ mot de passe
//               Text(
//                 'Mot de passe',
//                 style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
//               ),
//               const SizedBox(height: 6),
//               TextFormField(
//                 controller: _passwordController,
//                 style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
//                 decoration: InputDecoration(
//                   hintText: 'Entrer le mot de passe',
//                   hintStyle: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
//                   filled: true,
//                   fillColor: theme.cardColor,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(16),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//                 obscureText: true,
//                 validator: _validatePassword,
//               ),

//               // Critères du mot de passe
//               Text(
//                 'Votre mot de passe doit contenir :',
//                 style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 '  • au minimum 8 caractères\n'
//                 '  • au moins un chiffre\n'
//                 '  • au moins un caractère spécial\n'
//                 '  • au moins une majuscule',
//                 style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
//               ),

//               const SizedBox(height: 16),

//               // Champ confirmation du mot de passe
//               Text(
//                 'Confirmation du mot de passe',
//                 style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
//               ),
//               const SizedBox(height: 6),
//               TextFormField(
//                 controller: _confirmPasswordController,
//                 style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
//                 decoration: InputDecoration(
//                   hintText: 'Confirmer le mot de passe',
//                   hintStyle: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
//                   filled: true,
//                   fillColor: theme.cardColor,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(16),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//                 obscureText: true,
//                 validator: _validateConfirmPassword,
//               ),
//               const SizedBox(height: 16),

//               // Champ Localisation
//               Text(
//                 'Localisation',
//                 style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
//               ),
//               const SizedBox(height: 6),
//               TextFormField(
//                 controller: _locationController,
//                 style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
//                 decoration: InputDecoration(
//                   hintText: 'Entrer votre localisation',
//                   hintStyle: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
//                   filled: true,
//                   fillColor: theme.cardColor,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(16),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Veuillez entrer votre localisation';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),

//               // Champ À propos de moi
//               Text(
//                 'À propos de moi',
//                 style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
//               ),
//               const SizedBox(height: 6),
//               TextFormField(
//                 controller: _aboutController,
//                 style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
//                 decoration: InputDecoration(
//                   hintText: 'Entrer une description',
//                   hintStyle: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
//                   filled: true,
//                   fillColor: theme.cardColor,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(16),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//                 maxLines: 3,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Veuillez entrer une description';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),

//               // Boutons Annuler et Valider
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushAndRemoveUntil(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const MyApp(),
//                         ),
//                         (route) => false, // Supprime toutes les routes précédentes
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: theme.colorScheme.onPrimary,
//                       padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                     ),
//                     child: Text('Annuler', style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.primary)),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         // Sauvegarder les données de l'utilisateur
//                         _saveUserData();
//                         // Rediriger vers la page principale
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const Main_Page(),
//                           ),
//                         );
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: theme.colorScheme.primary,
//                       padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                     ),
//                     child: Text('Valider', style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onPrimary)),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }






import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobilite_pmr/core/api_service.dart';
import 'package:mobilite_pmr/features/utilisateur/home_user_page.dart';
import 'package:mobilite_pmr/main.dart';
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isMobilityReduced = false;
  String? selectedPMRType;
  String? selectedGender;
  String? selectedProfileType;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ApiService _apiService = ApiService();

  final List<String> pmrTypes = [
    'Mental',
    'Moteur',
    'Auditif',
    'Visuel',
    'Psychique',
    'Enceinte',
    'Personne âgée',
    'Autre'
  ];

  final List<String> genders = ['Homme', 'Femme', 'Autre'];

  final List<String> profileTypes = ['PMR', 'Accompagnateur', 'Agent'];

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(' ')[0];
      });
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer une adresse e-mail';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Veuillez entrer une adresse e-mail valide';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer un mot de passe';
    }
    if (value.length < 8) {
      return 'Le mot de passe doit contenir au moins 8 caractères';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Le mot de passe doit contenir au moins un chiffre';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Le mot de passe doit contenir au moins un caractère spécial';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Le mot de passe doit contenir au moins une majuscule';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez confirmer le mot de passe';
    }
    if (value != _passwordController.text) {
      return 'Les mots de passe ne correspondent pas';
    }
    return null;
  }

  bool _validateEmailFormat(String email) {
    // Validation de l'email
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }

  bool _validatePasswordFormat(String password) {
    // Validation du mot de passe
    return password.length >= 8 &&
           RegExp(r'[0-9]').hasMatch(password) &&
           RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password) &&
           RegExp(r'[A-Z]').hasMatch(password);
  }

  bool _validateDateFormat(String date) {
    // Validation de la date
    return DateTime.tryParse(date) != null;
  }

  Future<void> _saveUserData() async {
    try {
      // Validation des champs
      if (!_validateEmailFormat(_emailController.text)) {
        throw Exception("Email invalide");
      }
      if (!_validatePasswordFormat(_passwordController.text)) {
        throw Exception("Mot de passe invalide");
      }
      if (_passwordController.text != _confirmPasswordController.text) {
        throw Exception("Les mots de passe ne correspondent pas");
      }
      if (!_validateDateFormat(_dateController.text)) {
        throw Exception("Date de naissance invalide");
      }
      if (_lastNameController.text.isEmpty) {
        throw Exception("Nom vide");
      }
      if (_firstNameController.text.isEmpty) {
        throw Exception("Prénom vide");
      }

      // Créer un nouvel utilisateur avec les champs requis
      Map<String, dynamic> newUser = {
        "email": _emailController.text,
        "mot_de_passe": _passwordController.text,
        "confirm_mot_de_passe": _confirmPasswordController.text,
        "role": selectedProfileType == 'Agent' ? 'agent' : 'client',
        "date_naissance": _dateController.text,
        "nom": _lastNameController.text,
        "prenom": _firstNameController.text,
        "type_handicap": selectedPMRType ?? 'aucun',
        "disponible": true,
      };

      // Enregistrer l'utilisateur via l'API
      final response = await _apiService.registerUser(newUser);

      // Log de la réponse de l'API
      print("Réponse de l'API : ${response.statusCode}");
      print("Corps de la réponse : ${response.body}");

      // Vérifier la réponse de l'API
      if (response.statusCode == 201) {
        // Rediriger vers la page HomeUserPage après l'inscription
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeUserPage(userEmail: _emailController.text),
          ),
        );
      } else {
        // Afficher un message d'erreur basé sur la réponse de l'API
        final errorMessage = json.decode(response.body)['detail'] ?? 'Erreur inconnue';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur lors de l\'inscription : $errorMessage')),
        );
      }
    } catch (e) {
      print("Erreur lors de l'inscription : $e"); // Log pour le débogage
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de l\'inscription : $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Champ Prénom
              Text(
                'Prénom',
                style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _firstNameController,
                style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
                decoration: InputDecoration(
                  hintText: 'Entrer le prénom',
                  hintStyle: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
                  filled: true,
                  fillColor: theme.cardColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre prénom';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Champ Nom
              Text(
                'Nom',
                style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _lastNameController,
                style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
                decoration: InputDecoration(
                  hintText: 'Entrer le nom',
                  hintStyle: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
                  filled: true,
                  fillColor: theme.cardColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre nom';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Champ date de naissance
              Text(
                'Date de naissance',
                style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
              ),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  hintText: 'Date de naissance',
                  hintStyle: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
                  filled: true,
                  fillColor: theme.cardColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: Icon(Icons.calendar_today, color: theme.hintColor),
                ),
                readOnly: true,
                onTap: () {
                  _selectDate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner votre date de naissance';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Champ pour le genre
              Text(
                'Genre',
                style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
              ),
              const SizedBox(height: 6),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelStyle: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
                  filled: true,
                  fillColor: theme.cardColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                dropdownColor: theme.cardColor,
                style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
                value: selectedGender,
                items: genders.map((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender, style: theme.textTheme.bodyLarge),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedGender = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner votre genre';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Champ pour le type de profil
              Text(
                'Type de profil',
                style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
              ),
              const SizedBox(height: 6),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelStyle: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
                  filled: true,
                  fillColor: theme.cardColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                dropdownColor: theme.cardColor,
                style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
                value: selectedProfileType,
                items: profileTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type, style: theme.textTheme.bodyLarge),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedProfileType = newValue;
                    if (newValue == 'PMR') {
                      isMobilityReduced = true;
                    } else {
                      isMobilityReduced = false;
                      selectedPMRType = null;
                    }
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner votre type de profil';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Checkbox pour la mobilité réduite
              if (isMobilityReduced) ...[
                // Dropdown pour sélectionner le type de PMR
                Text(
                  'Type de PMR',
                  style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
                ),
                const SizedBox(height: 6),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelStyle: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
                    filled: true,
                    fillColor: theme.cardColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  dropdownColor: theme.cardColor,
                  style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
                  value: selectedPMRType,
                  items: pmrTypes.map((String type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type, style: theme.textTheme.bodyLarge),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedPMRType = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez sélectionner un type de PMR';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
              ],

              // Champ Adresse mail
              Text(
                'Adresse mail',
                style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _emailController,
                style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
                decoration: InputDecoration(
                  hintText: 'Entrer une adresse mail',
                  hintStyle: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
                  filled: true,
                  fillColor: theme.cardColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: _validateEmail,
              ),
              const SizedBox(height: 16),

              // Champ confirmation de l'adresse mail
              Text(
                'Confirmation de l\'adresse mail',
                style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _confirmEmailController,
                style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
                decoration: InputDecoration(
                  hintText: 'Confirmer l\'adresse mail',
                  hintStyle: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
                  filled: true,
                  fillColor: theme.cardColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez confirmer votre adresse e-mail';
                  }
                  if (value != _emailController.text) {
                    return 'Les adresses e-mail ne correspondent pas';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Champ mot de passe
              Text(
                'Mot de passe',
                style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _passwordController,
                style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
                decoration: InputDecoration(
                  hintText: 'Entrer le mot de passe',
                  hintStyle: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
                  filled: true,
                  fillColor: theme.cardColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: true,
                validator: _validatePassword,
              ),

              // Critères du mot de passe
              Text(
                'Votre mot de passe doit contenir :',
                style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
              ),
              const SizedBox(height: 4),
              Text(
                '  • au minimum 8 caractères\n'
                '  • au moins un chiffre\n'
                '  • au moins un caractère spécial\n'
                '  • au moins une majuscule',
                style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
              ),

              const SizedBox(height: 16),

              // Champ confirmation du mot de passe
              Text(
                'Confirmation du mot de passe',
                style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _confirmPasswordController,
                style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
                decoration: InputDecoration(
                  hintText: 'Confirmer le mot de passe',
                  hintStyle: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
                  filled: true,
                  fillColor: theme.cardColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: true,
                validator: _validateConfirmPassword,
              ),
              const SizedBox(height: 16),

              // Champ Localisation
              Text(
                'Localisation',
                style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _locationController,
                style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
                decoration: InputDecoration(
                  hintText: 'Entrer votre localisation',
                  hintStyle: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
                  filled: true,
                  fillColor: theme.cardColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre localisation';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Champ À propos de moi
              Text(
                'À propos de moi',
                style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _aboutController,
                style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
                decoration: InputDecoration(
                  hintText: 'Entrer une description',
                  hintStyle: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
                  filled: true,
                  fillColor: theme.cardColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer une description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Boutons Annuler et Valider
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyApp(),
                        ),
                        (route) => false, // Supprime toutes les routes précédentes
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.onPrimary,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text('Annuler', style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.primary)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Sauvegarder les données de l'utilisateur
                        _saveUserData();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text('Valider', style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onPrimary)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
