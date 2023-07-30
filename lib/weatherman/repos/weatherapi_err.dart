import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weatherapi_err.freezed.dart';

@Freezed()
class WeatherApiErr with _$WeatherApiErr {
  const factory WeatherApiErr.invalidapikey() = _Invalidapikey;
  const factory WeatherApiErr.nointernet() = _NoInternet;
  const factory WeatherApiErr.notfound() = _NotFound;
  const factory WeatherApiErr.unknown() = _Unknown;
}

extension WeatherErrorAsync on WeatherApiErr {
  AsyncValue<T> asyncValue<T>() => when(
      invalidapikey: () =>
          const AsyncValue.error('Invalid api key', StackTrace.empty),
      nointernet: () =>
          const AsyncValue.error('No internet connection', StackTrace.empty),
      notfound: () =>
          const AsyncValue.error('City not found', StackTrace.empty),
      unknown: () => const AsyncValue.error(
          'an unfamiliar error occurred', StackTrace.empty));
}
