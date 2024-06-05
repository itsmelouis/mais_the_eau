import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mais_the_eau/models/weahter_data.dart';

class WeeklyForecast extends StatelessWidget {
  final WeatherData? weatherData;
  final String location;

  const WeeklyForecast({
    Key? key,
    required this.weatherData,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "Prévisions pour la semaine - $location",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: weatherData?.getDailyWeather().daily.length ?? 0,
          itemBuilder: (context, index) {
            final daily = weatherData!.getDailyWeather().daily[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Row(
                  children: [
                    // Icône météo à gauche
                    Image.asset(
                      "assets/weather/${daily.weather?[0].icon ?? 'unknown'}.png",
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(width: 10),

                    // Date et description au milieu
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat('EEE d MMM yyyy', 'fr').format(
                              DateTime.fromMillisecondsSinceEpoch(
                                  (daily.dt ?? 0) * 1000),
                            ),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            daily.weather?[0].description ?? 'N/A',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),

                    // Températures min et max à droite
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Min: ${daily.temp?.min?.round() ?? 'N/A'}°",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Max: ${daily.temp?.max?.round() ?? 'N/A'}°",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
