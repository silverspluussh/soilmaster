import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:soilmaster/weathermanapi/openkeys.dart';
import 'package:soilmaster/weatherman/models/forecast/forecastmodel.dart';
import '../models/weather/weatherdata.dart';
import '../../weathermanapi/weatherapi.dart';
import 'weatherapi_err.dart';

class WeatherClientRepo {
  WeatherClientRepo({
    required this.client,
    required this.api,
  });

  final http.Client client;
  final OpenWeatherMapAPI api;

  Future<Forecastmodel> getForecast({required String city}) => _getData(
        uri: api.forecast(city),
        builder: (data) => Forecastmodel.fromJson(data),
      );

  Future<Weather> getWeather({required String city}) => _getData(
        uri: api.weather(city),
        builder: (data) => Weather.fromJson(data),
      );

  Future<T> _getData<T>({
    required Uri uri,
    required T Function(dynamic data) builder,
  }) async {
    try {
      final response = await client.get(uri);
      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return builder(data);
        case 401:
          throw const WeatherApiErr.invalidapikey();
        case 404:
          throw const WeatherApiErr.notfound();
        default:
          throw const WeatherApiErr.unknown();
      }
    } on SocketException catch (_) {
      throw const WeatherApiErr.nointernet();
    }
  }
}

final weatherrepoprovider = Provider<WeatherClientRepo>((ref) {
  const apikey =
      String.fromEnvironment('API_KEY', defaultValue: Apikeys.openweatherkeys);

  return WeatherClientRepo(
    api: OpenWeatherMapAPI(apikey),
    client: http.Client(),
  );
});
