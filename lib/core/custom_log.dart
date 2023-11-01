import 'package:flutter/foundation.dart';
import 'dart:developer' as developer;

class Log {

  Log(String tag, dynamic obj, {String? message}){
    if (kDebugMode) {
      developer.log(message ?? "-", name: tag, error: obj);
    }
  }

  Log.p(String message, {String? tag}){
    if (kDebugMode) {
      developer.log(message, name: "Log: $tag");
    }
  }
}