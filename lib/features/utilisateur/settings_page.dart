import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _selectedTheme = 'Normal';
  double _fontSize = 16.0;
  bool _autoDarkMode = false;
  bool _notificationsEnabled = true;

  final List<String> _themes = [
    'Normal',
    'Light',
    'Dark',
    'Daltonien (Deuteranopie)',
    'Daltonien (Protanopie)',
    'Daltonien (Tritanopie)',
    'Noir et Blanc'
  ];

  void _changeTheme(String theme) {
    setState(() {
      _selectedTheme = theme;
      Provider.of<ThemeProvider>(context, listen: false).setTheme(theme);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Thème de l\'application',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedTheme,
              items: _themes.map((theme) {
                return DropdownMenuItem<String>(
                  value: theme,
                  child: Text(theme),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  _changeTheme(value);
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Taille de la police',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _fontSize,
              min: 12.0,
              max: 24.0,
              divisions: 6,
              label: '$_fontSize',
              onChanged: (value) {
                setState(() {
                  _fontSize = value;
                });
              },
            ),
            const SizedBox(height: 20),
            SwitchListTile(
              title: const Text('Mode sombre automatique'),
              value: _autoDarkMode,
              onChanged: (value) {
                setState(() {
                  _autoDarkMode = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Notifications activées'),
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
