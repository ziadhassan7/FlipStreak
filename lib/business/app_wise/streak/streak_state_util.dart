import 'package:flip_streak/app_constants/hive_keys.dart';
import '../../../../data/shared_pref/hive_client.dart';

class StreakStateUtil {

  static final HiveClient _hive = HiveClient();

  static void updateStreakState(){
    //Current Date
    DateTime currentDate = DateTime.now();
    //Last Saved Date
    DateTime lastSavedDate = _hive.getLastDate();
    //Durations
    Duration remaining = currentDate.difference(lastSavedDate).abs();
    //Countdown Gap
    Duration hoursMin = const Duration(hours: 24);
    Duration hoursMax = const Duration(hours: 56);


    /// Same State (didn't enter Countdown Gap)                                 -- Don't update date
    if(remaining < hoursMin) {
      _hive.updateStreakState(SAME_DATE_STATE);

    /// Countdown (entered Countdown Gap)                                       -- You can change streak
    } else if (remaining > hoursMin  &&  remaining < hoursMax){
      _hive.updateStreakState(COUNTDOWN_STATE);

    /// Ended (Reset)                                                           -- Streak is back to 0
    }else if (remaining > hoursMax){
      _hive.updateStreakState(ENDED_STATE);
      resetAllCounter();
    }
  }

  static void updateWithNewDate(DateTime newDate){
    _hive.putLastDate(newDate);
  }


  static void resetAllCounter(){
    _hive.resetPageReadCounter();
    _hive.resetFlipCounter();
    _hive.resetStreakCounter();
  }

}


