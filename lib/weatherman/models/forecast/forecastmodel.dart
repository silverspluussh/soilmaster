library forecast;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../weather/weatherdata.dart';
part 'forecastmodel.g.dart';
part 'forecastmodel.freezed.dart';

@freezed
class Forecastmodel with _$Forecastmodel {
  factory Forecastmodel({
    required List<Weather> list,
  }) = _Forecastmodel;

  factory Forecastmodel.fromJson(Map<String, dynamic> json) =>
      _$ForecastmodelFromJson(json);
}
