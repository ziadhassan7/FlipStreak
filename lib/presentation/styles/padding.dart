import 'package:flutter/widgets.dart';

class CustomPadding extends EdgeInsets{

  const CustomPadding({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
    double? horizontal,
    double? vertical,

  }) : super.only(
    left: horizontal ?? left,
    right: horizontal ?? right,
    top: vertical ?? top,
    bottom: vertical ?? bottom,
  );
}