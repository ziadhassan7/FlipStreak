import 'package:flutter/widgets.dart';

class CustomPadding extends EdgeInsets{

  /// Custom Padding
  /// You can specify [left] or [right] padding, or [horizontal] for both,
  /// You can specify [top] or [bottom] padding, or [vertical] for both,
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


  /// Apply overall padding
  const CustomPadding.all(double value) : super.all(value);
}