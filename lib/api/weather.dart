import 'package:flutter_dotenv/flutter_dotenv.dart';


class OpenWeatherAPI {
  String apiKey = dotenv.env['API_KEY']!;

  String apiUrl(lat, lon) {
    return 'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric';
  }
}
