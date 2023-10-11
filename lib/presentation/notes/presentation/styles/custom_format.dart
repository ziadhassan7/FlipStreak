import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../app_constants/color_constants.dart';

class CustomFormat{


  /// TextFormField (Title-normal)
  static TextStyle formField({required bool isTitle}){
    return TextStyle(
        fontSize: isTitle ? 34 : 20,
        fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
      color: Colors.black
    );
  }

  /// Text (bold, accent)
  static TextStyle textInriaSans({double? size, Color? color, bool isBold = false}){
    return GoogleFonts.inriaSans(
        fontSize: size,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: color ?? colorAccent,
    );
  }

  static TextStyle tinos({double? size, Color? color, bool isBold = false}){
    return GoogleFonts.tinos(
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
      textStyle: MaterialStateProperty.all(GoogleFonts.inriaSans(fontWeight: FontWeight.bold, fontSize: 15)),
    );
  }
}