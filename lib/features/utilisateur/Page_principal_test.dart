import 'package:flutter/material.dart';

class Main_Page extends StatelessWidget {
  const Main_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page principale'),
      ),
      body: Center(
        child: Text(
          'Bienvenue sur la page principale !',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
