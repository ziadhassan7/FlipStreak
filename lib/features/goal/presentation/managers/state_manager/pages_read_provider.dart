import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/shared_pref/hive_client.dart';


final pagesReadProvider = StateNotifierProvider<PagesReadProvider, int>((ref) {

  return PagesReadProvider();
});


class PagesReadProvider extends StateNotifier<int>{
  HiveClient hiveClient = HiveClient();

  PagesReadProvider() : super(0){
    getInitialValue();
  }

  void getInitialValue() {
    state = hiveClient.getPageReadCounter();
  }

  update(int value) {
    hiveClient.updatePageReadCounter(value);
    state = value;
  }

  reset() {
    hiveClient.updatePageReadCounter(0);
    state = 0;
  }
}