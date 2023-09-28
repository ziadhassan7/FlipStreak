import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flip_streak/presentation/views/dialoq/picker_dialog/picker_dialog.dart';
import 'package:flip_streak/presentation/views/text_inria_sans.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

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

    return SizedBox(
      width: MediaQuery.of(context).size.width *0.8,
      height: 250,

      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),

            child: TextInriaSans(
              widget.title,
              size: 18,
              weight: FontWeight.bold,
              color: colorAccent,
            ),
          ),

          NumberPicker(
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
          )
        ],
      ),
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
