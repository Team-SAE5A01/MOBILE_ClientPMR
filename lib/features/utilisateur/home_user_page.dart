import 'package:flutter/material.dart';
import 'settings_page.dart'; 

class HomeUserPage extends StatelessWidget {
  const HomeUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
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
      body: Column(
        children: [
          const SizedBox(height: 40),
          // User Profile Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
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
                      'Bienvenue',
                      style: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.onSurface),
                    ),
                    Text(
                      'Julien',
                      style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Reservations Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Vos réservations',
                  style: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.onSurface),
                ),
                Divider(color: theme.dividerColor),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              children: List.generate(
                2,
                (index) => Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 60,
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          // Past Trips Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Vos voyages passés',
                  style: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.onSurface),
                ),
                Divider(color: theme.dividerColor),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              children: List.generate(
                2,
                (index) => Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 60,
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
