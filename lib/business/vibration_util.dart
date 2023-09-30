import 'package:vibration/vibration.dart';

class VibrationUtil {

  static bool allowVibration = true;

  static void vibrate () {

    if(allowVibration == true){
      //if device supports vibration, vibrate!
      Vibration.hasVibrator().then((value) {
        Vibration.vibrate();

        //cancel vibration
        Future.delayed(const Duration(milliseconds: 80), () {
          Vibration.cancel();
          allowVibration = false;
        });
      });

    }
  }


  static void resetTrigger (){
    allowVibration = true;
  }

}