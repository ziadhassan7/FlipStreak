import 'package:flip_streak/business/print_debug.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/shared_pref/hive_client.dart';
import '../../../provider/streak_provider.dart';
import '../streak/streak_notification_util.dart';
import '../streak/streak_state_util.dart';

class StreakCounterUtil {
  static final HiveClient _hive = HiveClient();
  //Temp variables (hold temporary values)
  static late int streakCounter;
  static late int flipCounterTrigger;

  /// Update Streak Counter ,, Only on first flip
  static void triggerStreakUpdateOnFirstFlip(WidgetRef ref){
    flipCounterTrigger = _hive.getFlipCounter();

    PrintDebug("Flip:", flipCounterTrigger);

    //Trigger streak update only on the fist flip.
    if(flipCounterTrigger == 1){
      // update Streak Status
      StreakStateUtil.updateStreakState();
      updateWithNewDate(DateTime.now());
      //increment streak
      streakCounter = _hive.getStreakCounter();
      _hive.updateStreakCounter(streakCounter +1);
      //Trigger notification countdown, and cancel old one
      StreakNotificationUtil.reScheduleNotification();
      //update provider
      ref.read(streakProvider.notifier).notifyNewStreak();// trigger provider
    }

  }

  // Track a new date,
  // starting from the new streak count
  //
  // (App will only save a new date if a new streak is triggered)
  static void updateWithNewDate(DateTime newDate){
    _hive.putLastDate(newDate);
  }
}