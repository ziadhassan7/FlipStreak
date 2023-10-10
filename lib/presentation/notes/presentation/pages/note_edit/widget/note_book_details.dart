import 'package:flip_streak/presentation/styles/padding.dart';
import 'package:flutter/material.dart';
import '../../../../../../app_constants/color_constants.dart';
import '../../../../../styles/box_decoration.dart';
import '../../../styles/custom_format.dart';

class NoteBookDetails extends StatelessWidget {
  const NoteBookDetails({super.key});

  static const double opacity = 0.7;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///                                                                     / Book Name
        customViewButton("Book Name"),

        ///                                                                     / Page Number
        customViewButton("Pg. 7"),
      ],
    );
  }

  Widget customViewButton(String text){
    return Padding(
      padding: const CustomPadding(right: 12),

      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: CustomDecoration(
            backgroundColor: Colors.white,
            radius: 30,
            borderColor: colorAccent.withOpacity(opacity)
        ),

        child: Text(text, style: CustomFormat.textInriaSans(
            color: colorAccent.withOpacity(opacity)),
        ),
      ),
    );
  }
}
