import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soilmaster/weatherman/models/forecast/forecastdata.dart';
import 'package:soilmaster/weatherman/ui/searchwidget.dart';
import '../repos/weather_repo.dart';
import '../repos/weatherapi_err.dart';

class DailyWeatherController extends StateNotifier<AsyncValue<ForecastData>> {
  DailyWeatherController(this._weatherRepository, {required String city})
      : super(const AsyncValue.loading()) {
    getWeather(city: city);
  }
  final WeatherClientRepo _weatherRepository;

  Future<void> getWeather({required String city}) async {
    try {
      state = const AsyncValue.loading();
      final forecast = await _weatherRepository.getForecast(city: city);
      state = AsyncValue.data(ForecastData.from(forecast));
    } on WeatherApiErr catch (e) {
      state = e.asyncValue();
    }
  }
}

final dailyWeatherControllerProvider = StateNotifierProvider.autoDispose<
    DailyWeatherController, AsyncValue<ForecastData>>((ref) {
  final weatherRepository = ref.watch(weatherrepoprovider);
  final city = ref.watch(cityProvider);
  return DailyWeatherController(weatherRepository, city: city);
});
