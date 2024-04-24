class OpenWeatherAPI {
  String apiKey = 'b31b8b572f8771e623ebfb0a3a60055c';

  String apiUrl(lat, lon) {
    return 'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric';
  }
}
