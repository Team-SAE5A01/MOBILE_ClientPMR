import 'package:flutter/material.dart';
import 'package:mobilite_pmr/features/utilisateur/user_profile_settings_page.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 36, 50, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromRGBO(68, 138, 255, 1), Color(0xFF102432)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset(
                        'lib/assets/images/user_avatar.png',
                        fit: BoxFit.cover,
                        width: 90,
                        height: 90,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Julien Lebois',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Accompagnateur / PMR',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on, color: Colors.white70, size: 16),
                      SizedBox(width: 5),
                      Text(
                        'San Francisco',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Text(
                    'À propos de moi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Utilisateur enregistré pour assistance et trajets PMR.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProfileStat(title: 'Itinéraires réalisés', value: '120'),
                      ProfileStat(title: 'Avis reçus', value: '45'),
                      ProfileStat(title: 'Moyenne avis', value: '4.8 ★'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const ProfileDetail(icon: Icons.email, label: 'julien.lebois@gmail.com'),
                  const ProfileDetail(icon: Icons.cake, label: '15 Mars 1993'),
                  const ProfileDetail(icon: Icons.accessibility, label: 'Utilisateur PMR / Accompagnateur'),
                  const ProfileDetail(icon: Icons.history, label: 'Historique des trajets disponibles'),
                  const ProfileDetail(icon: Icons.event, label: 'Prochain trajet prévu : 10 Février 2025'),
                  const SizedBox(height: 20),
                  ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromRGBO(68, 138, 255, 1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 80),
  ),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserProfileSettingsPage()),
    );
  },
  child: const Text(
    'Modifier le profil',
    style: TextStyle(fontSize: 16, color: Colors.white),
  ),
)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileStat extends StatelessWidget {
  final String title;
  final String value;

  const ProfileStat({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          title,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
      ],
    );
  }
}

class ProfileDetail extends StatelessWidget {
  final IconData icon;
  final String label;

  const ProfileDetail({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70, size: 20),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
