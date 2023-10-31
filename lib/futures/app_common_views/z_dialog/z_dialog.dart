import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flip_streak/futures/app_common_views/text_view/text_view.dart';
import 'package:flutter/material.dart';


class ZDialog {

  final BuildContext context;

  final Color backgroundColor;
  final bool disableTintColor;

  String? dominantButtonTitle;
  Color? dominantButtonColor;
  Function()? dominantButtonFunction;
  bool? dominateButtonCloseAfterFunction;

  String? trailingButtonTitle;
  Function()? trailingButtonFunction;

  Widget? child;


  ///                                                                           /Standard Dialog
  /// normal dialog with action_button, and cancel_button
  ZDialog(
      this.context,
      {this.backgroundColor = Colors.white,
        this.disableTintColor = false,

        this.dominantButtonTitle = "Save",
        this.dominantButtonColor = colorAccent,
        this.dominantButtonFunction,

        this.dominateButtonCloseAfterFunction = true,

        required this.child,

      }){
        _showStandardDialog();
      }

  _showStandardDialog() {
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

            actions: <Widget>[
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
                    dominantButtonTitle!,
                    color: backgroundColor,
                  )),
            ],
          );
        });

  }


  ///                                                                           /Info Dialog
  /// Inform user of what he should do
  /// Has one button with no function: "Got It"
  ZDialog.info(
      this.context,
      {this.backgroundColor = Colors.white,
        this.disableTintColor = true,

        this.dominantButtonTitle = "Got it!",
        this.dominantButtonColor = colorOrange,

        required this.child,

      }){
    _showInformationDialog();
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
                        dominantButtonTitle!,
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


  ///                                                                           /TwoAction Dialog
  /// Dialog that has a main_action_button
  /// and a trailing_action_button , on the left
  ZDialog.twoAction(
      this.context,
      {this.backgroundColor = Colors.white,
        this.disableTintColor = true,

        this.dominantButtonTitle = "Got it!",
        this.dominantButtonColor = colorAccent,

        required this.trailingButtonTitle,
        required this.trailingButtonFunction,

        required this.child,

      }){
    _showTwoActionDialog();
  }

  _showTwoActionDialog() {
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
                  TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                      trailingButtonFunction!();
                    },
                    child: TextView(trailingButtonTitle!, color: colorAccent, size: 14,),
                  ),

                  const Spacer(),

                  ElevatedButton(
                    onPressed: ()=> Navigator.pop(context),

                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          dominantButtonColor),
                    ),

                    child: TextView(
                      dominantButtonTitle!,
                      color: backgroundColor,
                    ),
                  ),
                ],
              ),
            ],
          );
        });

  }


  ///                                                                           /Custom Dialog
  /// Shows your custom view
  ZDialog.custom(
    this.context,
    {
      this.backgroundColor = Colors.white,
      this.disableTintColor = true,
      required Widget view,
    }){
    _showCustomDialog(view);
  }

  _showCustomDialog(Widget widget) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context)
        {
          return AlertDialog(
            /// Child Content Widget
            content: SingleChildScrollView(child: widget),
          );
        });

  }

}