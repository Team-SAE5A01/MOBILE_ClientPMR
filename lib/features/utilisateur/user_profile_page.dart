import 'package:flutter/material.dart';
import '../../widgets/custom_nav_bar.dart'; // Import du widget

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 2; // Index de la page actuelle (Profil)

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pushNamed(context, '/reservations');
    } else if (index == 1) {
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 36, 50, 1),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Center(
            child: Text(
              "Page de Profil",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          Expanded(child: Container()), // Espace vide pour équilibrer
          CustomNavBar(
            selectedIndex: _selectedIndex,
            onItemTapped: _onItemTapped,
          ),
        ],
      ),
    );
  }
}
