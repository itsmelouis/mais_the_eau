import 'package:flutter/material.dart';

class GlossaryWidget extends StatelessWidget {
  final List<GlossaryItem> _glossaryItems = [
    GlossaryItem(
        icon: Icons.wb_sunny,
        title: 'Soleil',
        description: 'Explication du mot Soleil...'),
    // Ajoutez plus d'éléments ici...
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _glossaryItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(_glossaryItems[index].icon),
          title: Text(_glossaryItems[index].title),
          subtitle: Text(_glossaryItems[index].description),
        );
      },
    );
  }
}

class GlossaryItem {
  final IconData icon;
  final String title;
  final String description;

  GlossaryItem(
      {required this.icon, required this.title, required this.description});
}
