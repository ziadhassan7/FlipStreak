import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flip_streak/features/app_common_views/z_dialog/z_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../app_common_views/text_view/text_view.dart';

class StreakInfoDialog {


  StreakInfoDialog(BuildContext context){
    ZDialog.info(
      context,
      mainButtonColor: colorOrange,
      child: view(),
    );
  }

  Widget view(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(child: SvgPicture.asset("assets/illustrations/beacon/beacon_4.svg", fit: BoxFit.fitHeight, height: 300,)),

        const TextView(
          "Every day you read,\nthe beacon will glow stronger..",
          weight: FontWeight.bold,
          size: 16,
          color: colorBrown,
        ),

        const SizedBox(height: 18,),

        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 14.0,
              color: colorBrown,
            ),
            children: <TextSpan>[
              TextSpan(text: 'But be careful! ', style: TextStyle(fontWeight: FontWeight.bold)),

              TextSpan(text: 'If you didn’t read for a day, the light will go off! '
                  'and you will start over again.',),
            ],
          ),
        )
      ],
    );
  }

}
