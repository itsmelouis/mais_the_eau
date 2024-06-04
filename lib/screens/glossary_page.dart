import 'package:flutter/material.dart';

class GlossaryPage extends StatefulWidget {
  const GlossaryPage({super.key});

  @override
  State<GlossaryPage> createState() => _GlossaryPageState();
}

class _GlossaryPageState extends State<GlossaryPage> {
  List<Map<String, dynamic>> groupData = [
    {
      'icon': 'assets/icons/sunset.png',
      'title': 'Coucher du soleil',
      'text': "Le moment où le soleil disparaît sous l'horizon le soir.",
    },
    {
      'icon': 'assets/icons/sunrise.png',
      'title': 'Lever du soleil',
      'text': "Le moment où le soleil apparaît à l'horizon le matin.",
    },
    {
      'icon': 'assets/icons/pressure.png',
      'title': 'Pression atmosphérique',
      'text': "Le poids de l'air sur une surface donnée en hPa.",
    },
    {
      'icon': 'assets/icons/humidity.png',
      'title': 'Humidité',
      'text':
          "La quantité de vapeur d' 'eau présente dans l'air en pourcentage.",
    },
    {
      'icon': 'assets/icons/clouds.png',
      'title': 'Nuages ',
      'text': 'La quantité de ciel couverte par des nuages en pourcentage.',
    },
    {
      'icon': 'assets/icons/moonrise.png',
      'title': "Lever de la lune",
      'text': "Le moment où la lune apparaît à l'horizon.",
    },
    {
      'icon': 'assets/icons/moonset.png',
      'title': 'Coucher de la lune',
      'text': "Le moment où la lune disparaît sous l'horizon.",
    },
    {
      'icon': 'assets/icons/winddegree.png',
      'title': 'Direction du vent',
      'text': 'L'
          'angle indiquant d'
          'où vient le vent sur une boussole en degrés.',
    },
    {
      'icon': 'assets/icons/windspeed.png',
      'title': 'Vitesse du vent',
      'text': 'La rapidité à laquelle le vent souffle en m/s.',
    },
  ];

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
      body: SingleChildScrollView(
        child: Padding(
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
                              radius: 30.0,
                              child: SizedBox(
                                width: 30.0,
                                height: 30.0,
                                child: Image.asset(
                                  group['icon'],
                                  color: Colors.white,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              backgroundColor:
                                  Color.fromARGB(255, 60, 145, 156),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            10.0), // Ajoutez un espace au-dessus
                                    child: Text(
                                      group['title'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge,
                                    ),
                                  ),
                                  Text(
                                    group['text'],
                                    style: TextStyle(
                                      fontSize:
                                          16.0, // Changez cette valeur pour ajuster la taille du texte
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
