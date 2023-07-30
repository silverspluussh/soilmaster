import 'package:soilmaster/weatherman/models/weather/weatherdata.dart';

class WeatherOutput {
  WeatherOutput({
    required this.temp,
    required this.description,
    required this.date,
    required this.pressure,
    required this.humidity,
    required this.icon,
    required this.tempmin,
    required this.tempmax,
  });

  factory WeatherOutput.from(Weather weather) {
    return WeatherOutput(
        date: DateTime.fromMillisecondsSinceEpoch(weather.dt * 1000),
        temp: Temperature.celsius(weather.weatherParams.temp),
        description: weather.weatherInfo[0].main,
        pressure: weather.weatherParams.pressure.toString(),
        humidity: weather.weatherParams.humidity.toString(),
        tempmin: weather.weatherParams.tempmin.toString(),
        tempmax: weather.weatherParams.tempmax.toString(),
        icon: weather.weatherInfo[0].icon);
  }

  final Temperature temp;
  final String pressure;
  final String humidity;
  final DateTime date;
  final String description;
  final String icon;
  final String tempmax;
  final String tempmin;

  String get iconUrl => "https://openweathermap.org/img/wn/$icon@2x.png";
}
