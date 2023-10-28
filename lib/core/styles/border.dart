import 'package:flutter/material.dart';

class CustomBorder extends Border{

  final double borderWidth;
  final Color borderColor;

  CustomBorder({
    this.borderWidth = 0,
    this.borderColor= Colors.transparent,
  }) : super.fromBorderSide(
      BorderSide(color: borderColor, width: borderWidth, )
  );

  // I had to do this, because it seems like you can't override a factory constructor
  // Instead I would have just called super.all

}