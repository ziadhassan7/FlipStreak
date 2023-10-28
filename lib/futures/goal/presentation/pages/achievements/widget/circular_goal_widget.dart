import 'package:flutter/material.dart';
import '../../../../../../core/styles/box_decoration.dart';
import '../../../../../app_common_views/text_view/text_view.dart';

class CircularGoalWidget extends StatelessWidget {
  const CircularGoalWidget({Key? key,
    required this.currentProgress, required this.goal, required this.color}) : super(key: key);

  final int currentProgress;
  final int goal;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:90,
      width: 90,

      decoration: CustomDecoration(
        borderColor: color,
        borderWidth: 4,
        isCircular: true,
        radius: 100,
      ),

      child: Center(child: TextView("$currentProgress/$goal", color: color, weight: FontWeight.bold, size: 18,)),
    );
  }
}
