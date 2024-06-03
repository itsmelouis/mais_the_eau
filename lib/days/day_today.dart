import 'package:flutter/material.dart';
import 'package:mais_the_eau/widgets/daily_summary.dart';
import 'package:mais_the_eau/widgets/frosted_glass.dart'; // Assurez-vous que le nom du fichier correspond à celui de votre projet
import 'package:mais_the_eau/widgets/hourly_weather.dart';
import 'package:mais_the_eau/widgets/other_temps.dart';
import 'package:mais_the_eau/widgets/rise_set_timings.dart';
import 'package:mais_the_eau/widgets/weather_detail_current.dart';

class DayToday extends StatelessWidget {
  final String windSpeed;
  final String windDegree;
  final String pressure;
  final String uvi;
  final String humidity;
  final String visibility;
  final String temp;
  final String tempMin;
  final String tempMax;
  final String icon;
  final String description;
  final String summary;
  final String clouds;
  final String dewPoint;
  final String windGust;

  final String morningTemp;
  final String dayTemp;
  final String eveningTemp;
  final String nightTemp;

  final int length;

  final List<String> hourlyList;
  final List<String> hourlyIconList;
  final List<String> hourlyTempList;

  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;
  final String moonPhase;

  final DateTime date; // Ajout de l'argument 'date'
  final String location; // Ajout de l'argument 'location'

  const DayToday({
    super.key,
    required this.windSpeed,
    required this.windDegree,
    required this.pressure,
    required this.uvi,
    required this.humidity,
    required this.visibility,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.icon,
    required this.description,
    required this.summary,
    required this.clouds,
    required this.dewPoint,
    required this.windGust,
    required this.morningTemp,
    required this.dayTemp,
    required this.eveningTemp,
    required this.nightTemp,
    required this.length,
    required this.hourlyList,
    required this.hourlyIconList,
    required this.hourlyTempList,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.date, // Initialisation de l'argument 'date'
    required this.location, // Initialisation de l'argument 'location'
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FrostedGlassDate(
              tempMin: tempMin,
              tempMax: tempMax,
              icon: icon,
              description: description,
              date: date, // Passage de l'argument 'date'
              location: location, // Passage de l'argument 'location'
            ),
            DailySummary(
              summary: summary,
            ),
            OtherTemps(
              morningTemp: morningTemp,
              dayTemp: dayTemp,
              eveningTemp: eveningTemp,
              nightTemp: nightTemp,
            ),
            WeatherDetailsCurrent(
              windSpeed: windSpeed,
              windDegree: windDegree,
              pressure: pressure,
              uvi: uvi,
              humidity: humidity,
              visibility: visibility,
              clouds: clouds,
              dewPoint: dewPoint,
              windGust: windGust,
            ),
            HourlyWeather(
              length: length,
              hourlyList: hourlyList,
              hourlyIconList: hourlyIconList,
              hourlyTempList: hourlyTempList,
            ),
            RiseSetTimings(
              sunrise: sunrise,
              sunset: sunset,
              moonrise: moonrise,
              moonset: moonset,
              moonPhase: moonPhase,
            ),
          ],
        ),
      ),
    );
  }
}
