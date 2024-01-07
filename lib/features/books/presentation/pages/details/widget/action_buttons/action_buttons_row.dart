import 'package:flip_streak/features/books/presentation/pages/details/widget/action_buttons/read_button.dart';
import 'package:flutter/material.dart';
import 'book_note_button.dart';

class ActionButtonsRow extends StatelessWidget {
  const ActionButtonsRow({Key? key, this.size = 70}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        /// Button - Circular Favourite
        BookNotesButton(size: size),

        /// Button - Continue Reading
        Expanded(child: ReadButton(height: size+10,))

      ],
    );
  }


  Widget _adaptiveReadButton(double screenWidth, double widgetHeight){

    if(screenWidth > 700) {
      return SizedBox(
        width: 300,
        child: ReadButton(height: widgetHeight,),
      );

    } else {
      return Expanded(child: ReadButton(height: widgetHeight,));
    }
  }
}
