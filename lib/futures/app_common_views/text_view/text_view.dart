import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum FontFamily {
  inriaSans,
  poppins,
  roboto,

  //nunitoSans,
  //timesNewRoman,
  //montserrat,
  //inter,
  //inder,
  //Comfortaa,

}

class TextView extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final int? maxLine;
  final bool? softWrap;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final double scale;
  final FontFamily? fontFamily;
  static FontFamily? defaultFontFamily;

  const TextView(
      this.text,
      {
        Key? key,
        this.size,
        this.weight,
        this.color,
        this.maxLine,
        this.softWrap,
        this.overflow = TextOverflow.ellipsis,
        this.textAlign = TextAlign.start,
        this.textDirection,
        this.scale = 1,
        this.fontFamily
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      textAlign: textAlign,
      maxLines: maxLine,
      softWrap: softWrap,
      textDirection: textDirection,
      overflow: overflow,

      style: getTheme(
        size: (size!=null)? size!*scale : size,
        weight: weight,
        color: color,
      ),

    );
  }

  TextStyle getTheme({double? size, FontWeight? weight, Color? color}){

    //get default font
    FontFamily? currentFamily = defaultFontFamily;

    //override, if provided a font family
    if(fontFamily != null){
      currentFamily = fontFamily;
    }


    switch (currentFamily) {
    //InriaSans
      case FontFamily.inriaSans:
        return GoogleFonts.inriaSans(fontSize: size, fontWeight: weight, color: color);
    //Poppins
      case FontFamily.poppins:
        return GoogleFonts.poppins(fontSize: size, fontWeight: weight, color: color);
    //Roboto
      case FontFamily.roboto:
        return GoogleFonts.roboto(fontSize: size, fontWeight: weight, color: color);

    //default - null
      case null:
        return TextStyle(fontSize: size, fontWeight: weight, color: color);
    }

  }

}