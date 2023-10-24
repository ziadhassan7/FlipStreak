import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flip_streak/presentation/views/dialoq/dialoq_widget.dart';
import 'package:flip_streak/presentation/views/text_inria_sans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StreakInfoDialog {


  StreakInfoDialog(BuildContext context){
    DialogWidget.info(
      context,

      child: view(),
    );
  }

  Widget view(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(child: SvgPicture.asset("assets/illustrations/beacon/beacon_4.svg", fit: BoxFit.fitHeight, height: 300,)),

        TextInriaSans(
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
