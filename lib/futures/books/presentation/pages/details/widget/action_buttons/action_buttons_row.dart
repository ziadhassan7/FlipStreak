import 'package:flip_streak/futures/books/presentation/pages/details/widget/action_buttons/read_button.dart';
import 'package:flutter/material.dart';
import 'book_note_button.dart';

class ActionButtonsRow extends StatelessWidget {
  const ActionButtonsRow({Key? key, this.size = 70}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [

        /// Button - Circular Favourite
        BookNotesButton(size: size),

        /// Button - Continue Reading
        Expanded(child: ReadButton(height: size+10,)),

      ],
    );
  }

  //adaptive but not suitable for landscape tablets
  double getWidgetAdaptiveWidth(context){
    double screenWidth = MediaQuery.of(context).size.width;

    //on breakpoint
    if(screenWidth > 650){
      return 500;

    } else {
      return screenWidth *0.65;
    }
  }
}
