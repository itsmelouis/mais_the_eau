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
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 25.0),
        child: Column(
          children: [
            Container(
              height: 80.0,
              child: TextField(
                style: TextStyle(fontSize: 14.0),
                decoration: InputDecoration(
                  labelText: 'Recherche une ville',
                  labelStyle: TextStyle(fontSize: 14.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 1),

            Align(
              alignment: Alignment.centerLeft,
              child: const Text('Mes recherches'),
            ),
            for (var i = 0; i < 3; i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Paris'),
                      const Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                  const Divider(color: Colors.grey),
                ],
              ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text('Mes favoris'),
            ),
            const SizedBox(height: 10),
            // Ajoutez vos deux sections ici
            const SizedBox(height: 10),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.grey,
            ),
            const SizedBox(height: 10),
            const Center(child: Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}
