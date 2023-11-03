import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flip_streak/core/utils/notification_util.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/app_router.dart';
import '../../../../../../core/shared_pref/hive_client.dart';
import '../../../../../../index_page/index_page.dart';
import '../../../../../app_common_views/text_view/text_view.dart';

class AllowNotificationButton extends StatelessWidget {
  const AllowNotificationButton({Key? key}) : super(key: key);

  static final HiveClient hiveClient = HiveClient();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: MediaQuery.sizeOf(context).width * 0.7,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(shape: const StadiumBorder(), backgroundColor: colorAccent),

        onPressed: (){
          // Request user to allow notifications,
          // if permitted! automatically move to home screen
          actAsFinishButton(context);
        },

        child: const TextView("Allow Notification", color: Colors.white, size: 16,),
      ),
    );
  }

  void actAsFinishButton(BuildContext context){
    NotificationUtil.requestPermission().then((isGranted) {
      //Navigate to Home Page,
      //and Open battery_optimization if permission granted
      AppRouter.navigateTo(context, IndexPage(askForBatteryOptimization: isGranted ?? false,), isReplace: true);
      //App First-Open-State: false
      hiveClient.updateFirstOpenState();
    });
  }
}
