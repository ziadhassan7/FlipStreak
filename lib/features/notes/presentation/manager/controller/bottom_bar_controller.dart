import 'package:flutter/material.dart';
import '../../../../../core/styles/device_screen.dart';

class BottomBarController {

  static double? getBookNameWidth(BuildContext context, String text){
    double screenWidth = AppScreen(context).width;

    if(text.length > screenWidth/20){
      return screenWidth * 0.38;
    }

    return null;
  }

  static double? getPageNumberWidth(BuildContext context, String text){
    double screenWidth = AppScreen(context).width;

    if(text.length > screenWidth/40){
      return screenWidth * 0.28;
    }

    return null;
  }

}