import 'package:flutter/material.dart';


   /// App Colors
   const Color colorBackground = Color.fromRGBO(255, 253, 251, 1.0);
   const Color colorPrimary = Color.fromRGBO(255, 242, 230, 1);
   const Color colorSecondary = Color.fromRGBO(255, 230, 208, 1);
   const Color colorDark = Color.fromRGBO(30, 26, 29, 1);
   const Color colorLastBookWidget = Color.fromRGBO(46, 46, 65, 1);
   const Color colorAccent = Color.fromRGBO(199, 70, 53, 1);
   const Color colorOrange = Color.fromRGBO(244, 104, 62, 1);
   const Color colorBrown = Color.fromRGBO(42, 9, 4, 1.0);


   /// Dark Screen Color
   const Color darkPrimary = Color.fromRGBO(46, 46, 46, 1);
   const Color darkSecondary = Color.fromRGBO(217, 217, 217, 1);

   /// Book Screen
   const Color dominateColor = colorBackground;
   const Color subColor = colorAccent;



   /// Color Icons (for filters)
   const Color colorNormalPage = Colors.white;
   const Color colorGreyedLook = Color.fromRGBO(208, 208, 208, 1);
   const Color colorEyeCare = Color.fromRGBO(237, 209, 176, 1);
   const Color colorDarkPage = Color.fromRGBO(39, 41, 45, 1);


   /// Page Filters
   const ColorFilter filterNormalPage=
   ColorFilter.mode(Color.fromRGBO(0,0,0, 0), BlendMode.darken);

   const ColorFilter filterGreyedLook=
   ColorFilter.mode(Color.fromRGBO(26,26,26, 0.1), BlendMode.darken);

   const ColorFilter filterEyeCare=
   ColorFilter.mode(Color.fromRGBO(255, 221, 202, 0.7019607843137254), BlendMode.darken);

   const ColorFilter filterDarkPage=
   ColorFilter.mode(Color.fromRGBO(255,255,255, 0.84), BlendMode.difference);



