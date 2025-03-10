import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../features/utilisateur/home_user_page.dart';
import '../features/utilisateur/user_profile_page.dart';
import '../features/utilisateur/reservation_page.dart';
import '../core/theme_provider.dart';

class CustomNavBar extends StatefulWidget {
  final int selectedIndex;
  final void Function(int index) onItemTapped;
  final String userEmail; // Ajout d'un paramètre pour l'email de l'utilisateur connecté

  const CustomNavBar({super.key, required this.selectedIndex, required this.onItemTapped, required this.userEmail});

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<Widget> _pages = [
    const ReservationPage(),
    const HomeUserPage(userEmail: ''), // Passez l'email de l'utilisateur connecté
    const UserProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _controller.forward(from: 0.0);
    });
    widget.onItemTapped(index);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          color: theme.bottomNavigationBarTheme.backgroundColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          child: BottomNavigationBar(
            backgroundColor: theme.bottomNavigationBarTheme.backgroundColor,
            currentIndex: _selectedIndex,
            selectedItemColor: theme.bottomNavigationBarTheme.selectedItemColor,
            unselectedItemColor: theme.bottomNavigationBarTheme.unselectedItemColor,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: [
              _buildNavBarItem(Icons.calendar_today, 'Réservations', _selectedIndex == 0),
              _buildNavBarItem(Icons.home, 'Accueil', _selectedIndex == 1),
              _buildNavBarItem(Icons.person, 'Profil', _selectedIndex == 2),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavBarItem(IconData icon, String label, bool isSelected) {
    return BottomNavigationBarItem(
      icon: ScaleTransition(
        scale: isSelected ? _animation : const AlwaysStoppedAnimation(1.0),
        child: Icon(icon),
      ),
      label: label,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
