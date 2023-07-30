import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soilmaster/constants/colors.dart';
import 'package:soilmaster/new_version/pages/analysis.dart';
import 'package:soilmaster/new_version/pages/crop.dart';
import 'package:soilmaster/new_version/pages/home.dart';
import 'package:soilmaster/new_version/pages/notes.dart';
import 'package:soilmaster/new_version/pages/settings.dart';
import 'package:soilmaster/new_version/pages/weather.dart';
import '../providers/navprovider.dart';

class Mainrender extends ConsumerStatefulWidget {
  const Mainrender({super.key});

  @override
  ConsumerState<Mainrender> createState() => _MainrenderState();
}

class _MainrenderState extends ConsumerState<Mainrender> {
  List<Widget>? pages;

  void onItemTapped(int index) {
    ref.watch(navIndexProvider.notifier).state = index;
  }

  @override
  void initState() {
    super.initState();

    pages = [
      const Homepage(),
      const Weatherman(),
      const Notes(),
      const Analysis(),
      const Croppage(),
      const Menu(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          selectedItemColor: kPrimaryColor,
          type: BottomNavigationBarType.shifting,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          selectedIconTheme: const IconThemeData(size: 23),
          unselectedIconTheme: const IconThemeData(size: 20),
          backgroundColor: kPrimaryColor,
          currentIndex: ref.watch(navIndexProvider),
          selectedFontSize: 10,
          unselectedFontSize: 10,
          onTap: onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 20,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.cloud,
                  size: 20,
                ),
                label: 'Weather'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.note,
                  size: 20,
                ),
                label: 'Notes'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.analytics,
                  size: 20,
                ),
                label: 'Analysis'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.church,
                  size: 20,
                ),
                label: 'Crops'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 20,
                ),
                label: 'Settings'),
          ]),
      body: SafeArea(child: pages![ref.watch(navIndexProvider)]),
    );
  }
}
