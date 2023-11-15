import 'package:disable_battery_optimization/disable_battery_optimization.dart';


class BatteryOptimizationUtil {


  static disableBatteryOptimization() async {

    //check if battery optimization is disabled
    if(await isBatteryOptimizationEnabled()){
      // if enabled, ask user to disable it
      await DisableBatteryOptimization.showDisableBatteryOptimizationSettings();
    }

  }

  static Future<bool> isBatteryOptimizationEnabled() async {
    bool? isDisabled = await DisableBatteryOptimization.isBatteryOptimizationDisabled;
    return !(isDisabled ?? false);
  }

}