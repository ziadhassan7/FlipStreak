import 'package:flutter/material.dart';
import '../../../app_constants/color_constants.dart';
import '../../styles/box_decoration.dart';
import '../../styles/padding.dart';
import '../../views/text_inria_sans.dart';

class CounterInput extends StatelessWidget {
  const CounterInput({Key? key,
      required this.currentGoal,
      required this.decreaseFunction,
      required this.counterPickerFunction,
      required this.increaseFunction})
      : super(key: key);

  final String currentGoal;
  final Function() decreaseFunction;
  final Function() counterPickerFunction;
  final Function() increaseFunction;

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        /// Decrease
        customButton(
          onPressed: decreaseFunction,
          icon: Icons.remove,
        ),


        /// Current Goal
        InkWell(
          onTap: counterPickerFunction,

          child: Container(
            padding: const CustomPadding(vertical: 10, horizontal: 60),
            decoration: CustomDecoration(
              backgroundColor: Colors.white,
              borderColor: colorAccent.withOpacity(0.4),
              radius: 40,
              borderWidth: 4,
            ),

            child: TextInriaSans(currentGoal),
          ),
        ),

        /// Increase
        customButton(
          onPressed: increaseFunction,
          icon: Icons.add,
        ),
      ],);
  }


  Widget customButton({required Function() onPressed, required IconData icon}){
    return InkWell(
      onTap: onPressed,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const CustomPadding.all(8),
          decoration: CustomDecoration(
            radius: 30,
            borderColor: colorAccent.withOpacity(0.4),
            backgroundColor: Colors.white,
          ),

          child: Icon(icon, color: colorAccent.withOpacity(0.4),),
        ),
      ),
    );
  }
}
