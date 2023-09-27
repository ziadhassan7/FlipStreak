import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../app_constants/color_constants.dart';
import '../provider/bright_mode_provider.dart';

class SystemUtil {

  /// Screen Orientation
  static setScreenOnlyPortrait(){
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  static setScreenOnlyLandscape(){
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
  }

  static setScreenAllOrientation(){
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown,DeviceOrientation.portraitUp,
        DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
  }

  // Get orientation
  static bool isScreenLandscape(BuildContext context){
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return true;
    } else {
      return false;
    }
  }

  /// Status bar
  static void disableStatusBarColor () {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For IOS (dark icons)
    ));
  }

  static void updateStatusBarColor(WidgetRef ref) {

    final isBright = ref.watch(brightModeProvider);

    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
      statusBarColor:
      isBright ? dominateColor : darkPrimary,

      statusBarIconBrightness:
      isBright ? Brightness.dark : Brightness.light, // For Android

      statusBarBrightness:
      isBright ? Brightness.light : Brightness.dark, // For IOS
    ));
  }


}