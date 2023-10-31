import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/shared_pref/hive_client.dart';


final booksGoalProvider = StateNotifierProvider<BooksGoalProvider, int>((ref) {

  return BooksGoalProvider();
});


class BooksGoalProvider extends StateNotifier<int>{
  final HiveClient _hiveClient = HiveClient();

  BooksGoalProvider() : super(1){
    getInitialValue();
  }

  getInitialValue(){
    state = _hiveClient.getBooksGoal();
  }

  ///Increase
  void increaseGoal() {
    int currentGoal = state;
    currentGoal++; //increase

    _hiveClient.updateBooksGoal(currentGoal);
    state = currentGoal;
  }

  ///Decrease
  void decreaseGoal() {
    if(state >1) {
      int currentGoal = state;
      currentGoal--; //decrease

      _hiveClient.updateBooksGoal(currentGoal);
      state = currentGoal;
    }
  }

  ///Change
  void changeGoal(value) {
    _hiveClient.updateBooksGoal(value);
    state = value;
  }
}