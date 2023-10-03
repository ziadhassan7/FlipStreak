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
        IconButton(
            onPressed: decreaseFunction,
            icon: Icon(Icons.remove, color: colorAccent.withOpacity(0.4))
        ),

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

        IconButton(
            onPressed: increaseFunction,
            icon: Icon(Icons.add, color: colorAccent.withOpacity(0.4),)
        ),
      ],);
  }
}
