import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flip_streak/futures/goal/presentation/dialog/picker_dialog/picker_dialog.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import '../../../../app_common_views/text_view/text_view.dart';

class PickerDialogView extends StatefulWidget {
  const PickerDialogView(this.title, {Key? key, required this.maxValue, required this.initialValue}) : super(key: key);

  final String title;
  final int maxValue;
  final int initialValue;

  @override
  State<PickerDialogView> createState() => _PickerDialogViewState();
}

class _PickerDialogViewState extends State<PickerDialogView> {

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,

      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),

          child: TextView(
            widget.title,
            size: 18,
            weight: FontWeight.bold,
            color: colorAccent,
          ),
        ),

        Expanded(
          child: NumberPicker(
            value: getCurrentValue(),
            minValue: 0,
            maxValue: widget.maxValue,
            textStyle: getTextStyle(isSelected: false),
            selectedTextStyle: getTextStyle(isSelected: true),
            onChanged: (value) {
              setState(() {
                PickerDialog.currentValue = value;
              });
            },
          ),
        )
      ],
    );
  }

  getCurrentValue(){
    int currentValue = PickerDialog.currentValue;

    if(currentValue == 0){
      currentValue = widget.initialValue;
    }

    return currentValue;
  }

  getTextStyle({required bool isSelected}){
    return TextStyle(
      color: isSelected? Colors.black :  Colors.black54,
      fontSize: isSelected? 30 : 18 ,
      fontWeight: isSelected? FontWeight.bold : FontWeight.normal ,
    );
  }
}
