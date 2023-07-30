import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soilmaster/constants/colors.dart';
import 'package:soilmaster/weatherman/ui/weatherwidget.dart';
import 'package:velocity_x/velocity_x.dart';

class Weatherman extends ConsumerWidget {
  const Weatherman({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        title: const Text('Weather center'),
        centerTitle: true,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
            color: kBackgroundColor,
            image: DecorationImage(
              image: AssetImage('assets/weatherassets/pngwing.com.png'),
            )),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: const WeatherWidget().py16()),
            SliverToBoxAdapter(
              child: const Weatherinfocard().py20(),
            ),
            SliverToBoxAdapter(
              child: const WeeklyForecastCard().py20(),
            ),
            SliverToBoxAdapter(
              child: const SizedBox(
                height: 100,
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(
          duration: 400.milliseconds,
        );
  }
}
