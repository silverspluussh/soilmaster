import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:soilmaster/constants/colors.dart';
import 'package:soilmaster/tools/soilmaster.dart';
import 'package:velocity_x/velocity_x.dart';

import '../weatherman/ui/weatherwidget.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  ConsumerState<Homepage> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: StreamBuilder(
            stream: ApiCalls().streamCurrentdata(),
            initialData: SoilMaster(
                humidity: 0, light: 0, moisture: 0, rain: 0, temp: 0),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                SoilMaster call = snapshot.data!;
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: const HStack([
                        Text('Good day user.',
                            style: TextStyle(
                                fontFamily: 'Go',
                                fontWeight: FontWeight.w500,
                                fontSize: 16)),
                        Spacer(),
                      ]).py8(),
                    ),
                    SliverToBoxAdapter(
                      child: GradientText('Soilmaster readings',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          colors: const [kPrimaryColor, Colors.red]).py8(),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        width: size.width,
                        height: size.height * 0.15,
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: kPrimaryColor.withOpacity(0.7),
                                  blurRadius: 5)
                            ]),
                        child: Center(
                          child: ListTile(
                            leading: Image.asset(
                              'assets/icons/light-bulb-35-128.png',
                              width: 60,
                              height: 60,
                            ),
                            title: const Text(
                              'Light Intensity',
                              style: TextStyle(
                                  fontFamily: 'Go',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                            trailing: Text("${call.light} %",
                                style: const TextStyle(
                                    fontFamily: 'Go',
                                    fontSize: 16,
                                    color: kBlackColor,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                    SliverGrid.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.8,
                      children: [
                        cardwidget(size,
                            image: 'assets/icons/thermometer-5-128.png',
                            title: 'Soil',
                            sub: 'temperature',
                            value: "${call.temp} °C"),
                        // cardwidget(size,
                        //     image: 'assets/icons/light-bulb-35-128.png',
                        //     title: 'Light',
                        //     sub: 'intensity',
                        //     value: "${call.light} °C"),
                        cardwidget(size,
                            image: 'assets/icons/humidity-25-128.png',
                            title: 'Soil',
                            sub: 'humidity',
                            value: "${call.humidity} %"),
                        cardwidget(size,
                            image: 'assets/icons/soil-moisture-1-128.png',
                            title: 'Soil',
                            sub: 'moisture',
                            value: "${call.moisture} %"),
                        cardwidget(size,
                            image: 'assets/icons/rainfall-svg-128.png',
                            title: 'Rain',
                            sub: 'intensity',
                            value: "${call.rain} %"),
                      ],
                    ),
                    SliverToBoxAdapter(
                      child: GradientText('Current Weather Forecast ',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          colors: [
                            Colors.black.withOpacity(0.5),
                            Colors.red
                          ]).py8(),
                    ),
                    SliverToBoxAdapter(child: const WeatherWidget().py16()),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 10,
                      ),
                    )
                  ],
                );
              }
              if (snapshot.connectionState == ConnectionState.done) {}

              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }

  Container cardwidget(Size size,
      {required image, required title, required sub, required value}) {
    return Container(
      width: size.width * 0.43,
      height: size.height * 0.3,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: kPrimaryColor.withOpacity(0.7), blurRadius: 5)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 60,
            height: 60,
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
                fontFamily: 'Go', fontSize: 13, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          Text(sub,
              style: const TextStyle(
                  fontFamily: 'Go',
                  fontSize: 11,
                  color: Colors.black26,
                  fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          Text(value,
              style: const TextStyle(
                  fontFamily: 'Go',
                  fontSize: 20,
                  color: kBlackColor,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
