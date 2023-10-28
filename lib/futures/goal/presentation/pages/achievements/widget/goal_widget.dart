import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/styles/box_decoration.dart';
import '../../../../../../core/styles/padding.dart';
import '../../../../../app_common_views/text_view/text_view.dart';
import 'circular_goal_widget.dart';

class GoalWidget extends StatelessWidget {
  const GoalWidget({
    Key? key,
    required this.title,
    required this.info,
    required this.infoTail,
    required this.currentProgress,
    required this.goal,
    required this.onEditPress,
    this.onLongPress,
    this.showTotalPagesCount = false,
  }) : super(key: key);

  final String title;
  final String info;
  final String infoTail;
  final int currentProgress;
  final int goal;
  final Function() onEditPress;
  final Function()? onLongPress;
  final bool showTotalPagesCount;

  final Color goalReachedColor = Colors.lightGreen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const CustomPadding(horizontal: 30, vertical: 24),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,

        children: [
          Row(
            children: [
              /// Title - Text
              Padding(
                padding: const CustomPadding(horizontal: 12),
                child: TextView(title, size: 16, color: Colors.black87,),
              ),

              const Spacer(),

              /// Edit - Button
              InkWell(
                  onTap: onEditPress,
                  child: Container(
                      padding: const CustomPadding(vertical: 4, horizontal: 12),
                      decoration: CustomDecoration(
                          isCircular: true, radius: 40,
                          borderWidth: 1,
                          backgroundColor: Colors.white,
                          borderColor: colorAccent.withOpacity(0.4)),

                      child: const Row(
                        children: [
                          TextView("Edit Goal ", size: 12,),
                          Icon(Icons.edit_outlined, size: 12, color: Colors.black87),
                        ],
                      )))
            ],
          ),

          alignmentWidget(),

          Container(
            padding: const CustomPadding(vertical: 16, horizontal: 20),

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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(info, size: 18, color: Colors.brown.shade900,),
                        TextView(infoTail, size: 18, weight: FontWeight.bold, color: Colors.brown.shade900),
                      ],
                    )),

                const SizedBox(width: 10,),

                /// Progress - Circular Widget
                InkWell(
                  onLongPress: onLongPress,

                  child: CircularGoalWidget(
                    currentProgress: currentProgress,
                    goal: goal,
                    color: isGoalReached()? Colors.lightGreen : colorAccent,),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget alignmentWidget(){
    return const SizedBox(height: 10,);
  }

  bool isGoalReached(){
    return currentProgress >= goal;
  }
}
