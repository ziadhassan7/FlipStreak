import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/shared_pref/hive_client.dart';

final pagesGoalProvider = StateNotifierProvider<PagesGoalProvider, int>((ref) {

  return PagesGoalProvider();
});


class PagesGoalProvider extends StateNotifier<int>{
  final HiveClient _hiveClient = HiveClient();

  PagesGoalProvider() : super(1){
    getInitialValue();
  }

  getInitialValue(){
    state = _hiveClient.getPagesGoal();
  }

  void increaseGoal() => state++;

  void decreaseGoal() {
    if(state >1) state--;
  }

  void changeGoal(value) => state = value;

  get goal => state;
}