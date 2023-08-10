import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:soilmaster/constants/colors.dart';
import 'package:soilmaster/weatherman/ui/weatherwidget.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/weather/weathermodel.dart';

final cityProvider = StateProvider<String>((ref) {
  return 'Kumasi';
});

class CitySearchBox extends ConsumerStatefulWidget {
  const CitySearchBox({super.key});

  @override
  ConsumerState<CitySearchBox> createState() => _CitySearchRowState();
}

class _CitySearchRowState extends ConsumerState<CitySearchBox> {
  static const _radius = 20.0;

  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.text = ref.read(cityProvider);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: 50,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () => context.mounted ? context.pop() : null,
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 30,
                color: kBlackColor,
              )),
          const Spacer(),
          SizedBox(
            width: size.width * 0.6,
            height: 45,
            child: TextField(
              controller: _searchController,
              textAlign: TextAlign.center,
              style: const TextStyle(color: kBlackColor),
              decoration: InputDecoration(
                fillColor: Colors.black,
                filled: false,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kBlackColor, width: 1.1),
                  borderRadius: BorderRadius.circular(_radius),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kBlackColor, width: 1.1),
                  borderRadius: BorderRadius.circular(_radius),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kBlackColor, width: 1.1),
                  borderRadius: BorderRadius.circular(_radius),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: kBlackColor, width: 1.1),
                  borderRadius: BorderRadius.circular(_radius),
                ),
              ),
              onSubmitted: (value) =>
                  ref.read(cityProvider.notifier).state = value,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(
              Icons.search_outlined,
              size: 30,
              color: kWhiteColor,
            ),
            onPressed: () {
              FocusScope.of(context).unfocus();
              ref.read(cityProvider.notifier).state = _searchController.text;
            },
          ),
        ],
      ),
    );
  }
}

class WeaCard extends ConsumerWidget {
  const WeaCard({
    super.key,
    required this.size,
    required this.weather,
    required this.city,
  });

  final Size size;
  final WeatherOutput weather;
  final String city;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(30),
      ),
      height: size.height * 0.13,
      width: size.width * 0.44,
      child: VStack(
        [
          const Spacer(),
          HStack([
            const Icon(Icons.location_on, size: 20, color: kBlueColor),
            const SizedBox(width: 10),
            Text(
              city,
              style: Theme.of(context).textTheme.titleSmall,
            )
          ]),
          const Spacer(),
          SizedBox(
            child: HStack(
              [
                const Spacer(),
                WeatherIcon(
                  size: 80,
                  url: weather.iconUrl,
                  color: kWhiteColor,
                ),
                const Spacer(),
                Text(
                  '${weather.temp.celsius.toInt().toString()} °',
                  style: Theme.of(context).textTheme.titleSmall,
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
                style: Theme.of(context).textTheme.bodySmall,
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
                style: Theme.of(context).textTheme.bodySmall,
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
