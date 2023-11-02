import 'package:disable_battery_optimization/disable_battery_optimization.dart';

class BatteryOptimizationUtil {


  static disableBatteryOptimization() async {

    //check if battery optimization is disabled
    if(await _isBatteryOptimizationDisabled()){
      // if not ask use to disable it
      await DisableBatteryOptimization.showDisableBatteryOptimizationSettings();
    }

  }

  static Future<bool> _isBatteryOptimizationDisabled() async {
    bool? isDisabled = await DisableBatteryOptimization.isBatteryOptimizationDisabled;
    return isDisabled ?? false;
  }

}