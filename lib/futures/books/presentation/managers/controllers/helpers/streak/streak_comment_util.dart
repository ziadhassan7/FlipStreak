import '../../../../../../../core/constants/hive_keys.dart';
import '../../../../../../../core/shared_pref/hive_client.dart';


class StreakCommentUtil {

  static final HiveClient _hive = HiveClient();


  static String getSmallText(int streak){

    if(_hive.getStreakState() == COUNTDOWN_STATE) {
      return "Countdown";

    } else {
      if (streak == 0) {
        return "Read every day,";

      } if (streak > 0 && streak < 5) {
        return "Good";

      } else {
        return "Fantastic!";
      }

    }
  }

  static String getBigText(int streak){

    if(_hive.getStreakState() == COUNTDOWN_STATE) {
      return "Don't let the streak die!";

    } else {
      if (streak == 0) {
        return "and the beacon will glow!";
      } else {
        return "You have been consistent for";
      }

    }
  }
}