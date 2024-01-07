import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import '../../../../../../app_common_views/text_view/text_view.dart';
import 'add_btn.dart';


class AddWidget extends StatelessWidget {
  const AddWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20,),

      child: Container(
        width: getWidgetAdaptiveWidth(context),

        decoration: const BoxDecoration(
          color: colorSecondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), bottomLeft: Radius.circular(24),
          )),


        child: Row(
          children: [
            const Spacer(),

            const TextView(
              "Add new books",
              size: 23,
              weight: FontWeight.bold,
            ),

            AddIconButton(),
          ],
        ),
      ),
    );
  }


  double getWidgetAdaptiveWidth(context){
    double screenWidth = MediaQuery.of(context).size.width;

    //on breakpoint
    if(screenWidth > 450){
      return 400;

    } else {
      return screenWidth *0.9;
    }
  }
}
