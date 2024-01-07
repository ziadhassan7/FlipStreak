import 'package:flutter/material.dart';
import '../../../../core/constants/color_constants.dart';

class CustomFormat{

  /// TextFormField (Title-normal)
  static TextStyle formField({required bool isTitle}){
    return TextStyle(
        fontSize: isTitle ? 34 : 20,
        fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
      color: Colors.black
    );
  }

  /// Text Style
  static TextStyle tinos({double? size, Color? color, bool isBold = false}){
    return TextStyle(
      fontFamily: 'Tinos',
      fontSize: size,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      color: color ?? colorAccent,
    );
  }

  /// ElevatedButton (accent, white text, bold)
  static button(){
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(colorAccent),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      textStyle: MaterialStateProperty.all(const TextStyle(fontFamily: 'InriaSans',fontWeight: FontWeight.bold, fontSize: 15)),
    );
  }
}