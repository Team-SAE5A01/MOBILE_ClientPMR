import 'package:flutter/material.dart';

class UserProfileSettingsPage extends StatefulWidget {
  const UserProfileSettingsPage({super.key});

  @override
  _UserProfileSettingsPageState createState() => _UserProfileSettingsPageState();
}

class _UserProfileSettingsPageState extends State<UserProfileSettingsPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres du Profil'),
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

              // Champ Email
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer une adresse e-mail';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Veuillez entrer une adresse e-mail valide';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Bouton Sauvegarder
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Logique pour sauvegarder les modifications
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Paramètres sauvegardés')),
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
                child: Text('Sauvegarder', style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onPrimary)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
