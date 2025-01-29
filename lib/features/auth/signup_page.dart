import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isMobilityReduced = false;
  String? selectedPMRType;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Fond sombre
      appBar: AppBar(
        title: const Text('Page Sign Up'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
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
                hintStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.grey[800], // Fond du champ
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
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
                hintStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.grey[800], // Fond du champ
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

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
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Type de PMR',
                  labelStyle: const TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                dropdownColor: Colors.grey[900],
                style: const TextStyle(color: Colors.white),
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
            ],
          ],
        ),
      ),
    );
  }
}
