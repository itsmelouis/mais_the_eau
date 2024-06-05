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
            const SizedBox(height: 0),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Mes recherches',
                style: TextStyle(fontSize: 24.0), //
              ),
            ),
            const SizedBox(height: 15),
            for (var i = 0; i < 3; i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Paris',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14.0,
                        color: Colors.grey, //
                      ),
                    ],
                  ),
                  const Divider(color: Colors.grey),
                ],
              ),
            const SizedBox(height: 25),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Mes favoris',
                style: TextStyle(fontSize: 24.0), //
              ),
            ),
            const SizedBox(height: 25),
            // Ajoutez les deux sections ici
            //
            //

            const SizedBox(height: 10),
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
