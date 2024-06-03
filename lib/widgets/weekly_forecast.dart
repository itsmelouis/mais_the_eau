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
          padding: const EdgeInsets.symmetric(vertical: 10),
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
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: ListTile(
                leading: Image.asset(
                  "assets/weather/${daily.weather?[0].icon ?? 'unknown'}.png",
                  width: 50,
                  height: 50,
                ),
                title: Text(
                  DateFormat('EEEE, dd MMM').format(
                    DateTime.fromMillisecondsSinceEpoch((daily.dt ?? 0) * 1000),
                  ),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                subtitle: Text(
                  daily.weather?[0].description ?? 'N/A',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Min: ${daily.temp?.min?.round() ?? 'N/A'}°",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      "Max: ${daily.temp?.max?.round() ?? 'N/A'}°",
                      style: Theme.of(context).textTheme.bodyMedium,
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
