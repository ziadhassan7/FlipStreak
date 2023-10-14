import 'package:flip_streak/presentation/achievements/widget/goal_widget.dart';
import 'package:flip_streak/provider/pages_goal_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../provider/pages_read_provider.dart';
import '../../views/dialoq/edit_today_goal/edit_today_goal.dart';
import '../../views/dialoq/reset_pages_read/reset_pages_read_dialog.dart';

class TodayGoalWidget extends ConsumerWidget {
  const TodayGoalWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final currentProgress = ref.watch(pagesReadProvider);
    final goal = ref.watch(pagesGoalProvider);

    return GoalWidget(
        title: "Today's Goal",
        info: "Pages read",
        infoTail: "today.",

        currentProgress: currentProgress,
        goal: goal,

        onEditPress: (){
          EditTodayGoal(context, ref);
        },

        onLongPress: (){
          ResetPagesReadDialog(context, ref);
        }
    );
  }
}
