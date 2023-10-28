import 'package:disable_battery_optimization/disable_battery_optimization.dart';

class BatteryOptimizationUtil {


  disableBatteryOptimization() async {

    //check if battery optimization is disabled
    if(await isBatteryOptimizationDisabled()){
      // if not ask use to disable it
      await DisableBatteryOptimization.showDisableBatteryOptimizationSettings();
    }

  }

  Future<bool> isBatteryOptimizationDisabled() async {
    bool? isDisabled = await DisableBatteryOptimization.isBatteryOptimizationDisabled;
    return isDisabled ?? false;
  }

}