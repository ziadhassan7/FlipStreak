import 'package:flip_streak/futures/goal/presentation/dialog/picker_dialog/picker_dialog_view.dart';
import 'package:flutter/material.dart';
import '../../../../app_common_views/z_dialog/z_dialog.dart';


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

    ZDialog(
      context,
      dominantButtonFunction: () {
        onSave(currentValue);
        PickerDialog.currentValue = 0;
      },

      child: PickerDialogView(
        title,
        initialValue: initialValue,
        maxValue: maxValue,
      ),

    );
  }

}