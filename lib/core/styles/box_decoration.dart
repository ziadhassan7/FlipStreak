import 'package:flip_streak/core/styles/border.dart';
import 'package:flutter/material.dart';

class CustomDecoration extends BoxDecoration {

  final Color? backgroundColor;
  final Gradient? gradientColor;
  final double borderWidth;
  final Color borderColor;
  final double radius;
  final bool isCircular;

  CustomDecoration({
    this.backgroundColor,
    this.gradientColor,
    this.borderWidth= 0,
    this.borderColor= Colors.transparent,
    this.radius = 0,
    this.isCircular = false,
  }) : super(
  color: backgroundColor,

  border: CustomBorder(borderWidth: borderWidth, borderColor: borderColor),

  borderRadius: isCircular ?
  BorderRadius.circular(radius)
      : BorderRadius.all(Radius.circular(radius)),

  ) {

    // This means that you can have either isCircular ==true (OR) radius ==0  (Not Both)
    // You can either have (isCircular = true or radius = 0), both cannot violate the assert
    assert(isCircular != true || radius != 0,
    'Cannot have isCircular as true, without providing a proper radius'
    );

  }

}
