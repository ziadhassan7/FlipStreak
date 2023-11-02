import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/app_router.dart';
import '../../../../../../core/constants/color_constants.dart';
import '../../../../../../core/shared_pref/hive_client.dart';
import '../../../../../../index_page/index_page.dart';
import '../../../../../app_common_views/text_view/text_view.dart';
import '../../../dialog/battery_optimization/battery_optimization_dialog.dart';
import '../../../managers/state_manager/welcome_screen_provider.dart';

class NextButton extends ConsumerWidget {
  const NextButton(this.currentPage, {Key? key}) : super(key: key);

  final Pages currentPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    String text = (currentPage == Pages.thirdPage) ? "Finish" : "Next";

    return TextButton(
      onPressed: ()=> nextButtonPressed(context, ref, currentPage),

      child: TextView(
        text,
        color: colorAccent,
        weight: FontWeight.bold,
        size: 18,
      ),
    );
  }

  /// Next
  nextButtonPressed(BuildContext context, WidgetRef ref, Pages currentPage){
    HiveClient hiveClient = HiveClient();

    switch(currentPage){

      case Pages.firstPage:
        //Move to Books' Goal Page
        ref.read(welcomeScreenProvider.notifier).changeIndex(Pages.secondPage);
        break;

      case Pages.secondPage:
        //Move to Notification Page
        ref.read(welcomeScreenProvider.notifier).changeIndex(Pages.thirdPage);
        break;

      case Pages.thirdPage:
        //Ask for battery optimization
        BatteryOptimizationDialog(context);
        //Navigate to Home Page
        AppRouter.navigateTo(context, IndexPage(), isReplace: true);
        //App First Open: false
        hiveClient.updateFirstOpenState();
        break;
    }
  }

}
