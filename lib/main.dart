import 'package:flutter/material.dart';
import 'package:mais_the_eau/screens/home_page.dart';
import 'package:mais_the_eau/screens/forecasts_page.dart';
import 'package:mais_the_eau/screens/bookmarks_page.dart';
import 'package:mais_the_eau/screens/glossary_page.dart';
import 'package:mais_the_eau/theme/app_theme.dart';

void main() {
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
      home: const HomePage(),
      routes: {
        '/forecasts': (context) => const ForecastsPage(),
        '/bookmarks': (context) => const BookmarksPage(),
        '/glossary': (context) => const GlossaryPage(),
      },
    );
  }
}
