import 'package:flutter/material.dart';
import 'package:mobilite_pmr/features/auth/login_user_page.dart';
import 'package:mobilite_pmr/features/utilisateur/Page_principal_test.dart';
import 'package:mobilite_pmr/features/utilisateur/app_layout.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isMobilityReduced = false;
  String? selectedPMRType;
  final TextEditingController _dateController = TextEditingController();

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 36, 50, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 16, 36, 50),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Champ Prénom
            const Text(
              'Prénom',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 6),
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Entrer le prénom',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white, // Fond du champ
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Champ Nom
            const Text(
              'Nom',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 6),
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Entrer le nom',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white, // Fond du champ
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

          // Champ date de naissance
          const Text(
              'Date de naissance',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                hintText: 'Date de naissance',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white, // Fond du champ
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
              ),
              const SizedBox(height: 16),
            ],
            
            // Champ Nom
            const Text(
              'Adresse mail',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 6),
            TextField(
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
            ),
            const SizedBox(height: 16),

            // Champ confirmation de l'adresse mail
            const Text(
              'Confirmation de l\'adresse mail',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 6),
            TextField(
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
            ),
            const SizedBox(height: 16),

            // Champ confirmation de l'adresse mail
            const Text(
              'Mot de passe',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 6),
            TextField(
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
            TextField(
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
            ),
            const SizedBox(height: 16),


            // Boutons Annuler et Valider
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (
                  ) {
                    // Action d'annulation
  Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => const AppLayout(),
  ),
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
                    // Action de validation
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Main_Page(),
                      ),
                    );
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
              ]
            ),
          ]
        ),
      )
    );
  }
}
