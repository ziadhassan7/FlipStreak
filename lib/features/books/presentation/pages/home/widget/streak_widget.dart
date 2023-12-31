import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../app_common_views/text_view/text_view.dart';
import '../../../dialog/streak_info/streak_info_dialog.dart';
import '../../../managers/controllers/helpers/streak/streak_comment_util.dart';
import '../../../managers/state_manager/streak_provider.dart';

class StreakWidget extends ConsumerWidget {
  const StreakWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int streakCount = ref.watch(streakProvider);

    return SizedBox(
      height: 840 * getWidgetHeight(streakCount),

      child: Stack(
        alignment: AlignmentDirectional.topStart,

        children: [
          Container(
            padding: const EdgeInsets.only(left: 0),
            alignment: AlignmentDirectional.bottomCenter,

            child: InkWell(
              onTap: ()=> StreakInfoDialog(context),
              child: SvgPicture.asset(
                  getBeacon(streakCount),
                width: MediaQuery.of(context).size.width * getBeaconWidth(streakCount),
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                textWidget(StreakCommentUtil.getSmallText(streakCount), size: 15,),
                textWidget(StreakCommentUtil.getBigText(streakCount), size: 16,),
                const SizedBox(height: 2,),
                textWidget(streakCount.toString(), size: 55),
                textWidget(streakCount == 1? "day":"days", size: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }


  String getBeacon(int streakCount) {


    if (streakCount == 0) {
      return "assets/illustrations/beacon/beacon_0.svg";
    }

    if (streakCount > 0 && streakCount <= 2) {
      return "assets/illustrations/beacon/beacon_1.svg";
    }

    if (streakCount > 2 && streakCount < 5) {
      return"assets/illustrations/beacon/beacon_3.svg";
    }

    if (streakCount >= 5) {
      return"assets/illustrations/beacon/beacon_4.svg";
    }

    else {
      return "assets/illustrations/beacon/beacon_0.svg";
    }
  }

  double getBeaconWidth(int streakCount) {

    //from 0 -> 2
    if (streakCount >= 0 && streakCount <= 2) {
      return 0.5;
    }

    //from 3 -> 4
    if (streakCount > 2 && streakCount < 5) {
      return 0.6;

    //from 5 ->
    } else {
      return 1;
    }
  }

  double getWidgetHeight(int streakCount) {

    //from 0 -> 2
    if (streakCount >= 0 && streakCount <= 2) {
      return 0.28;
    }

    //from 3 -> 4
    if (streakCount > 2 && streakCount < 5) {
      return 0.3;

    //from 5 ->
    } else {
      return 0.35;
    }
  }

  Widget textWidget(String text, {required double size, bool isBold = true}) {
    return TextView(
      text,
      size: size,
      weight: isBold ? FontWeight.bold : FontWeight.normal,);
  }
}
