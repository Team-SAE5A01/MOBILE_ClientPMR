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

  final List<String> _themes = [
    'Normal',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
          ],
        ),
      ),
    );
  }
}
