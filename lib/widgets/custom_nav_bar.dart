import 'package:flutter/material.dart';
import '../features/utilisateur/home_user_page.dart';
import '../features/utilisateur/user_profile_page.dart';
import '../features/utilisateur/reservation_page.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key, required int selectedIndex, required void Function(int index) onItemTapped});

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    const ReservationPage(),
    const HomeUserPage(),
    const UserProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        child: BottomNavigationBar(
          backgroundColor: Colors.blue.shade700,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Réservations',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}
