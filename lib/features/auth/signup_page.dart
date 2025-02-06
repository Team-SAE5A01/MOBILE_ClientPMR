import 'package:flutter/material.dart';
import 'package:mobilite_pmr/features/auth/login_user_page.dart';
import 'package:mobilite_pmr/features/utilisateur/Page_principal_test.dart';
import 'package:mobilite_pmr/core/app_layout.dart';
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
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 36, 50, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 16, 36, 50),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Champ Prénom
              const Text(
                'Prénom',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _firstNameController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Entrer le prénom',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
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
              const Text(
                'Nom',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _lastNameController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Entrer le nom',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
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
              const Text(
                'Date de naissance',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  hintText: 'Date de naissance',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: const Icon(Icons.calendar_today),
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
                    checkColor: Colors.black,
                    activeColor: Colors.white,
                  ),
                  const Text(
                    "Êtes-vous une personne à mobilité réduite",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),

              // Dropdown pour sélectionner le type de PMR
              if (isMobilityReduced) ...[
                const SizedBox(height: 10),

                // Label pour la liste déroulante
                const Text(
                  'Type de PMR',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 6),

                // Dropdown de sélection
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  dropdownColor: Colors.white,
                  style: const TextStyle(color: Colors.black),
                  value: selectedPMRType,
                  items: pmrTypes.map((String type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type),
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
              const Text(
                'Adresse mail',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _emailController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Entrer une adresse mail',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: _validateEmail,
              ),
              const SizedBox(height: 16),

              // Champ confirmation de l'adresse mail
              const Text(
                'Confirmation de l\'adresse mail',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _confirmEmailController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Confirmer l\'adresse mail',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
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
              const Text(
                'Mot de passe',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _passwordController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Entrer le mot de passe',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: true,
                validator: _validatePassword,
              ),

              // Critères du mot de passe
              const Text(
                'Votre mot de passe doit contenir :',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              const SizedBox(height: 4),
              const Text(
                '  • au minimum 8 caractères\n'
                '  • au moins un chiffre\n'
                '  • au moins un caractère spécial\n'
                '  • au moins une majuscule',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),

              const SizedBox(height: 16),

              // Champ confirmation du mot de passe
              const Text(
                'Confirmation du mot de passe',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _confirmPasswordController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Confirmer le mot de passe',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
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
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text('Annuler', style: TextStyle(color: Color.fromARGB(255, 47, 184, 222))),
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
                      backgroundColor: const Color.fromARGB(255, 47, 184, 222),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text('Valider', style: TextStyle(color: Colors.white)),
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
