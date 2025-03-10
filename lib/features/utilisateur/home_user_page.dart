import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'settings_page.dart';

class HomeUserPage extends StatefulWidget {
  final String userEmail;

  const HomeUserPage({super.key, required this.userEmail});

  @override
  _HomeUserPageState createState() => _HomeUserPageState();
}

class _HomeUserPageState extends State<HomeUserPage> {
  Map<String, dynamic>? _userData;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    print("User email in HomeUserPage initState: ${widget.userEmail}"); // Log pour vérifier l'email dans initState
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      final jsonString = await rootBundle.loadString('assets/users.json');
      print("JSON String loaded: $jsonString"); // Log pour vérifier la chaîne JSON lue

      final data = json.decode(jsonString);
      print("Decoded data in HomeUserPage: $data"); // Log pour vérifier les données décodées
      print("User email in HomeUserPage: ${widget.userEmail}"); // Log pour vérifier l'email de l'utilisateur

      setState(() {
        _userData = data['users'].firstWhere(
          (user) => user['email'] == widget.userEmail,
          orElse: () => null,
        );
        _isLoading = false;
      });

      if (_userData == null) {
        setState(() {
          _errorMessage = "Utilisateur non trouvé";
        });
        print("User not found for email: ${widget.userEmail}"); // Log pour vérifier si l'utilisateur n'est pas trouvé
      } else {
        print("User data loaded: $_userData"); // Log pour vérifier les données utilisateur chargées
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = "Erreur lors du chargement des données : $e";
      });
      print("Error loading user data: $e"); // Log pour vérifier les erreurs
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text('Accueil', style: theme.textTheme.headlineSmall),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: theme.iconTheme.color),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(child: Text(_errorMessage!))
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: theme.cardColor,
                              child: Icon(Icons.person, size: 40, color: theme.colorScheme.onSurface),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Bienvenue,',
                                  style: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.onSurface),
                                ),
                                if (_userData != null) // Vérifiez que _userData n'est pas null
                                  Text(
                                    '${_userData!['firstName']} ${_userData!['lastName']}',
                                    style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
                                  ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Vos réservations',
                          style: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.onSurface),
                        ),
                        const Divider(),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              height: 60,
                              decoration: BoxDecoration(
                                color: theme.cardColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Vos voyages passés',
                          style: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.onSurface),
                        ),
                        const Divider(),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              height: 60,
                              decoration: BoxDecoration(
                                color: theme.cardColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
