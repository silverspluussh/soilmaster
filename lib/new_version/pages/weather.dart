import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soilmaster/constants/colors.dart';
import 'package:soilmaster/src/utils/navigation.dart';
import 'package:soilmaster/weatherman/ui/searchbycity.dart';
import 'package:soilmaster/weatherman/ui/weatherwidget.dart';
import 'package:velocity_x/velocity_x.dart';

class Weatherman extends ConsumerWidget {
  const Weatherman({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/weatherassets/pngwing.com.png'),
      )),
      padding:
          const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 10),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: _topbarwidgets(
            context,
            () {},
          ).py16()),
          SliverToBoxAdapter(child: const WeatherWidget().py16()),
          SliverToBoxAdapter(
            child: const Weatherinfocard().py20(),
          ),
          SliverToBoxAdapter(
            child: const WeeklyForecastCard().py20(),
          ),
        ],
      ),
    ).animate().fadeIn(
          duration: 400.milliseconds,
        );
  }

  SizedBox _topbarwidgets(BuildContext context, VoidCallback callback) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              tooltip: 'Press to search weather by city',
              onPressed: () => Pageroute.navigatePush(
                  context: context, destination: const SearchCity()),
              icon: const Icon(Icons.search_outlined,
                  size: 30, color: kBlackColor)),
          Text('search weather by city')
        ],
      ),
    );
  }
}
