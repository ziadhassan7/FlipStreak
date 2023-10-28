import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flip_streak/futures/app_common_views/text_view/text_view.dart';
import 'package:flutter/material.dart';


class DialogWidget {

  final BuildContext context;

  final Color backgroundColor;
  final bool disableTintColor;
  bool? isDisableButtons;

  final String dominantButtonTitle;
  final Color dominantButtonColor;
  Function()? dominantButtonFunction;

  bool? dominateButtonCloseAfterFunction;

  final Widget child;



  DialogWidget(
      this.context,
      {this.backgroundColor = Colors.white,
        this.disableTintColor = false,

        this.dominantButtonTitle = "Save",
        this.dominantButtonColor = colorAccent,
        this.dominantButtonFunction,
        this.isDisableButtons = false,

        this.dominateButtonCloseAfterFunction = true,

        required this.child,

      }) : assert(isDisableButtons != false || dominantButtonFunction != null,
        'You cannot pass a function, with isDisableButtons as true'
      ); // You can either have (isDisableButtons = true or dominantButtonFunction = object), both cannot violate the assert



  DialogWidget.info(
      this.context,
      {this.backgroundColor = Colors.white,
        this.disableTintColor = true,
        this.dominantButtonTitle = "Got it!",
        this.dominantButtonColor = colorOrange,

        required this.child,

      }){
    _showInformationDialog();
  }


  showStandardDialog() {
    showDialog<String>(
        context: context,
        builder: (BuildContext context)
        {
          return AlertDialog(
            surfaceTintColor: disableTintColor ? backgroundColor : null,
            /// Background Color
            backgroundColor: backgroundColor,

            /// Child Content Widget
            content: child,

            actions: isDisableButtons!
                ? null
                : <Widget>[
                    /// Cancel Button
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const TextView('Cancel', color: colorDark,),
                    ),

                    /// Confirm Button
                    TextButton(
                        onPressed: (){
                          dominantButtonFunction!();
                          //close window
                          if(dominateButtonCloseAfterFunction!){
                            Navigator.pop(context);
                          }
                        },

                        style: ButtonStyle(
                          //color
                          backgroundColor: MaterialStateProperty.all(
                              dominantButtonColor),
                        ),
                        //text
                        child: TextView(
                          dominantButtonTitle,
                          color: backgroundColor,
                        )),
                  ],
          );
        });

  }

  _showInformationDialog() {
    showDialog<String>(
        context: context,
        builder: (BuildContext context)
        {
          return AlertDialog(
            surfaceTintColor: disableTintColor ? backgroundColor : null,
            /// Background Color
            backgroundColor: backgroundColor,

            /// Child Content Widget
            content: SingleChildScrollView(child: child),

            actions: <Widget>[
              /// Confirm Button
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: ()=> Navigator.pop(context),

                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            dominantButtonColor),
                      ),

                      child: TextView(
                        dominantButtonTitle,
                        color: backgroundColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        });

  }
}