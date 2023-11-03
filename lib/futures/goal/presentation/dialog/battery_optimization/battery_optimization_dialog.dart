import 'package:flip_streak/core/utils/battery_optimization_util.dart';
import 'package:flip_streak/futures/app_common_views/z_dialog/z_dialog.dart';
import 'package:flip_streak/futures/goal/presentation/dialog/battery_optimization/view/optimization_view.dart';
import 'package:flutter/material.dart';


class BatteryOptimizationDialog {


  BatteryOptimizationDialog(BuildContext context,){
    ZDialog(
      context,

      disableTintColor: true,
      dominantButtonTitle: "Turn Off",
      dominantButtonFunction: () async => await askToDisableBatteryOptimization(),

      child: const OptimizationView(),
    );
  }


  askToDisableBatteryOptimization() async {
    await BatteryOptimizationUtil.disableBatteryOptimization();
  }

}
