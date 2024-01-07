import 'package:flip_streak/core/utils/notification_util.dart';

class StreakNotificationUtil {

  static const _scheduledId = 0;

  static scheduleNotificationOnCountdownState(){
    NotificationUtil.scheduleNotification(
        _scheduledId,
        const Duration(hours: 24),
        title: "Hi! Are you okay?",
        body: "You are about to lose your streak! Keep up your daily reading. ✨");
  }

  static void cancelScheduledNotification(){
    NotificationUtil.cancelNotification(_scheduledId);
  }

  //Schedule Notification, But cancel any old one
  static void reScheduleNotification(){
    cancelScheduledNotification();
    scheduleNotificationOnCountdownState();
  }

}