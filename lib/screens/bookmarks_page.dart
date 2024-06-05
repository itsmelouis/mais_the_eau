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
            SizedBox(
              height: 80.0,
              child: TextField(
                style: const TextStyle(fontSize: 14.0),
                decoration: InputDecoration(
                  hintText: 'Rechercher une ville',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(
                        8.0), // Bordure légèrement arrondie
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintStyle: TextStyle(
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.color
                        ?.withOpacity(0.6),
                  ),
                  suffixIcon: Icon(Icons.search,
                      color: Theme.of(context).iconTheme.color),
                ),
              ),
            ),
            const SizedBox(height: 0),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Mes recherches',
                style: TextStyle(fontSize: 24.0), //
              ),
            ),
            const SizedBox(height: 15),
            for (var i = 0; i < 3; i++)
              const Column(
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
                  Divider(color: Colors.grey),
                ],
              ),
            const SizedBox(height: 25),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Mes favoris',
                style: TextStyle(fontSize: 24.0), //
              ),
            ),
            const SizedBox(height: 25),
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: const Color(0xFFedf6f9),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Valenciennes',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '19°C  |  Éclaircies',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/icons/day.png',
                      width: 70,
                      height: 70,
                      color: const Color.fromARGB(255, 0, 111, 166),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
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
