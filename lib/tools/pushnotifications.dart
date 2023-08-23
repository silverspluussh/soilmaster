// ignore_for_file: depend_on_referenced_packages
import 'dart:developer';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:soilmaster/tools/randomgen.dart';

class NotificationBundle {
  int id = int.parse(idg().toString());
  FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

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
