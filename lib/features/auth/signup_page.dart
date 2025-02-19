import 'package:flutter/material.dart';
import 'package:mobilite_pmr/features/utilisateur/Page_principal_test.dart';
import 'package:mobilite_pmr/main.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isMobilityReduced = false;
  String? selectedPMRType;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

              // Checkbox pour la mobilité réduite
              Row(
                children: [
                  Checkbox(
                    value: isMobilityReduced,
                    onChanged: (bool? value) {
                      setState(() {
                        isMobilityReduced = value ?? false;
                        if (!isMobilityReduced) {
                          selectedPMRType = null;
                        }
                      });
                    },
                    checkColor: theme.colorScheme.onPrimary,
                    activeColor: theme.colorScheme.primary,
                  ),
                  Text(
                    "Êtes-vous une personne à mobilité réduite",
                    style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
                  ),
                ],
              ),

              // Dropdown pour sélectionner le type de PMR
              if (isMobilityReduced) ...[
                const SizedBox(height: 10),
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

              // Champ Nom
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
                        // Si le formulaire est valide, redirigez vers la page principale
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Main_Page(),
                          ),
                        );
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
