// ignore_for_file: depend_on_referenced_packages
import 'dart:developer';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:soilmaster/constants/colors.dart';
import 'package:soilmaster/tools/randomgen.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationBundle {
  int id = int.parse(idg().toString());
  FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  AndroidInitializationSettings initializationSettings =
      const AndroidInitializationSettings('@mipmap/ic_launcher');

  AndroidNotificationDetails notifDetails = AndroidNotificationDetails(
      idg().toString(), 'medbox${idg()}',
      fullScreenIntent: true,
      color: kPrimaryColor.withOpacity(0.3),
      priority: Priority.high,
      importance: Importance.max);

  AndroidNotificationChannel notifChannel = AndroidNotificationChannel(
    idg().toString(),
    'medbox${idg()}',
    importance: Importance.max,
  );

  notificationDetails() {
    return NotificationDetails(android: notifDetails);
  }

//initialise
  Future initialzeNotification() async {
    var initSettings = InitializationSettings(android: initializationSettings);

    await notificationsPlugin.initialize(initSettings,
        onDidReceiveNotificationResponse: (details) async {});
    await notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(notifChannel);
  }
  //

  tz.TZDateTime instanceof10() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, 10);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  tz.TZDateTime instanceScheduleTime({int? hour, int? minute}) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(
      tz.local,
      hour!,
      minute!,
    );

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  tz.TZDateTime instantAps({int? month, int? day, int? hour, int? minute}) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(
      tz.local,
      month!,
      day!,
      hour!,
      minute!,
    );

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  //10 am schedule
  Future<void> scheduleDailyTenAMNotification() async {
    await notificationsPlugin.zonedSchedule(
        1,
        'Soil master ',
        'have you checked on soilmaster today.Make sure you irrigate your seedlings with clean water day and night',
        instanceof10(),
        NotificationDetails(
          android: notifDetails,
        ),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle);
  }

//
  Future instancems() async {
    await notificationsPlugin.show(
        0,
        'Water level Alert',
        'Water level low,irrigate your crops for optimum crop growth',
        await notificationDetails());
  }

  //schedule custom time
  Future<void> setreminder(
      {String? title,
      String? body,
      String? payload,
      String? id,
      int? hour,
      int? minute}) async {
    await notificationsPlugin
        .zonedSchedule(
            int.parse(id!),
            title,
            body,
            instanceScheduleTime(hour: hour!, minute: minute!),
            await notificationDetails(),
            uiLocalNotificationDateInterpretation:
                UILocalNotificationDateInterpretation.absoluteTime,
            payload: payload,
            matchDateTimeComponents: DateTimeComponents.time)
        .then((value) => log('alarm is set successfully'));
  }

  Future<void> deleteAlarm({id}) async => await notificationsPlugin.cancel(id);
  //
  Future<List<PendingNotificationRequest>> showReminders() async {
    List<PendingNotificationRequest> pending;
    pending = await notificationsPlugin.pendingNotificationRequests();
    if (pending.isNotEmpty) {
      log(pending.toString());
      return pending;
    }
    return [];
  }
}
