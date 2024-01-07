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

  ///Increase
  void increaseGoal() {
    int currentGoal = state;
    currentGoal++; //increase

    _hiveClient.updatePagesGoal(currentGoal);
    state = currentGoal;
  }

  ///Decrease
  void decreaseGoal() {
    if(state >1) {
      int currentGoal = state;
      currentGoal--; //decrease

      _hiveClient.updatePagesGoal(currentGoal);
      state = currentGoal;
    }
  }

  ///Change
  void changeGoal(value) {
    _hiveClient.updatePagesGoal(value);
    state = value;
  }

}