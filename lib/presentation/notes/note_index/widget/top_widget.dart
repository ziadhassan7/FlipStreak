import 'package:flutter/material.dart';
import '../../../../app_constants/color_constants.dart';
import '../../../views/heading_image.dart';
import '../../../views/text_inria_sans.dart';

class NotePageTopWidget extends StatelessWidget {
  const NotePageTopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 36, left: 26),
          child: TextInriaSans("Notes", weight: FontWeight.bold, size: 34, color: colorAccent,),),

        const Spacer(),

        const HeadingImage("assets/headings/note_heading.svg", isSlimWidget: true,),
      ],
    );
  }
}
