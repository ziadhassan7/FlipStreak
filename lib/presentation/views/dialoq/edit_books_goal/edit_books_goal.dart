import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../provider/books_goal_provider.dart';
import '../picker_dialog/picker_dialog.dart';


class EditBooksGoal {

  final BuildContext context;
  final WidgetRef ref;

  EditBooksGoal( this.context, this.ref,) {

    final currentGoal = ref.watch(booksGoalProvider);

    PickerDialog(
        context,
        title: "Edit Goal",

        initialValue: currentGoal,
        maxValue: 1000,

        onSave: (value){
          ref.read(booksGoalProvider.notifier).changeGoal(value);
        }
    );
  }

}