import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/weather/weathermodel.dart';
import '../repos/weather_repo.dart';
import '../repos/weatherapi_err.dart';
import '../ui/searchwidget.dart';

class CurrentWeatherController
    extends StateNotifier<AsyncValue<WeatherOutput>> {
  CurrentWeatherController(this._weatherRepository, {required this.city})
      : super(const AsyncValue.loading()) {
    getWeather(city: city);
  }
  final WeatherClientRepo _weatherRepository;
  final String city;

  Future<void> getWeather({required String city}) async {
    try {
      state = const AsyncValue.loading();
      final weather = await _weatherRepository.getWeather(city: city);
      state = AsyncValue.data(WeatherOutput.from(weather));
    } on WeatherApiErr catch (e) {
      state = e.asyncValue();
    }
  }
}

final currentWeatherControllerProvider = StateNotifierProvider.autoDispose<
    CurrentWeatherController, AsyncValue<WeatherOutput>>((ref) {
  final weatherRepository = ref.watch(weatherrepoprovider);
  final city = ref.watch(cityProvider);
  return CurrentWeatherController(weatherRepository, city: city);
});

final searchweathercontroller1 = StateNotifierProvider.autoDispose<
    CurrentWeatherController, AsyncValue<WeatherOutput>>((ref) {
  final weatherRepository = ref.watch(weatherrepoprovider);
  return CurrentWeatherController(weatherRepository, city: 'Helsinki');
});

final searchweathercontroller2 = StateNotifierProvider.autoDispose<
    CurrentWeatherController, AsyncValue<WeatherOutput>>((ref) {
  final weatherRepository = ref.watch(weatherrepoprovider);
  return CurrentWeatherController(weatherRepository, city: 'New York');
});
final searchweathercontroller3 = StateNotifierProvider.autoDispose<
    CurrentWeatherController, AsyncValue<WeatherOutput>>((ref) {
  final weatherRepository = ref.watch(weatherrepoprovider);
  return CurrentWeatherController(weatherRepository, city: 'Hong Kong');
});

final searchweathercontroller4 = StateNotifierProvider.autoDispose<
    CurrentWeatherController, AsyncValue<WeatherOutput>>((ref) {
  final weatherRepository = ref.watch(weatherrepoprovider);
  return CurrentWeatherController(weatherRepository, city: 'Lagos');
});
