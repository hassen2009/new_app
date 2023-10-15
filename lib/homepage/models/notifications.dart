import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import '../../base/task.dart';

class NotifyHelper{
  void requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
  FlutterLocalNotificationsPlugin
  flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin(); //

  initializeNotification() async {
    _configureLocalTimeZone();
    // this is for latest iOS settings
    final DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings(
        requestSoundPermission: false,
        requestBadgePermission: false,
        requestAlertPermission: false,
        onDidReceiveLocalNotification: onDidReceiveLocalNotification
    );

    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("logo4");

      final InitializationSettings initializationSettings =
      InitializationSettings(
      iOS: initializationSettingsIOS,
      android:initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
    );
  }
  displayNotification({required String title, required String body}) async {
    print("doing test");
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name',
        importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics = new DarwinNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'You change your theme',
      'You changed your theme back !',
      platformChannelSpecifics,
      payload: 'It could be anything you pass',
    );
  }
  scheduledNotification(int hour, int minutes,Task task) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      task.id!.toInt(),
      task.salle,
      task.title,
    _convertTime(hour,minutes),
    //tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
     NotificationDetails(
      android: AndroidNotificationDetails("cyour channel id", "your channelName"),
    ),
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents: DateTimeComponents.time,
      payload: "{$task.title}"+"{$task.salle}|"
    );
  }
  Future selectNotification(String? payload) async {
    if (payload != null) {
      print('notification payload: $payload');
    } else {
      print("Notification Done");
    }
    Get.to(()=>Container(color: Colors.white,));
  }
  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    // display a dialog with the notification details, tap ok to go to another page
      //context: context,
      Get.dialog(Text("welcome to flutter"));
  }
  tz.TZDateTime _convertTime(int hour,int minutes ){
    final tz.TZDateTime  now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate = tz.TZDateTime(tz.local,now.year,now.month,now.day,hour,minutes);
    if(scheduleDate.isBefore(now)){
      scheduleDate = scheduleDate.add(const Duration(days: 1));
    }
    return scheduleDate;
  }
  Future<void> _configureLocalTimeZone()async{
    tz.initializeTimeZones();
    final String timeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZone));
  }
}