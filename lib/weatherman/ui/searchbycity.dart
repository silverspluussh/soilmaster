import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:soilmaster/weatherman/providers/currentweatheroller.dart';
import 'package:soilmaster/weatherman/ui/searchwidget.dart';
import 'package:soilmaster/src/widgets/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../constants/colors.dart';
import 'weatherwidget.dart';

class SearchCity extends ConsumerWidget {
  const SearchCity({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final city1 = ref.watch(searchweathercontroller1);
    final city2 = ref.watch(searchweathercontroller2);
    final city3 = ref.watch(searchweathercontroller3);
    final city4 = ref.watch(searchweathercontroller4);

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
            color: kBackgroundColor,
            image: DecorationImage(
              image: AssetImage('assets/weatherassets/pngwing.com.png'),
            )),
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: const CitySearchBox().p16(),
              ),
              SliverToBoxAdapter(child: const WeatherWidget().py16()),
              SliverToBoxAdapter(
                  child: GradientText(
                          'Weather Conditions In Other Major Cities',
                          style: Theme.of(context).textTheme.titleSmall,
                          colors: colorlist)
                      .py12()
                      .centered()),
              SliverGrid.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.6,
                children: [
                  city1.when(
                    data: (data) =>
                        WeaCard(size: size, weather: data, city: 'Helsinki'),
                    error: (error, stackTrace) => Text(error.toString()),
                    loading: () =>
                        ShimmerWidget.rectangular(height: size.height * 0.13),
                  ),
                  city2.when(
                    data: (data) =>
                        WeaCard(size: size, weather: data, city: 'New York'),
                    error: (error, stackTrace) => Text(error.toString()),
                    loading: () =>
                        ShimmerWidget.rectangular(height: size.height * 0.13),
                  ),
                  city3.when(
                    data: (data) =>
                        WeaCard(size: size, weather: data, city: 'Hong Kong'),
                    error: (error, stackTrace) => Text(error.toString()),
                    loading: () =>
                        ShimmerWidget.rectangular(height: size.height * 0.13),
                  ),
                  city4.when(
                    data: (data) =>
                        WeaCard(size: size, weather: data, city: 'Lagos'),
                    error: (error, stackTrace) => Text(error.toString()),
                    loading: () =>
                        ShimmerWidget.rectangular(height: size.height * 0.13),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ).animate().slideX(
          duration: 400.milliseconds,
        );
  }
}
