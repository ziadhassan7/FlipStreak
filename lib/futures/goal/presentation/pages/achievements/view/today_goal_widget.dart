import 'package:flip_streak/futures/goal/presentation/managers/state_manager/pages_goal_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../books/presentation/dialog/reset_pages_read/reset_pages_read_dialog.dart';
import '../../../dialog/edit_today_goal/edit_today_goal.dart';
import '../../../managers/state_manager/pages_read_provider.dart';
import '../widget/goal_widget.dart';

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
