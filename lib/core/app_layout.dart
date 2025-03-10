import 'package:flutter/material.dart';
import '../features/utilisateur/home_user_page.dart';
import '../features/utilisateur/user_profile_page.dart';
import '../features/utilisateur/reservation_page.dart';
import '../widgets/custom_nav_bar.dart'; // Import de la navbar

class AppLayout extends StatefulWidget {
  final String userEmail;

  const AppLayout({super.key, required this.userEmail});

  @override
  _AppLayoutState createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _selectedIndex = 1;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    print("User email in AppLayout: ${widget.userEmail}"); // Log pour vérifier l'email passé à AppLayout
    _pages = [
      const ReservationPage(),
      HomeUserPage(userEmail: widget.userEmail),
      const UserProfilePage(),
    ];
  }

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
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        userEmail: widget.userEmail,
      ),
    );
  }
}
