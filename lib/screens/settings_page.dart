import 'package:flutter/material.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Paramètres',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24, // Smaller font size
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Bienvenue dans les paramètres !',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
