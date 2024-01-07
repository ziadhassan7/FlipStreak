import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key,
        required this.menuItems,
        required this.functions,
        this.backgroundColor = colorBackground,
        this.foregroundColor = colorAccent,
        this.iconColor = colorAccent,
  }) : super(key: key);

  //Colors
  final Color backgroundColor;
  final Color foregroundColor;
  final Color iconColor;
  //Main
  final List<PopupMenuEntry<int>> menuItems;
  final Function(int) functions;

  @override
  Widget build(BuildContext context) {

      return Consumer(
        builder: (context, ref, _) {
          return PopupMenuButton(
              icon: Icon(Icons.more_vert, color: iconColor,),
              color: backgroundColor,
              surfaceTintColor: backgroundColor,
              elevation: 10,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),

              itemBuilder: (context) => menuItems, //widgets

              onSelected: functions,
          );
        }
      );
  }
}
