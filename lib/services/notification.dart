// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService extends ChangeNotifier {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // initialize

  Future initialize() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("ic_launcher");

    IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings();

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // instant notification
  Future instantNotification() async {
    var android = AndroidNotificationDetails("channelId", "channelName");

    var ios = IOSNotificationDetails();

    var platform = NotificationDetails(android: android, iOS: ios);

    await _flutterLocalNotificationsPlugin.show(
        0, "Demo Testing", "Do something", platform,
        payload: "Welcome to App");
  }

  // Image notification
  Future imageNotification() async {
    var bigPicture = BigPictureStyleInformation(
      DrawableResourceAndroidBitmap("ic_launcher"),
      largeIcon: DrawableResourceAndroidBitmap("ic_launcher"),
      contentTitle: "Demo Notification",
      summaryText: "This is some text",
      htmlFormatContent: true,
      htmlFormatContentTitle: true,
    );

    var android = AndroidNotificationDetails("channelId", "channelName",
        styleInformation: bigPicture);

    var platform = NotificationDetails(android: android);

    await _flutterLocalNotificationsPlugin.show(
        0, "Demo Testing", "Do something", platform,
        payload: "Welcome to App");
  }

  // Stylish NOtification
  Future stylishNotification() async {
    var android = AndroidNotificationDetails("id", "channelName",
        color: Colors.deepOrange,
        enableLights: true,
        enableVibration: true,
        largeIcon: DrawableResourceAndroidBitmap("ic_launcher"),
        styleInformation: MediaStyleInformation(
            htmlFormatContent: true, htmlFormatTitle: true));

    var platform = NotificationDetails(android: android);

    await _flutterLocalNotificationsPlugin.show(
        0, "Demo Stylish notification", "Tap to do something", platform);
  }

  Future scheduledNotification() async {
    var interval = RepeatInterval.everyMinute;
    var bigPicture = BigPictureStyleInformation(
      DrawableResourceAndroidBitmap("ic_launcher"),
      largeIcon: DrawableResourceAndroidBitmap("ic_launcher"),
      contentTitle: "Demo Testing",
      summaryText: "Do something",
      htmlFormatContent: true,
      htmlFormatContentTitle: true,
    );

    var android = AndroidNotificationDetails("channelId", "channelName",
        styleInformation: bigPicture);

    var platform = NotificationDetails(android: android);

    await _flutterLocalNotificationsPlugin.periodicallyShow(
        0, "Demo Scheduled Notification", "Do something", interval, platform);
  }

  // cancel notification
  Future cancelNotification() async {
    await _flutterLocalNotificationsPlugin.cancel(0);
  }
}
