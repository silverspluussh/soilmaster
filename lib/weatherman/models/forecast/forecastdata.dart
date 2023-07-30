import 'package:soilmaster/weatherman/models/forecast/forecastmodel.dart';
import '../weather/weathermodel.dart';

class ForecastData {
  const ForecastData(this.list);
  factory ForecastData.from(Forecastmodel fmodel) {
    return ForecastData(
      fmodel.list.map((e) => WeatherOutput.from(e)).toList(),
    );
  }

  final List<WeatherOutput> list;
}
