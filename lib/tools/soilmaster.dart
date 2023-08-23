import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:soilmaster/tools/randomgen.dart';
import '../main.dart';

class SoilMaster {
  int? rain;
  int? temp;
  int? humidity;
  int? moisture;

  int? light;
  String? date;

  SoilMaster(
      {this.rain,
      this.temp,
      this.humidity,
      this.light,
      this.date,
      this.moisture});

  factory SoilMaster.fromJson(Map<String, dynamic> json) {
    return SoilMaster(
        date: json['current_date'],
        humidity: json['current_humidity'],
        light: json['current_light'],
        temp: json['current_temperature'],
        moisture: json['current_moisture'],
        rain: json['current_rain']);
  }
}

class SoilMast {
  List? rain;
  List? temp;
  List? humidity;
  List? moisture;
  List? light;
  List? date;

  SoilMast(
      {this.rain,
      this.temp,
      this.humidity,
      this.light,
      this.date,
      this.moisture});

  factory SoilMast.fromJson(Map<String, dynamic> json) {
    return SoilMast(
        date: json['date'],
        humidity: json['humidity'],
        light: json['light'],
        temp: json['temperature'],
        moisture: json['moisture'],
        rain: json['rain']);
  }
}

scheduleAlarm() async {
  var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
    'alert',
    'threshold alert',
    importance: Importance.max,
  );

  var platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
      idg(), 'Irrigation', 'Time to irrigate ', platformChannelSpecifics,
      payload: 'Instant alert');
}

class ApiCalls {
  Future<SoilMaster> getCurrentdata() async {
    http.Response response = await http.get(
        Uri.parse('http://3.93.200.70:5150/current-values'),
        headers: {'Accept': 'application/json'});
    var body = await json.decode(response.body);

    if (body["current_moisture"] < 50) {
      await scheduleAlarm();
    }

    return SoilMaster.fromJson(body);
  }

  Stream<SoilMaster> streamCurrentdata() async* {
    while (true) {
      yield await getCurrentdata();
    }
  }

  Future<SoilMast> getHistdata() async {
    http.Response response = await http.get(
        Uri.parse('http://3.93.200.70:5150/history'),
        headers: {'Accept': 'application/json'});
    var body = await json.decode(response.body);

    return SoilMast.fromJson(body);
  }

  Stream<SoilMast> streamHistdata() async* {
    while (true) {
      yield await getHistdata();
    }
  }
}
