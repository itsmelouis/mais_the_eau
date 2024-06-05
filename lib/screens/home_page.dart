import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mais_the_eau/api/weather.dart';
import 'package:mais_the_eau/models/weahter_data.dart';
import 'package:mais_the_eau/screens/bookmarks_page.dart';
import 'package:mais_the_eau/widgets/daily_summary.dart';
import 'package:mais_the_eau/widgets/frosted_glass_current.dart';
import 'package:mais_the_eau/widgets/frosted_glass.dart';
import 'package:mais_the_eau/widgets/hourly_weather.dart';
import 'package:mais_the_eau/widgets/loader.dart';
import 'package:mais_the_eau/widgets/other_temps.dart';
import 'package:mais_the_eau/widgets/rise_set_timings.dart';
import 'package:mais_the_eau/widgets/weekly_weather.dart';
import 'package:mais_the_eau/widgets/weather_detail_current.dart';
import 'package:mais_the_eau/widgets/weather_details.dart';
import 'package:mais_the_eau/widgets/weekly_forecast.dart';
import 'package:mais_the_eau/tabs/tabs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String location = "Your Location";
  String? error;

  double lat = 0.0;
  double lon = 0.0;

  List dates = [];
  List<String> days = [];

  List<String> hourlyTime = [];
  List<String> hourlyTemp = [];
  List<String> hourlyIcon = [];

  List<String> dailyIcons = [];
  List<String> dailyTemps = [];

  bool isLoading = true;
  bool isError = false;

  WeatherData? weatherData;

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        isError = true;
        error =
            "Location services are disabled & then restart the application!";
      });
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      lat = value.latitude;
      lon = value.longitude;
      getCityName();
      getWeatherData(latitude: lat, longitude: lon);
      return value;
    });
  }

  getCityName() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemarks[0];
    setState(() {
      location = "${place.locality}";
    });
  }

  getWeatherData({required double latitude, required double longitude}) async {
    try {
      final response = await http
          .get(Uri.parse(OpenWeatherAPI().apiUrl(latitude, longitude)));
      if (response.statusCode == 200) {
        var jsonString = jsonDecode(response.body);
        weatherData = WeatherData(
          WeatherDataCurrent.fromJson(jsonString),
          WeatherDataHourly.fromJson(jsonString),
          WeatherDataDaily.fromJson(jsonString),
        );
        getDaysAndDates();
        getHourlyTime();
        getHourlyData();
        getDailyData();
        setState(() {
          isLoading = false;
        });
        return weatherData;
      } else {
        return "Error";
      }
    } catch (e) {
      return e.toString();
    }
  }

  searchCityWeather(String cityName) async {
    try {
      List<Location> locations = await locationFromAddress(cityName);
      if (locations.isNotEmpty) {
        double latitude = locations[0].latitude;
        double longitude = locations[0].longitude;
        getWeatherData(latitude: latitude, longitude: longitude);
        setState(() {
          location = cityName;
        });
      }
    } catch (e) {
      setState(() {
        error = "City not found!";
      });
    }
  }

  getDaysAndDates() {
    for (int i = 0; i < weatherData!.getDailyWeather().daily.length; i++) {
      getDay(weatherData?.getDailyWeather().daily[i].dt);
      getDate(weatherData?.getDailyWeather().daily[i].dt);
    }
  }

  getHourlyTime() {
    for (int i = 0; i < weatherData!.getHourlyWeather().hourly.length; i++) {
      getHours(weatherData?.getHourlyWeather().hourly[i].dt);
    }
  }

  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final dayName = DateFormat('EEEE').format(time);
    days.add(dayName);
    return dayName;
  }

  String getDate(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final date = DateFormat('dd/MM').format(time);
    dates.add(date);
    return date;
  }

  String getTime(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final hourTime = DateFormat('HH:mm', 'fr').format(time);
    return hourTime;
  }

  getHours(final day) {
    hourlyTime.add(getTime(day));
  }

  getHourlyData() {
    for (int i = 0; i < weatherData!.getHourlyWeather().hourly.length; i++) {
      hourlyTemp.add(
          weatherData!.getHourlyWeather().hourly[i].temp!.round().toString());
      hourlyIcon.add(weatherData!
          .getHourlyWeather()
          .hourly[i]
          .weather![0]
          .icon
          .toString());
    }
  }

  getDailyData() {
    for (int i = 0; i < weatherData!.getDailyWeather().daily.length; i++) {
      dailyTemps.add(weatherData!
          .getDailyWeather()
          .daily[i]
          .temp!
          .day!
          .round()
          .toString());
      dailyIcons.add(
          weatherData!.getDailyWeather().daily[i].weather![0].icon.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loader(error: error, isError: isError)
        : DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                        height: 8), // Add some space between text and row
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            onSubmitted: (value) {
                              if (value.isNotEmpty) {
                                searchCityWeather(value);
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Rechercher une ville',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.color
                                    ?.withOpacity(0.6),
                              ),
                            ),
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyLarge?.color,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.search,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          color: Theme.of(context).iconTheme.color,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BookmarksPage()),
                            );
                          },
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
                centerTitle: true,
                backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                bottom: TabBar(
                  isScrollable: true,
                  automaticIndicatorColorAdjustment: true,
                  indicator: Theme.of(context).tabBarTheme.indicator,
                  tabs: const [
                    Tabs(
                      text: "Accueil",
                    ),
                    Tabs(
                      text: "Prévisions du jour",
                    ),
                    Tabs(
                      text: "Demain",
                    ),
                    Tabs(
                      text: "Semaine",
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  // Accueil Tab
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        FrostedGlassCurrent(
                          temp: weatherData
                                  ?.getCurrentWeather()
                                  .current
                                  .temp!
                                  .round()
                                  .toString() ??
                              '',
                          icon: weatherData
                                  ?.getCurrentWeather()
                                  .current
                                  .weather![0]
                                  .icon
                                  .toString() ??
                              '',
                          description: weatherData
                                  ?.getCurrentWeather()
                                  .current
                                  .weather![0]
                                  .description
                                  .toString() ??
                              '',
                          location: location.isNotEmpty ? location : 'Inconnu',
                        ),
                        WeeklyWeather(
                          length:
                              weatherData?.getDailyWeather().daily.length ?? 0,
                          dayList: days,
                          iconList: dailyIcons,
                          tempList: dailyTemps,
                        ),
                      ],
                    ),
                  ),
                  // Prévisions du jour Tab
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        FrostedGlassCurrent(
                          temp: weatherData
                                  ?.getCurrentWeather()
                                  .current
                                  .temp!
                                  .round()
                                  .toString() ??
                              '',
                          icon: weatherData
                                  ?.getCurrentWeather()
                                  .current
                                  .weather![0]
                                  .icon
                                  .toString() ??
                              '',
                          description: weatherData
                                  ?.getCurrentWeather()
                                  .current
                                  .weather![0]
                                  .description
                                  .toString() ??
                              '',
                          location: location.isNotEmpty ? location : 'Inconnu',
                        ),
                        WeatherDetailsCurrent(
                          windSpeed:
                              "${weatherData?.getCurrentWeather().current.windSpeed.toString() ?? ''} m/s",
                          windDegree:
                              '${weatherData?.getCurrentWeather().current.windDeg.toString()}°',
                          pressure:
                              '${weatherData?.getCurrentWeather().current.pressure.toString()} hPa',
                          uvi: weatherData
                                  ?.getCurrentWeather()
                                  .current
                                  .uvi
                                  .toString() ??
                              '',
                          humidity:
                              '${weatherData?.getCurrentWeather().current.humidity.toString()}%',
                          visibility:
                              '${(weatherData!.getCurrentWeather().current.visibility! / 1000).round().toString()} KM',
                          clouds:
                              "${weatherData?.getCurrentWeather().current.clouds.toString()}%",
                          dewPoint:
                              "${weatherData?.getCurrentWeather().current.dewPoint.toString()}°",
                          windGust:
                              "${weatherData?.getDailyWeather().daily[0].windGust?.round().toString()} m/s",
                        ),
                        HourlyWeather(
                          length:
                              weatherData?.getHourlyWeather().hourly.length ??
                                  0,
                          hourlyList: hourlyTime,
                          hourlyIconList: hourlyIcon,
                          hourlyTempList: hourlyTemp,
                        ),
                        OtherTemps(
                          morningTemp:
                              "${weatherData?.getDailyWeather().daily[0].temp?.morn!.round().toString()}",
                          dayTemp:
                              "${weatherData?.getDailyWeather().daily[0].temp?.day!.round().toString()}",
                          eveningTemp:
                              "${weatherData?.getDailyWeather().daily[0].temp?.eve!.round().toString()}",
                          nightTemp:
                              "${weatherData?.getDailyWeather().daily[0].temp?.night!.round().toString()}",
                        ),
                        RiseSetTimings(
                          sunrise: getTime(
                              weatherData?.getDailyWeather().daily[0].sunrise),
                          sunset: getTime(
                              weatherData?.getDailyWeather().daily[0].sunset),
                          moonrise: getTime(
                              weatherData?.getDailyWeather().daily[0].moonrise),
                          moonset: getTime(
                              weatherData?.getDailyWeather().daily[0].moonset),
                          moonPhase: weatherData
                                  ?.getDailyWeather()
                                  .daily[0]
                                  .moonPhase
                                  .toString() ??
                              '',
                        ),
                      ],
                    ),
                  ),
                  // Demain Tab
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        FrostedGlassDate(
                          tempMin: weatherData
                                  ?.getDailyWeather()
                                  .daily[1]
                                  .temp
                                  ?.min!
                                  .round()
                                  .toString() ??
                              '',
                          tempMax: weatherData
                                  ?.getDailyWeather()
                                  .daily[1]
                                  .temp
                                  ?.max!
                                  .round()
                                  .toString() ??
                              '',
                          icon: weatherData
                                  ?.getDailyWeather()
                                  .daily[1]
                                  .weather![0]
                                  .icon
                                  .toString() ??
                              '',
                          description: weatherData
                                  ?.getDailyWeather()
                                  .daily[1]
                                  .weather![0]
                                  .description
                                  .toString() ??
                              '',
                          date: DateTime.now()
                              .add(Duration(days: 1)), // Date de demain
                          location: location.isNotEmpty ? location : 'Inconnu',
                        ),
                        WeatherDetails(
                          windSpeed:
                              "${weatherData?.getDailyWeather().daily[1].windSpeed.toString()} m/s",
                          windDegree:
                              '${weatherData?.getDailyWeather().daily[1].windDeg.toString()}°',
                          pressure:
                              '${weatherData?.getDailyWeather().daily[1].pressure.toString()} hPa',
                          uvi: weatherData
                                  ?.getDailyWeather()
                                  .daily[1]
                                  .uvi
                                  .toString() ??
                              '',
                          humidity:
                              '${weatherData?.getDailyWeather().daily[1].humidity.toString()}%',
                          clouds:
                              "${weatherData?.getDailyWeather().daily[1].clouds.toString()}%",
                          dewPoint:
                              "${weatherData?.getDailyWeather().daily[1].dewPoint.toString()}°",
                          windGust:
                              "${weatherData?.getDailyWeather().daily[1].windGust?.round().toString()} m/s",
                        ),
                        HourlyWeather(
                          length:
                              weatherData?.getHourlyWeather().hourly.length ??
                                  0,
                          hourlyList: hourlyTime,
                          hourlyIconList: hourlyIcon,
                          hourlyTempList: hourlyTemp,
                        ),
                        OtherTemps(
                          morningTemp:
                              "${weatherData?.getDailyWeather().daily[1].temp?.morn!.round().toString()}",
                          dayTemp:
                              "${weatherData?.getDailyWeather().daily[1].temp?.day!.round().toString()}",
                          eveningTemp:
                              "${weatherData?.getDailyWeather().daily[1].temp?.eve!.round().toString()}",
                          nightTemp:
                              "${weatherData?.getDailyWeather().daily[1].temp?.night!.round().toString()}",
                        ),
                        RiseSetTimings(
                          sunrise: getTime(
                              weatherData?.getDailyWeather().daily[1].sunrise),
                          sunset: getTime(
                              weatherData?.getDailyWeather().daily[1].sunset),
                          moonrise: getTime(
                              weatherData?.getDailyWeather().daily[1].moonrise),
                          moonset: getTime(
                              weatherData?.getDailyWeather().daily[1].moonset),
                          moonPhase: weatherData
                                  ?.getDailyWeather()
                                  .daily[1]
                                  .moonPhase
                                  .toString() ??
                              '',
                        ),
                      ],
                    ),
                  ),
                  // Semaine Tab
                  SingleChildScrollView(
                    child: WeeklyForecast(
                      weatherData: weatherData,
                      location: location.isNotEmpty ? location : 'Inconnu',
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
