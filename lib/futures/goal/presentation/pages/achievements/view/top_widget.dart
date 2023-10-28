import 'package:flutter/material.dart';
import '../../../../../../core/constants/color_constants.dart';
import '../../../../../app_common_views/heading_image.dart';
import '../../../../../app_common_views/text_view/text_view.dart';

class AchievementTopWidget extends StatelessWidget {
  const AchievementTopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 38, left: 26),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView("Your", size: 28, color: colorAccent,),
              TextView("Achievements", weight: FontWeight.bold, size: 30, color: colorAccent,),
            ],
          ),),


        Align(
            alignment: AlignmentDirectional.topEnd,
            child: HeadingImage("assets/headings/achievement_heading.svg", haveSpaceOnTop: true,)),
      ],
    );
  }
}
