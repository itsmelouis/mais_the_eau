import 'package:flutter/material.dart';

import 'package:mais_the_eau/widgets/weather_detail_widget.dart';

class WeatherDetails extends StatelessWidget {
  final String windSpeed;
  final String windDegree;
  final String pressure;
  final String uvi;
  final String humidity;
  final String clouds;
  final String dewPoint;
  final String windGust;

  const WeatherDetails({
    super.key,
    required this.windSpeed,
    required this.windDegree,
    required this.pressure,
    required this.uvi,
    required this.humidity,
    required this.clouds,
    required this.dewPoint,
    required this.windGust,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 15,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WeatherDetailWidget(
                asset: "assets/icons/windspeed.png",
                value: windSpeed,
                title: "Vitesse du vent",
                isIcon: false,
                icon: const Icon(Icons.add),
              ),
              WeatherDetailWidget(
                asset: "assets/icons/winddegree.png",
                value: windDegree,
                title: "Degrée du vent",
                isIcon: false,
                icon: const Icon(Icons.add),
              ),
              WeatherDetailWidget(
                asset: "assets/icons/pressure.png",
                value: pressure,
                title: "Pression",
                isIcon: false,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WeatherDetailWidget(
                asset: "",
                value: uvi,
                title: "Indice UV",
                isIcon: true,
                icon: const Icon(Icons.sunny),
              ),
              WeatherDetailWidget(
                asset: "assets/icons/humidity.png",
                value: humidity,
                title: "Humidité",
                isIcon: false,
                icon: const Icon(Icons.add),
              ),
              WeatherDetailWidget(
                asset: "assets/icons/clouds.png",
                value: clouds,
                title: "Nuages",
                isIcon: false,
                icon: const Icon(Icons.sunny),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WeatherDetailWidget(
                asset: "",
                value: dewPoint,
                title: "Point de rosée",
                isIcon: true,
                icon: const Icon(Icons.dew_point),
              ),
              WeatherDetailWidget(
                asset: "",
                value: windGust,
                title: "Rafale de vent",
                isIcon: true,
                icon: const Icon(Icons.wind_power_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
