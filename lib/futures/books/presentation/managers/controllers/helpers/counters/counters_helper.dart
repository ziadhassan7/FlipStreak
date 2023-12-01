import 'package:flip_streak/futures/books/presentation/managers/controllers/helpers/counters/streak_counter_util.dart';
import 'package:flip_streak/futures/goal/presentation/managers/state_manager/pages_read_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../../core/shared_pref/hive_client.dart';
import '../../scroll_controller.dart';


class CountersHelper {
  static final HiveClient _hive = HiveClient();
  late int pageReadCounter;

  CountersHelper(){
    // Get initial value
    pageReadCounter = _hive.getPageReadCounter();
  }

  void updateCounters(WidgetRef ref, {required bool isIncrement}){

    // update current initial value
    if(isIncrement){
      pageReadCounter++;
    } else {
      if(pageReadCounter != 0) pageReadCounter--; //do not go bellow 0
    }

    // check if, it is not rapid scrolls
    if(!ScrollBehaviourController.isRapidScroll()){
      // Update Pages Counters
      ref.read(pagesReadProvider.notifier).update(pageReadCounter);
      _hive.increaseFlipCounter();
    }

    // Increment Streak counter on first flip
    StreakCounterUtil.triggerStreakUpdateOnFirstFlip(ref);
  }

}