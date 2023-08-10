import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:soilmaster/constants/colors.dart';
import 'package:soilmaster/new_version/startup/maindashboard.dart';
import 'package:soilmaster/src/utils/navigation.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(6.seconds, () {
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
        child: Column(
          children: [
            const Spacer(),
            GradientText('Soilmaster 1.0',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                colors: [kPrimaryColor.withOpacity(0.5), Colors.red]).py8(),
            const Spacer(),
            const Text('Welcome to Soil Master version 1.0',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Go',
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
            const SizedBox(height: 30),
            const SpinKitChasingDots(size: 70, color: kPrimaryColor),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
