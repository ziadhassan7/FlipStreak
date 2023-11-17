import 'package:flip_streak/core/utils/battery_optimization_util.dart';
import 'package:flip_streak/futures/app_common_views/z_dialog/z_dialog.dart';
import 'package:flip_streak/futures/goal/presentation/dialog/battery_optimization/view/optimization_view.dart';
import 'package:flutter/material.dart';
import '../../../../../index_page/index_page.dart';


class BatteryOptimizationDialog {


  BatteryOptimizationDialog(BuildContext context,){
    ZDialog(
      context,

      disableTintColor: true,
      mainButtonTitle: "Turn Off",
      mainButtonFunction: () async => await askToDisableBatteryOptimization(),
      cancelButtonFunction: neverAskAgainForOptimization,

      child: const OptimizationView(),
    );
  }


  askToDisableBatteryOptimization() async {
    //set askForBatteryOptimization to false, (never ask again)
    IndexPage.askForBatteryOptimization = false;

    //ask user to disable it
    await BatteryOptimizationUtil.disableBatteryOptimization();
  }

  neverAskAgainForOptimization() {
    //set askForBatteryOptimization to false, (never ask again)
    IndexPage.askForBatteryOptimization = false;
  }
}
