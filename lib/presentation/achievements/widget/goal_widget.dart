import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flip_streak/presentation/achievements/widget/circular_goal_widget.dart';
import 'package:flip_streak/presentation/styles/box_decoration.dart';
import 'package:flip_streak/presentation/styles/padding.dart';
import 'package:flip_streak/presentation/views/text_inria_sans.dart';
import 'package:flutter/material.dart';

class GoalWidget extends StatelessWidget {
  const GoalWidget({
    Key? key,
    required this.title,
    required this.info,
    required this.currentProgress,
    required this.goal,
    required this.onEditPress,
    this.showTotalPagesCount = false,
  }) : super(key: key);

  final String title;
  final String info;
  final int currentProgress;
  final int goal;
  final Function() onEditPress;
  final bool showTotalPagesCount;

  final Color goalReachedColor = Colors.lightGreen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const CustomPadding(hor: 30, ver: 20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,

        children: [
          Row(
            children: [
              /// Title - Text
              Padding(
                padding: const CustomPadding(hor: 12),
                child: TextInriaSans(title, size: 20,),
              ),

              const Spacer(),

              /// Edit - Button
              IconButton(
                  onPressed: onEditPress,
                  icon: const Icon(Icons.edit_outlined, size: 18,))
            ],
          ),

          alignmentWidget(),

          Container(
            padding: const CustomPadding.all(20),

            decoration: CustomDecoration(
                backgroundColor: Colors.white, //colorBackground
                radius: 30,
                borderWidth: 2,
                borderColor: isGoalReached() ? goalReachedColor.withOpacity(0.6) : colorAccent.withOpacity(0.4)
            ),

            child: Row(
              children: [
                /// Info - Text
                Expanded(
                    flex: 5,
                    child: TextInriaSans(info, size: 16, overflow: TextOverflow.visible,)),

                const SizedBox(width: 10,),

                /// Progress - Circular Widget
                CircularGoalWidget(
                  currentProgress: currentProgress,
                  goal: goal,
                  color: isGoalReached()? Colors.lightGreen : colorAccent,),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget alignmentWidget(){
    return const SizedBox(height: 16,);
  }

  bool isGoalReached(){
    return currentProgress >= goal;
  }
}
