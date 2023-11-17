import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationUtil {

  static final _notification = FlutterLocalNotificationsPlugin();

  //Show
  static Future<void> showNotification (
    int id,
    {required String title,
    required String body,}) async {

    requestPermission().then((value) =>

        _notification.show(
            id,
            title,
            body,
            _getNotificationDetail()
        ));

  }

  //Schedule
  static Future<void> scheduleNotification (
    int id,
    Duration duration,
    {required String title,
      required String body,}) async {

    requestPermission().then((value) =>

        _notification.zonedSchedule(
            id,
            title,
            body,
            tz.TZDateTime.now(tz.local).add(duration),
            _getNotificationDetail(),

            androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
            uiLocalNotificationDateInterpretation:
                  UILocalNotificationDateInterpretation.absoluteTime
        ));
  }

  //Cancel
  static Future<void> cancelNotification (int id) async {

    _notification.cancel(id);
  }


  //
  //
  //


  ///Factory Code
  //Notification Details
  static _getNotificationDetail(){
    return const NotificationDetails(
      android: AndroidNotificationDetails(
          "0", //Channel ID
          "main_channel", //Channel Name
          channelDescription: "some description",
          importance: Importance.max,

          color: colorSecondary, //Background Color
      ),
    );
  }

  ///Permission
  //Request Permissions, for android 13 or higher
  static Future<bool?> requestPermission() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    return await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()?.requestPermission();
  }


  /// Initialize in your main(), after WidgetsFlutterBinding.ensureInitialized();
  static init() async {

    tz.initializeTimeZones();

    const AndroidInitializationSettings initializationSettingsAndroid =  AndroidInitializationSettings('notification_icon');
    // your app icon should be in
    //android/app/src/main/res/drawable
    //You should make a separate simpler icon for notifications
    //Icon should be 36X36, with no background
    //It will be white or black (no color)

    const InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid);

    await _notification.initialize(initializationSettings);
  }

}