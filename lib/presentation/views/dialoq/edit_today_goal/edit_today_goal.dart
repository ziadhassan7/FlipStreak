import 'package:flip_streak/provider/pages_goal_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../picker_dialog/picker_dialog.dart';


class EditTodayGoal {

  final BuildContext context;
  final WidgetRef ref;

  EditTodayGoal( this.context, this.ref,) {

    final currentGoal = ref.watch(pagesGoalProvider);

    PickerDialog(
        context,
        title: "Edit Goal",

        initialValue: currentGoal,
        maxValue: 1000,

        onSave: (value){
          ref.read(pagesGoalProvider.notifier).changeGoal(value);
        }
    );
  }

}