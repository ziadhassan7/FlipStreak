import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  CircularButton({Key? key, required this.onPressed, this.color = colorAccent, required this.icon, this.size = 56}) : super(key: key);
  CircularButton.child({Key? key, required this.onPressed, this.color = colorAccent, required this.child, this.size = 56}) : super(key: key);

  final Function()? onPressed;
  final Color color;
  Icon? icon;
  final double size;

  Widget? child;

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

            child: Center(child: icon ?? child), // Button Icon
          ),
        ),
      ),
    );
  }
}
