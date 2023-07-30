import 'package:flutter/material.dart';

class Pageroute {
  static navigatePush(
      {required BuildContext context, required Widget destination}) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => destination));
  }

  static navigatePushReplace(
      {required BuildContext context, required Widget destination}) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => destination));
  }
}
