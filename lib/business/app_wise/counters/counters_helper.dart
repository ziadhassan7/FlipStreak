import 'package:flip_streak/app_constants/hive_keys.dart';
import 'package:flip_streak/business/app_wise/counters/streak_counter_util.dart';
import 'package:flip_streak/provider/pages_read_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/shared_pref/hive_client.dart';

class CountersHelper {
  static final HiveClient _hive = HiveClient();
  late int pageReadCounter;

  CountersHelper(){
    pageReadCounter = _hive.getPageReadCounter();
  }

  void updateCounters(WidgetRef ref, {required bool isIncrement}){
    int streakState = _hive.getStreakState(); //get state

    switch(streakState) {
      case SAME_DATE_STATE:
        incrementCounters(ref, isIncrement);
        StreakCounterUtil.updateStreakOnFirstFlip(ref);
        break;

      case COUNTDOWN_STATE:
        _hive.resetFlipCounter();
        ref.read(pagesReadProvider.notifier).reset();
        incrementCounters(ref, isIncrement);
        StreakCounterUtil.updateStreakOnFirstFlip(ref);
        break;

      case ENDED_STATE:
        resetAllCounter(ref);
        incrementCounters(ref, isIncrement);
        break;

      default:
        debugPrint("Streak State Error");
    }

  }

  /// How many pages you've read Today
  void incrementCounters(WidgetRef ref, bool isIncrease) {


    if(isIncrease){
      pageReadCounter++; //increase a page

    } else {
      pageReadCounter--; //decrease a page, unless it's first open

    }

    ref.read(pagesReadProvider.notifier).update(pageReadCounter);
    _hive.increaseFlipCounter();
  }


  /// Reset
  static void resetAllCounter(WidgetRef ref){
    ref.read(pagesReadProvider.notifier).reset(); //how much you read today
    _hive.resetFlipCounter(); //number of pages flipped
    StreakCounterUtil.resetStreak(ref);
  }

}