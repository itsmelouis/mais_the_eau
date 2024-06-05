import 'package:flutter/material.dart';
import 'package:mais_the_eau/widgets/weather_detail_widget.dart';

class RiseSetTimings extends StatelessWidget {
  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;
  final String moonPhase;

  const RiseSetTimings({
    super.key,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Lever/coucher soleil et lune",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WeatherDetailWidget(
                asset: "assets/icons/sunrise.png",
                value: sunrise,
                title: "Levé du soleil",
                isIcon: false,
                icon: const Icon(Icons.co2),
              ),
              WeatherDetailWidget(
                asset: "assets/icons/sunset.png",
                value: sunset,
                title: "Couché du soleil",
                isIcon: false,
                icon: const Icon(Icons.co2),
              ),
              WeatherDetailWidget(
                asset: "assets/icons/moonrise.png",
                value: moonrise,
                title: "Levé de la Lune",
                isIcon: false,
                icon: const Icon(Icons.co2),
              ),
              WeatherDetailWidget(
                asset: "assets/icons/moonset.png",
                value: moonset,
                title: "Couché de la Lune",
                isIcon: false,
                icon: const Icon(Icons.co2),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
