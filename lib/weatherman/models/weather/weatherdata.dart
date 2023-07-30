// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'weatherdata.freezed.dart';
part 'weatherdata.g.dart';

@freezed
class WeatherParams with _$WeatherParams {
  factory WeatherParams({
    required double temp,
    required double pressure,
    required double humidity,
    @JsonKey(name: 'temp_min') required double tempmin,
    @JsonKey(name: 'temp_max') required double tempmax,
  }) = _WeatherParams;

  factory WeatherParams.fromJson(Map<String, dynamic> json) =>
      _$WeatherParamsFromJson(json);
}

@freezed
class WeatherInfo with _$WeatherInfo {
  factory WeatherInfo({
    required String main,
    required String description,
    required String icon,
  }) = _WeatherInfo;

  factory WeatherInfo.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoFromJson(json);
}

@freezed
class Weather with _$Weather {
  factory Weather({
    @JsonKey(name: 'main') required WeatherParams weatherParams,
    @JsonKey(name: 'weather') required List<WeatherInfo> weatherInfo,
    required int dt,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

///

class Temperature {
  Temperature.celsius(this.celsius);
  factory Temperature.farhenheit(double farhenheit) =>
      Temperature.celsius((farhenheit - 32) / 1.8);
  factory Temperature.kelvin(double kelvin) =>
      Temperature.celsius(kelvin - absoluteZero);

  static double absoluteZero = 273.15;

  final double celsius;
  double get farhenheit => celsius * 1.8 + 32;
}
