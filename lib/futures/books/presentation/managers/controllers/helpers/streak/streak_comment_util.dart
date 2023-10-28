import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../../core/constants/hive_keys.dart';
import '../../../../../../../core/shared_pref/hive_client.dart';
import '../../../state_manager/streak_provider.dart';


class StreakCommentUtil {

  static final HiveClient _hive = HiveClient();


  static String getSmallText(WidgetRef ref){
    int streak = ref.watch(streakProvider);

    if(_hive.getStreakState() == COUNTDOWN_STATE) {
      return "Countdown";

    } else {
      if (streak == 0) {
        return "Read every day,";

      } if (streak > 0 && streak < 5) {
        return "Good";

      } else {
        return "Fantastic";
      }

    }
  }

  static String getBigText(WidgetRef ref){
    int streak = ref.watch(streakProvider);

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