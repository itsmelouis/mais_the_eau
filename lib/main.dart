import 'package:flutter/material.dart';
import 'package:mais_the_eau/screens/home_page.dart';
import 'package:mais_the_eau/screens/second_page.dart';
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
        '/second': (context) => const SecondPage(),
      },
    );
  }
}
