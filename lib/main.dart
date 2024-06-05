import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mais_the_eau/screens/home_page.dart';
import 'package:mais_the_eau/screens/bookmarks_page.dart';
import 'package:mais_the_eau/screens/glossary_page.dart';
import 'package:mais_the_eau/screens/settings_page.dart';
import 'package:mais_the_eau/theme/app_theme.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() async {

  // Assurez-vous que les widgets Flutter sont initialisés
  WidgetsFlutterBinding.ensureInitialized();

  // Initialisez les données de localisation pour la langue française
  await initializeDateFormatting('fr', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const BookmarksPage(),
    const GlossaryPage(),
    const SettingsPage(),
  ];

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
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.cloud),
            title: Text("Prévisions"),
            selectedColor: Theme.of(context).iconTheme.color,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text("Favoris"),
            selectedColor: Theme.of(context).iconTheme.color,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.book),
            title: Text("Glossaire"),
            selectedColor: Theme.of(context).iconTheme.color,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.settings),
            title: Text("Paramètres"),
            selectedColor: Theme.of(context).iconTheme.color,
          ),
        ],
      ),
    );
  }
}
