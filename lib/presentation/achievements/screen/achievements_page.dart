import 'package:flip_streak/presentation/achievements/view/today_goal_widget.dart';
import 'package:flip_streak/presentation/achievements/view/top_widget.dart';
import 'package:flutter/material.dart';
import '../../../app_constants/color_constants.dart';

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary.withOpacity(0.4),

      body: SingleChildScrollView(
        child: Column(
          children: [
            AchievementTopWidget(),

            TodayGoalWidget(),
          ],
        ),
      ),
    );
  }
}
