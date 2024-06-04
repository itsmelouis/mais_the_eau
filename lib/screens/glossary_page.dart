import 'package:flutter/material.dart';
import 'package:mais_the_eau/navbar/navbar.dart';
import 'package:mais_the_eau/screens/bookmarks_page.dart';
import 'package:mais_the_eau/screens/home_page.dart';
import 'package:mais_the_eau/screens/glossary_page.dart';
import 'package:mais_the_eau/screens/forecasts_page.dart';

class GlossaryPage extends StatefulWidget {
  const GlossaryPage({super.key});

  @override
  State<GlossaryPage> createState() => _GlossaryPageState();
}

class _GlossaryPageState extends State<GlossaryPage> {
  int _selectedIndex = 0;

  final List<String> _titles = [
    'Accueil',
    'Prévisions',
    'Favoris',
    'Glossaires'
  ];

  final List<Widget> _pages = [
    const HomePage(),
    const ForecastsPage(),
    const BookmarksPage(),
    const GlossaryPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushReplacementNamed(
        context, ['/', '/forecasts', '/bookmarks', '/glossary'][index]);
  }

  // Créez une liste de données pour vos groupes
  List<Map<String, dynamic>> groupData = [
    {
      'icon': Icons.info,
      'title': 'Petit titre 1',
      'text': 'Texte en dessous 1',
    },
    {
      'icon': Icons.warning,
      'title': 'Petit titre 2',
      'text': 'Texte en dessous 2',
    },
    {
      'icon': Icons.error,
      'title': 'Petit titre 3',
      'text': 'Texte en dessous 3',
    },
    {
      'icon': Icons.help,
      'title': 'Petit titre 4',
      'text': 'Texte en dessous 4',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Glossaire'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Glossaire',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 20), // Espacement entre le titre et l'icône
                for (var group in groupData) // Boucle pour créer les groupes
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 20.0), // Espacement entre les groupes
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          // Cercle qui encadre l'icône
                          child: Icon(group['icon']), // Icône
                          backgroundColor:
                              Colors.grey[200], // Couleur de fond du cercle
                        ),
                        SizedBox(
                            width: 10), // Espacement entre l'icône et le titre
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(group['title'],
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6), // Titre
                            Text(group['text'],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2), // Texte en dessous
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: _selectedIndex,
        items: [
          NavBarItem(
            icon: Icon(Icons.home),
            title: Text('Accueil'),
          ),
          NavBarItem(
            icon: Icon(Icons.cloud),
            title: Text('Prévisions'),
          ),
          NavBarItem(
            icon: Icon(Icons.bookmark),
            title: Text('Favoris'),
          ),
          NavBarItem(
            icon: Icon(Icons.book),
            title: Text('Glossaires'),
          ),
        ],
        onItemSelected: _onItemTapped,
      ),
    );
  }
}
