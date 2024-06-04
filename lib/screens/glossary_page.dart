import 'package:flutter/material.dart';

class GlossaryPage extends StatefulWidget {
  const GlossaryPage({super.key});

  @override
  State<GlossaryPage> createState() => _GlossaryPageState();
}

class _GlossaryPageState extends State<GlossaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Glossaire',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24, // Smaller font size
          ),
        ),
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
    );
  }
}
