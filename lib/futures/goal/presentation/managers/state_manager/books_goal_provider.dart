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

  void increaseGoal() => state++;

  void decreaseGoal() {
    if(state >1) state--;
  }

  void changeGoal(value) => state = value;

  get goal => state;
}