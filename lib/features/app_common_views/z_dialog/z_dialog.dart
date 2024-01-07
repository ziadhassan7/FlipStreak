import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flip_streak/features/app_common_views/text_view/text_view.dart';
import 'package:flutter/material.dart';


class ZDialog {

  final BuildContext context;

  final Color backgroundColor;
  final bool disableTintColor;

  String? mainButtonTitle;
  Color? mainButtonColor;
  Function()? mainButtonFunction;
  Function()? cancelButtonFunction;
  bool? closeOnMainButton;

  String? trailingButtonTitle;
  Function()? trailingButtonFunction;

  Widget? child;


  ///                                                                           /Standard Dialog
  /// normal dialog with action_button, and cancel_button
  ZDialog(
      this.context,
      {this.backgroundColor = Colors.white,
        this.disableTintColor = false,

        this.mainButtonTitle = "Save",
        this.mainButtonColor = colorAccent,
        required this.mainButtonFunction,
        this.cancelButtonFunction,

        this.closeOnMainButton = true,

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
            content: SingleChildScrollView(child: child),

            actions: <Widget>[
              /// Cancel Button
              TextButton(
                onPressed: () {
                  if(cancelButtonFunction != null){
                    cancelButtonFunction!();
                  }
                  Navigator.pop(context);
                },
                child: const TextView('Cancel', color: colorDark,),
              ),

              /// Confirm Button
              TextButton(
                  onPressed: (){
                    mainButtonFunction!();
                    //close window
                    if(closeOnMainButton!){
                      Navigator.pop(context);
                    }
                  },

                  style: ButtonStyle(
                    //color
                    backgroundColor: MaterialStateProperty.all(
                        mainButtonColor),
                  ),
                  //text
                  child: TextView(
                    mainButtonTitle!,
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

        this.mainButtonTitle = "Got it!",
        this.mainButtonColor = colorAccent,

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
                            mainButtonColor),
                      ),

                      child: TextView(
                        mainButtonTitle!,
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
  ZDialog.trailingAction(
      this.context,
      {this.backgroundColor = Colors.white,
        this.disableTintColor = true,

        this.mainButtonTitle = "Got it!",
        this.mainButtonColor = colorAccent,

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
                          mainButtonColor),
                    ),

                    child: TextView(
                      mainButtonTitle!,
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
      this.disableTintColor = false,
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
            surfaceTintColor: disableTintColor ? backgroundColor : null,
            backgroundColor: backgroundColor,
            /// Child Content Widget
            content: SingleChildScrollView(child: widget),
          );
        });

  }

}