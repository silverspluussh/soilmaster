import 'package:flutter/material.dart';
import 'package:soilmaster/constants/colors.dart';
import 'package:soilmaster/new_version/startup/maindashboard.dart';
import 'package:soilmaster/src/utils/navigation.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(3.seconds, () {
      Pageroute.navigatePushReplace(
          context: context, destination: const Mainmain());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        color: Colors.white,
        child: const Column(
          children: [
            Spacer(),
            Text('Soilmaster 1.0',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.green)),
            Spacer(),
            Text('Welcome to soilmaster app..',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                    color: Colors.black)),
            SizedBox(height: 30),
            CircularProgressIndicator(color: kPrimaryColor),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
