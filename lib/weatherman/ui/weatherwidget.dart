import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:soilmaster/constants/colors.dart';
import 'package:soilmaster/constants/data.dart';
import 'package:soilmaster/weatherman/providers/currentweatheroller.dart';
import 'package:soilmaster/weatherman/providers/dailyweatheroller.dart';
import 'package:soilmaster/weatherman/ui/searchwidget.dart';
import 'package:soilmaster/src/widgets/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/weather/weathermodel.dart';

class WeatherWidget extends ConsumerWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final weatherdata = ref.watch(currentWeatherControllerProvider);

    return weatherdata.when(
      data: (weatherdata) => WeatherCard(size: size, weather: weatherdata),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => ShimmerWidget.rectangular(height: size.height * 0.13),
    );
  }
}

class WeatherCard extends ConsumerWidget {
  const WeatherCard({
    super.key,
    required this.size,
    required this.weather,
  });

  final Size size;
  final WeatherOutput weather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final city = ref.watch(cityProvider);

    return Container(
      height: size.height * 0.24,
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kPrimaryColor.withOpacity(0.4)),
      child: VStack(
        [
          const Spacer(),
          HStack([
            const Icon(Icons.location_on, size: 20, color: kBlueColor),
            const SizedBox(width: 10),
            Text(
              city.capitalized,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ]),
          const Spacer(),
          SizedBox(
            child: HStack(
              [
                const Spacer(),
                WeatherIcon(
                  size: 100,
                  url: weather.iconUrl,
                  color: const Color.fromARGB(255, 205, 193, 193),
                ),
                const Spacer(),
                Text(
                  '${weather.temp.celsius.toInt().toString()} °',
                  style: const TextStyle(
                      fontFamily: 'Go',
                      fontWeight: FontWeight.w600,
                      color: kWhiteColor,
                      fontSize: 24),
                ),
                const Spacer(),
              ],
              alignment: MainAxisAlignment.center,
              crossAlignment: CrossAxisAlignment.start,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Image.asset('assets/weatherassets/weather-46-32.png',
                  width: 18, height: 18),
              const SizedBox(width: 10),
              Text(
                weather.description,
                style: const TextStyle(
                    fontFamily: 'Go',
                    fontWeight: FontWeight.w300,
                    color: kBlackColor,
                    fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 17),
              const SizedBox(width: 10),
              Text(
                DateFormat.yMMMMd().format(weather.date),
                style: const TextStyle(
                    fontFamily: 'Go',
                    fontWeight: FontWeight.w300,
                    color: kBlackColor,
                    fontSize: 13),
              ),
            ],
          ),
          const Spacer(),
        ],
        alignment: MainAxisAlignment.center,
        crossAlignment: CrossAxisAlignment.start,
      ).p12(),
    );
  }
}

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({
    super.key,
    required this.url,
    required this.size,
    required this.color,
  });

  final String url;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: size,
      height: size,
      color: color,
      alignment: Alignment.center,
    );
  }
}

class Weatherinfocard extends ConsumerWidget {
  const Weatherinfocard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final weatherdata = ref.watch(currentWeatherControllerProvider);

    return weatherdata.when(
      data: (weatherdata) => Container(
        height: size.height * 0.13,
        width: size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kPrimaryColor.withOpacity(0.4)),
        child: HStack(
          [
            const Spacer(),
            unitscard(context,
                read: '${weatherdata.pressure}  hPa',
                title: 'Pressure',
                icon: presicon),
            const Spacer(),
            Image.asset(vertdivider),
            const Spacer(),
            unitscard(context,
                read: '${weatherdata.temp.celsius.toInt()} °'.toString(),
                title: 'Temp',
                icon: tempicon),
            const Spacer(),
            Image.asset(vertdivider),
            const Spacer(),
            unitscard(context,
                read: '${weatherdata.humidity}  %',
                title: 'Humidity',
                icon: humidicon),
            const Spacer(),
          ],
          alignment: MainAxisAlignment.center,
        ),
      ),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => ShimmerWidget.rectangular(height: size.height * 0.13),
    );
  }

  unitscard(BuildContext context,
      {required title, required read, required icon}) {
    return VStack(
      crossAlignment: CrossAxisAlignment.center,
      [
        Image.asset(icon, width: 25, height: 25),
        Text(
          title,
          style: const TextStyle(
              fontFamily: 'Go',
              fontWeight: FontWeight.w300,
              color: kBlackColor,
              fontSize: 12),
        ),
        Text(
          read,
          style: const TextStyle(
              fontFamily: 'Go',
              fontWeight: FontWeight.w300,
              color: kBlackColor,
              fontSize: 13),
        )
      ],
    );
  }
}

class WeeklyForecastCard extends ConsumerWidget {
  const WeeklyForecastCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forecastdata = ref.watch(dailyWeatherControllerProvider);
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.3,
      width: size.width,
      child: VStack(
        [
          const Spacer(),
          GradientText('5-Day Weather Forecast',
              style: Theme.of(context).textTheme.titleMedium,
              colors: colorlist),
          const SizedBox(height: 10),
          forecastdata.when(
            data: (forecast) {
              final intervals = [0, 8, 16, 24, 32];

              return Dayforecastcard(
                forecast: [for (var f in intervals) forecast.list[f]],
              );
            },
            error: (error, stackTrace) => Text(error.toString()),
            loading: () =>
                ShimmerWidget.rectangular(height: size.height * 0.13),
          ),
          const Spacer()
        ],
        alignment: MainAxisAlignment.center,
        crossAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}

class Dayforecastcard extends ConsumerWidget {
  const Dayforecastcard({required this.forecast, super.key});
  final List<WeatherOutput> forecast;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: HStack(
        forecast
            .map((e) => Forecard(
                  data: e,
                ))
            .toList(),
        alignment: MainAxisAlignment.center,
      ),
    );
  }
}

class Forecard extends ConsumerWidget {
  const Forecard({
    required this.data,
    super.key,
  });

  final WeatherOutput data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;

    final temp = data.temp.celsius.toInt().toString();
    final iconurl = data.iconUrl;
    final date = DateFormat.E().format(data.date);
    final humidity = data.humidity;

    Color color = kBlackColor;
    if (double.parse(humidity) <= 49) {
      color = const Color.fromARGB(255, 150, 42, 35);
    } else if (double.parse(humidity) <= 70) {
      color = const Color.fromARGB(255, 161, 149, 33);
    } else {
      color = Color.fromARGB(255, 155, 180, 156);
    }
    return Container(
      height: size.height * 0.24,
      width: size.width * 0.19,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kPrimaryColor.withOpacity(0.4)),
      child: VStack(
        [
          const Spacer(),
          Text(date,
              style: const TextStyle(
                  fontFamily: 'Go',
                  fontWeight: FontWeight.w300,
                  color: kBlackColor,
                  fontSize: 13)),
          const Spacer(),
          WeatherIcon(
            url: iconurl,
            size: 35,
            color: Colors.white,
          ),
          const Spacer(),
          Text('$temp °',
              style: const TextStyle(
                  fontFamily: 'Go',
                  fontWeight: FontWeight.w300,
                  color: kBlackColor,
                  fontSize: 13)),
          const Spacer(),
          Card(
            color: color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Text(humidity,
                    style: const TextStyle(
                        fontFamily: 'Go',
                        fontWeight: FontWeight.w300,
                        color: kBlackColor,
                        fontSize: 9))
                .p4(),
          ),
          const Spacer()
        ],
        alignment: MainAxisAlignment.center,
        crossAlignment: CrossAxisAlignment.center,
      ).px8(),
    ).px8();
  }
}
