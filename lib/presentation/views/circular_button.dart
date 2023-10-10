import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({Key? key, required this.onPressed, this.color = colorAccent, required this.icon, this.size = 56}) : super(key: key);

  final Function()? onPressed;
  final Color color;
  final Icon icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: color, // Button Color

        child: InkWell(
          onTap: onPressed, // Button Function

          child: SizedBox(
            width: size,
            height: size,

            child: icon, // Button Icon
          ),
        ),
      ),
    );
  }
}
