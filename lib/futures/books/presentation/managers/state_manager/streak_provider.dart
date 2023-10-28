import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/shared_pref/hive_client.dart';

//Initialize Hive
HiveClient hive = HiveClient();
//



final streakProvider = StateNotifierProvider<StreakProvider, int>((ref) {

  return StreakProvider(hive.getStreakCounter()); //get streak score
});



class StreakProvider extends StateNotifier<int>{

  StreakProvider(int streak) : super(streak); //pass streak as the initial value

  //update streak
  void notifyNewStreak() async {
    state = hive.getStreakCounter();
  }

}