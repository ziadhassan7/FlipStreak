import 'package:flutter/material.dart';
import '../../../../../app_constants/color_constants.dart';
import '../../../../../data/shared_pref/hive_client.dart';

class PageCountBoxController {

  static final HiveClient _hiveClient = HiveClient();

  final onBrightBackground = colorAccent.withOpacity(0.05);
  final onDarkBackground = Colors.white24;

  static late String pagesRead;
  static late String pagesGoal;


  /// Colors
  static Color getBackgroundColor(bool isBright){

    if(_getPagesRead() >= getPagesGoal()){
      return Color.fromRGBO(248, 233, 193, isBright ? 0.6 : 0.2);
    }

    return isBright ? colorAccent.withOpacity(0.05) : Colors.white24;
  }

  static Color getForegroundColor(bool isBright){
    if(isGoalReached()){
      return const Color.fromRGBO(217, 143, 12, 1.0);
    }


    return isBright ? colorAccent : darkSecondary;
  }


  /// Counters
  static int _getPagesRead(){

    return _hiveClient.getPageReadCounter();
  }

  static int getPagesGoal(){
    return _hiveClient.getPagesGoal();
  }

  static bool isGoalReached(){
    return _getPagesRead() >= getPagesGoal();
  }

}