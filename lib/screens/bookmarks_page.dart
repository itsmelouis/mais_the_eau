import 'package:flutter/material.dart';


class BookmarksPage extends StatefulWidget {
  const BookmarksPage({super.key});

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favoris',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24, // Smaller font size
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Welcome to the Bookmarks Page!',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
