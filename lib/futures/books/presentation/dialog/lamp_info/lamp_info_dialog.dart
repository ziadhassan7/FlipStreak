import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flip_streak/core/styles/padding.dart';
import 'package:flip_streak/futures/app_common_views/z_dialog/z_dialog.dart';
import 'package:flip_streak/futures/goal/presentation/dialog/edit_today_goal/edit_pages_goal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/styles/box_decoration.dart';
import '../../../../app_common_views/text_view/text_view.dart';



class LampInfoDialog {

  static const _backgroundColor = Color.fromRGBO(248, 233, 193, 0.6);
  static const _foregroundColor = Color.fromRGBO(217, 143, 12, 1.0);

  String pagesRead, pagesGoal;

  LampInfoDialog(BuildContext context, WidgetRef ref, this.pagesRead, this.pagesGoal){
    ZDialog.twoAction(
      context,

      trailingButtonTitle: "Change Goal",
      trailingButtonFunction: ()=> changeGoal(context, ref),

      child: view(),
    );
  }

  changeGoal(context, ref){
    EditPagesGoal(context, ref);
  }


  Widget view(){
    return Padding(
      padding: const CustomPadding(vertical: 10, horizontal: 8),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _getLamp(),

          TextView(
            "You've set your daily goal to\n'reading $pagesGoal pages'",

            weight: FontWeight.bold,
            size: 16,
            color: colorBrown,
            maxLine: 3,
          ),

          const SizedBox(height: 18,),


          RichText(
            text: const TextSpan(
              // Note: Styles for TextSpans must be explicitly defined.
              // Child text spans will inherit styles from parent
              style: TextStyle(
                fontSize: 15,
                color: colorBrown,
              ),
              children: <TextSpan>[
                TextSpan(text: 'When you finish your goal,\nthe lamp will'),
                TextSpan(text: ' glow!', style: TextStyle(fontWeight: FontWeight.bold, color: _foregroundColor,)),
              ],
            ),
          )

        ],
      ),
    );
  }


  static _getLamp(){
    return Padding(
      padding: const CustomPadding.all(15),

      child: Container(
        padding: const CustomPadding(vertical: 8, horizontal: 14),
        decoration: CustomDecoration(backgroundColor: _backgroundColor, radius: 24),

        child: const Icon(Icons.lightbulb, color: _foregroundColor, size: 100,),
      ),
    );
  }

}
