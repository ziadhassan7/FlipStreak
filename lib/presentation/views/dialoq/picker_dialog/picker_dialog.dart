import 'package:flip_streak/presentation/views/dialoq/picker_dialog/picker_dialog_view.dart';
import 'package:flutter/material.dart';
import '../dialoq_widget.dart';


class PickerDialog {

  static int currentValue = 0;

  final BuildContext context;

  final String title;
  final int initialValue;
  final int maxValue;
  final Function(int value) onSave;

  PickerDialog(
      this.context,
      {required this.title,
        required this.initialValue,
        required this.maxValue,
        required this.onSave}) {

    DialogWidget(
      context,
      dominantButtonFunction: ()=> onSave(currentValue),

      child: PickerDialogView(
        title,
        initialValue: initialValue,
        maxValue: maxValue,
      ),

    ).showAlert();
  }

}