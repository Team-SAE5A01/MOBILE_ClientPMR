import 'package:flutter/material.dart';
import '../features/utilisateur/home_user_page.dart';
import '../features/utilisateur/user_profile_page.dart';
import '../features/utilisateur/reservation_page.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key, required int selectedIndex, required void Function(int index) onItemTapped});

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<Widget> _pages = [
    const ReservationPage(),
    const HomeUserPage(),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          color: Colors.blue,
          boxShadow: [
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
            backgroundColor: Colors.blue.shade700,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: ScaleTransition(
                  scale: _selectedIndex == 0 ? _animation : const AlwaysStoppedAnimation(1.0),
                  child: const Icon(Icons.calendar_today),
                ),
                label: 'Réservations',
              ),
              BottomNavigationBarItem(
                icon: ScaleTransition(
                  scale: _selectedIndex == 1 ? _animation : const AlwaysStoppedAnimation(1.0),
                  child: const Icon(Icons.home),
                ),
                label: 'Accueil',
              ),
              BottomNavigationBarItem(
                icon: ScaleTransition(
                  scale: _selectedIndex == 2 ? _animation : const AlwaysStoppedAnimation(1.0),
                  child: const Icon(Icons.person),
                ),
                label: 'Profil',
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
