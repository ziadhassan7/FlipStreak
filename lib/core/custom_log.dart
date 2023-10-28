import 'package:flutter/foundation.dart';

class PrintDebug {

  PrintDebug(String tag, dynamic obj){
    debugPrint("$tag:  $obj");
  }

  PrintDebug.log(String tag, dynamic obj){
    if (kDebugMode) {
      print("$tag:  $obj");
    }
  }
}