import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../app_constants/color_constants.dart';

class CustomStyles{


  /// TextFormField (Title-normal)
  static TextStyle formField({required bool isTitle}){
    return TextStyle(
        fontSize: isTitle ? 34 : 20,
        fontWeight: isTitle ? FontWeight.bold : FontWeight.normal
    );
  }

  /// Text (bold, accent)
  static TextStyle text({double? size, Color? color, FontWeight? weight}){
    return GoogleFonts.inriaSans(
        fontSize: size,
        fontWeight: weight ?? FontWeight.bold,
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