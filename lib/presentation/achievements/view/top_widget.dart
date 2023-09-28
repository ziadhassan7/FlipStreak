import 'package:flutter/material.dart';
import '../../../../app_constants/color_constants.dart';
import '../../views/heading_image.dart';
import '../../views/text_inria_sans.dart';

class AchievementTopWidget extends StatelessWidget {
  const AchievementTopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 38, left: 26),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextInriaSans("Your", size: 28, color: colorAccent,),
              TextInriaSans("Achievements", weight: FontWeight.bold, size: 30, color: colorAccent,),
            ],
          ),),


        const Align(
            alignment: AlignmentDirectional.topEnd,
            child: HeadingImage("assets/headings/achievement_heading.svg", haveSpaceOnTop: true,)),
      ],
    );
  }
}
