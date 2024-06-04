import 'package:flutter/material.dart';

class GlossaryPage extends StatefulWidget {
  const GlossaryPage({super.key});

  @override
  State<GlossaryPage> createState() => _GlossaryPageState();
}

class _GlossaryPageState extends State<GlossaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Glossaire',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24, // Smaller font size
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Welcome to the glossary Page!',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
