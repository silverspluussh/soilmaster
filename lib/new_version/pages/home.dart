import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:soilmaster/constants/colors.dart';
import 'package:soilmaster/tools/soilmaster.dart';
import 'package:velocity_x/velocity_x.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                fontWeight: FontWeight.w300,
                                fontSize: 13)),
                        Spacer(),
                      ]).py8(),
                    ),
                    SliverToBoxAdapter(
                      child: GradientText('Current Readings',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          colors: const [kPrimaryColor, Colors.red]).py8(),
                    ),
                    SliverGrid.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 15,
                      childAspectRatio: 1.2,
                      children: [
                        readCard(context,
                            title: 'Light',
                            subt: 'Light intensity',
                            value: "${call.light} %"),
                        readCard(context,
                            title: 'Temperature',
                            subt: 'AT temperature',
                            value: "${call.temp} °C"),
                        readCard(context,
                            title: 'Soil',
                            subt: 'Humidity',
                            value: "${call.humidity} %"),
                        readCard(context,
                            title: 'Soil',
                            subt: 'Moisture level',
                            value: "${call.moisture} %"),
                        readCard(context,
                            title: 'Rain',
                            subt: 'Rainfall',
                            value: "${call.rain} %"),
                      ],
                    ),
                    // SliverToBoxAdapter(
                    //   child: GradientText('Current Weather ',
                    //       style: const TextStyle(
                    //           fontSize: 14, fontWeight: FontWeight.bold),
                    //       colors: const [kPrimaryColor, Colors.red]).py8(),
                    // ),
                    // SliverToBoxAdapter(child: const WeatherWidget().py16()),

                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 10,
                      ),
                    )
                  ],
                );
              }
              if (snapshot.connectionState == ConnectionState.done) {}

              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}

Container readCard(context,
        {required title, required subt, required String value}) =>
    Container(
      height: 110,
      width: 125,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: VStack(alignment: MainAxisAlignment.center, [
        Text(
          title,
          style: const TextStyle(
              fontFamily: 'Go', fontSize: 13, fontWeight: FontWeight.w700),
        ),
        Text(subt,
            style: const TextStyle(
                fontFamily: 'Go',
                fontSize: 11,
                color: Colors.black26,
                fontWeight: FontWeight.w600)),
        Text(value,
                style: const TextStyle(
                    fontFamily: 'Go',
                    fontSize: 16,
                    color: kBlackColor,
                    fontWeight: FontWeight.bold))
            .centered(),
      ]),
    );
