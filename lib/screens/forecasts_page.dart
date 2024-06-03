import 'package:flutter/material.dart';
import 'package:mais_the_eau/navbar/navbar.dart';
import 'package:mais_the_eau/screens/bookmarks_page.dart';
import 'package:mais_the_eau/screens/home_page.dart';
import 'package:mais_the_eau/screens/glossary_page.dart';

class ForecastsPage extends StatefulWidget {
  const ForecastsPage({super.key});

  @override
  State<ForecastsPage> createState() => _ForecastsPageState();
}

class _ForecastsPageState extends State<ForecastsPage> {
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
    const GlossaryPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushReplacementNamed(
        context, ['/', '/forecasts', '/bookmarks', '/glossary'][index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forecasts'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Bookmarks Page!',
          style: Theme.of(context).textTheme.headlineMedium,
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
