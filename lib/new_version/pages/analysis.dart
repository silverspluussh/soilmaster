import 'package:flutter/material.dart';
import 'package:soilmaster/constants/colors.dart';
import 'package:soilmaster/new_version/wiis/currrentchart.dart';
import 'package:soilmaster/new_version/wiis/moisture.dart';
import 'package:soilmaster/tools/caluculus.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../tools/soilmaster.dart';

class Analysis extends StatefulWidget {
  const Analysis({super.key});

  @override
  State<Analysis> createState() => _AnalysisState();
}

class _AnalysisState extends State<Analysis> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return SizedBox(
      width: size.width,
      height: size.height,
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: kBackgroundColor,
                automaticallyImplyLeading: false,
                bottom: const PreferredSize(
                    preferredSize: Size.fromHeight(30),
                    child: TabBar(tabs: [
                      Tab(text: 'Current Data Analysis', height: 40),
                      Tab(text: 'Historical Data Analysis', height: 40),
                    ])),
              ),
              body: SafeArea(
                  child: TabBarView(children: [
                StreamBuilder(
                    stream: ApiCalls().streamCurrentdata(),
                    initialData: SoilMaster(
                        humidity: 0, light: 0, moisture: 0, rain: 0, temp: 0),
                    builder: (context, snap) {
                      if (snap.hasData) {
                        SoilMaster master = snap.data!;

                        return Container(
                          color: kBackgroundColor,
                          width: size.width * 0.86,
                          height: size.height,
                          child: ListView(
                            children: [
                              BarChartSample1(
                                five: double.parse(master.rain.toString()),
                                four: double.parse(master.light.toString()),
                                one: double.parse(master.humidity.toString()),
                                three: double.parse(master.moisture.toString()),
                                two: double.parse(master.temp.toString()),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                width: size.width * 0.8,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                height: 70,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    kPrimaryColor.withOpacity(0.5),
                                    Colors.black26
                                  ]),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ListTile(
                                  trailing: Text(
                                    '${master.humidity.toString()} %',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kWhiteColor,
                                        fontSize: 16),
                                  ),
                                  leading: const Icon(Icons.heat_pump),
                                  title: const Text(
                                    'Soil Humidity',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: kWhiteColor,
                                        fontSize: 16),
                                  ),
                                  tileColor: kPrimaryColor.withOpacity(0.5),
                                ),
                              ),
                              Container(
                                width: size.width * 0.8,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                height: 70,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    kPrimaryColor.withOpacity(0.5),
                                    Colors.black26
                                  ]),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ListTile(
                                  leading: const Icon(Icons.heat_pump),
                                  title: const Text(
                                    'Soil Temperature',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: kWhiteColor,
                                        fontSize: 16),
                                  ),
                                  trailing: Text(
                                    '${master.temp.toString()} °C',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kWhiteColor,
                                        fontSize: 16),
                                  ),
                                  tileColor: kPrimaryColor.withOpacity(0.5),
                                ),
                              ),
                              Container(
                                width: size.width * 0.8,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                height: 70,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    kPrimaryColor.withOpacity(0.5),
                                    Colors.black26
                                  ]),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ListTile(
                                  leading: const Icon(Icons.heat_pump),
                                  trailing: Text(
                                    '${master.moisture.toString()} %',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kWhiteColor,
                                        fontSize: 16),
                                  ),
                                  title: const Text(
                                    'Soil Moisture level',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: kWhiteColor,
                                        fontSize: 16),
                                  ),
                                  tileColor: kPrimaryColor.withOpacity(0.5),
                                ),
                              ),
                              Container(
                                width: size.width * 0.8,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                height: 70,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    kPrimaryColor.withOpacity(0.5),
                                    Colors.black26
                                  ]),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ListTile(
                                  trailing: Text(
                                    '${master.light.toString()} %',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kWhiteColor,
                                        fontSize: 16),
                                  ),
                                  leading: const Icon(Icons.heat_pump),
                                  title: const Text(
                                    'Light intensity',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: kWhiteColor,
                                        fontSize: 16),
                                  ),
                                  tileColor: kPrimaryColor.withOpacity(0.5),
                                ),
                              ),
                              Container(
                                width: size.width * 0.8,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                height: 70,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    kPrimaryColor.withOpacity(0.5),
                                    Colors.black26
                                  ]),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ListTile(
                                  trailing: Text(
                                    '${master.rain.toString()} %',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kWhiteColor,
                                        fontSize: 16),
                                  ),
                                  leading: const Icon(Icons.heat_pump),
                                  title: const Text(
                                    'Rainfall',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: kWhiteColor,
                                        fontSize: 16),
                                  ),
                                  tileColor: kPrimaryColor.withOpacity(0.5),
                                ),
                              )
                            ],
                          ),
                        );
                      }
                      if (snap.connectionState == ConnectionState.done) {}

                      return const Center(child: CircularProgressIndicator());
                    }),
                StreamBuilder(
                    stream: ApiCalls().streamHistdata(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        SoilMast call = snapshot.data!;
                        return Container(
                          color: kBackgroundColor,
                          width: size.width * 0.86,
                          height: size.height,
                          child: ListView(
                            children: [
                              Container(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    const Text('Soil moisture'),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Card(
                                              color: Colors.green,
                                              child: Column(
                                                children: [
                                                  const Text(
                                                    'AVG',
                                                    style: TextStyle(
                                                        color: kWhiteColor),
                                                  ),
                                                  Text(Calculator()
                                                      .calculateAvgm(
                                                          call.moisture!)
                                                      .toStringAsFixed(3)),
                                                ],
                                              ).p16()),
                                          Card(
                                              color: Colors.yellow,
                                              child: Column(
                                                children: [
                                                  const Text(
                                                    'MIN',
                                                    style: TextStyle(
                                                        color: kWhiteColor),
                                                  ),
                                                  Text(Calculator()
                                                      .minvaluem(call.moisture!)
                                                      .toStringAsFixed(3)),
                                                ],
                                              ).p16()),
                                          Card(
                                              color: Colors.red,
                                              child: Column(
                                                children: [
                                                  const Text(
                                                    'MAX',
                                                    style: TextStyle(
                                                        color: kWhiteColor),
                                                  ),
                                                  Text(Calculator()
                                                      .maxvaluem(call.moisture!)
                                                      .toStringAsFixed(3)),
                                                ],
                                              ).p16()),
                                        ]),
                                    const SizedBox(height: 10),
                                    // Text(response['moisture'][0] ?? 0),
                                    LineChartSample5(
                                        indicatorStrokeColor: Colors.yellow,
                                        gradientColor1: Colors.orange[200],
                                        gradientColor2: Colors.orange[300],
                                        gradientColor3: Colors.orange[400],
                                        values: call.moisture!)
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    const Text('Soil temperature'),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Card(
                                              color: Colors.green,
                                              child: Column(
                                                children: [
                                                  const Text(
                                                    'AVG',
                                                    style: TextStyle(
                                                        color: kWhiteColor),
                                                  ),
                                                  Text(Calculator()
                                                      .calculateAvg(call.temp!)
                                                      .toStringAsFixed(1)),
                                                ],
                                              ).p16()),
                                          Card(
                                              color: Colors.yellow,
                                              child: Column(
                                                children: [
                                                  const Text(
                                                    'MIN',
                                                    style: TextStyle(
                                                        color: kWhiteColor),
                                                  ),
                                                  Text(Calculator()
                                                      .minvalue(call.temp!)
                                                      .toString()),
                                                ],
                                              ).p16()),
                                          Card(
                                              color: Colors.red,
                                              child: Column(
                                                children: [
                                                  const Text(
                                                    'MAX',
                                                    style: TextStyle(
                                                        color: kWhiteColor),
                                                  ),
                                                  Text(Calculator()
                                                      .maxvalue(call.temp!)
                                                      .toString()),
                                                ],
                                              ).p16()),
                                        ]),
                                    const SizedBox(height: 10),
                                    LineChartSample5(
                                      values: call.temp!,
                                      indicatorStrokeColor: Colors.grey,
                                      gradientColor1: Colors.purple[200],
                                      gradientColor2: Colors.purple[300],
                                      gradientColor3: Colors.purple[400],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    const Text('Soil humidity'),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Card(
                                              color: Colors.green,
                                              child: Column(
                                                children: [
                                                  const Text(
                                                    'AVG',
                                                    style: TextStyle(
                                                        color: kWhiteColor),
                                                  ),
                                                  Text(Calculator()
                                                      .calculateAvg(
                                                          call.humidity!)
                                                      .toStringAsFixed(1)),
                                                ],
                                              ).p16()),
                                          Card(
                                              color: Colors.yellow,
                                              child: Column(
                                                children: [
                                                  const Text(
                                                    'MIN',
                                                    style: TextStyle(
                                                        color: kWhiteColor),
                                                  ),
                                                  Text(Calculator()
                                                      .minvalue(call.humidity!)
                                                      .toString()),
                                                ],
                                              ).p16()),
                                          Card(
                                              color: Colors.red,
                                              child: Column(
                                                children: [
                                                  const Text(
                                                    'MAX',
                                                    style: TextStyle(
                                                        color: kWhiteColor),
                                                  ),
                                                  Text(Calculator()
                                                      .maxvalue(call.humidity!)
                                                      .toString()),
                                                ],
                                              ).p16()),
                                        ]),
                                    const SizedBox(height: 10),
                                    LineChartSample5(
                                        indicatorStrokeColor: Colors.blue,
                                        gradientColor1: Colors.indigo[200],
                                        gradientColor2: Colors.indigo[300],
                                        gradientColor3: Colors.indigo[400],
                                        values: call.humidity!),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    const Text('Light intensity'),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Card(
                                              color: Colors.green,
                                              child: Column(
                                                children: [
                                                  const Text(
                                                    'AVG',
                                                    style: TextStyle(
                                                        color: kWhiteColor),
                                                  ),
                                                  Text(Calculator()
                                                      .calculateAvg(call.light!)
                                                      .toStringAsFixed(1)),
                                                ],
                                              ).p16()),
                                          Card(
                                              color: Colors.yellow,
                                              child: Column(
                                                children: [
                                                  const Text(
                                                    'MIN',
                                                    style: TextStyle(
                                                        color: kWhiteColor),
                                                  ),
                                                  Text(Calculator()
                                                      .minvalue(call.light!)
                                                      .toString()),
                                                ],
                                              ).p16()),
                                          Card(
                                              color: Colors.red,
                                              child: Column(
                                                children: [
                                                  const Text(
                                                    'MAX',
                                                    style: TextStyle(
                                                        color: kWhiteColor),
                                                  ),
                                                  Text(Calculator()
                                                      .maxvalue(call.light!)
                                                      .toString()),
                                                ],
                                              ).p16()),
                                        ]),
                                    const SizedBox(height: 10),
                                    LineChartSample5(
                                      indicatorStrokeColor: Colors.yellow,
                                      gradientColor1: Colors.red[200],
                                      gradientColor2: Colors.red[300],
                                      gradientColor3: Colors.red[400],
                                      values: call.light!,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    const Text('Rain'),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Card(
                                              color: Colors.green,
                                              child: Column(
                                                children: [
                                                  const Text(
                                                    'AVG',
                                                    style: TextStyle(
                                                        color: kWhiteColor),
                                                  ),
                                                  Text(Calculator()
                                                      .calculateAvgm(call.rain!)
                                                      .toStringAsFixed(3)),
                                                ],
                                              ).p16()),
                                          Card(
                                              color: Colors.yellow,
                                              child: Column(
                                                children: [
                                                  const Text(
                                                    'MIN',
                                                    style: TextStyle(
                                                        color: kWhiteColor),
                                                  ),
                                                  Text(Calculator()
                                                      .minvaluem(call.rain!)
                                                      .toStringAsFixed(3)),
                                                ],
                                              ).p16()),
                                          Card(
                                              color: Colors.red,
                                              child: Column(
                                                children: [
                                                  const Text(
                                                    'MAX',
                                                    style: TextStyle(
                                                        color: kWhiteColor),
                                                  ),
                                                  Text(Calculator()
                                                      .maxvaluem(call.rain!)
                                                      .toStringAsFixed(3)),
                                                ],
                                              ).p16()),
                                        ]),
                                    const SizedBox(height: 10),
                                    LineChartSample5(
                                      indicatorStrokeColor: Colors.indigo,
                                      gradientColor1: Colors.indigo[200],
                                      gradientColor2: Colors.indigo[300],
                                      gradientColor3: Colors.indigo[400],
                                      values: call.moisture!,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.done) {}
                      return const Center(child: CircularProgressIndicator());
                    })
              ])))),
    );
  }
}
