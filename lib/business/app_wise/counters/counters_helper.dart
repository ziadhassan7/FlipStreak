import 'package:flip_streak/business/app_wise/counters/streak_counter_util.dart';
import 'package:flip_streak/provider/pages_read_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/shared_pref/hive_client.dart';

class CountersHelper {
  static final HiveClient _hive = HiveClient();
  late int pageReadCounter;

  CountersHelper(){
    // Get initial value
    pageReadCounter = _hive.getPageReadCounter();
  }

  void updateCounters(WidgetRef ref, {required bool isIncrement}){

    // update current initial value
    isIncrement
      ? pageReadCounter++
      : pageReadCounter--;

    // Update Pages Counters
    ref.read(pagesReadProvider.notifier).update(pageReadCounter);
    _hive.increaseFlipCounter();

    // Increment Streak counter on first flip
    StreakCounterUtil.triggerStreakUpdateOnFirstFlip(ref);
  }

}