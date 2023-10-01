
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificMessage {
  final FlutterLocalNotificationsPlugin _flutternotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings _initializationSettingsAndroid =
      const AndroidInitializationSettings('buss');

  void initialiseNotificatois() async {
    InitializationSettings initializationSettings =
        InitializationSettings(android: _initializationSettingsAndroid);

    await _flutternotificationsPlugin.initialize(initializationSettings);
  }

  void sendNotification(String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails('channelID', 'channelname',
            importance: Importance.max,
            priority: Priority.high,
            color: Color.fromARGB(255, 0, 122, 96));

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await _flutternotificationsPlugin.show(0, title, body, notificationDetails);
  }

  void sendshNotification(String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      'channelID',
      'channelname',
      importance: Importance.max,
      priority: Priority.high,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await _flutternotificationsPlugin.periodicallyShow(
        0, title, body, RepeatInterval.everyMinute, notificationDetails);
  }
}
