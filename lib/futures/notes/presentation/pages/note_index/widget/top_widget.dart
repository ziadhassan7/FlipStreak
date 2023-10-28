import 'package:flutter/material.dart';
import '../../../../../../core/constants/color_constants.dart';
import '../../../../../app_common_views/heading_image.dart';
import '../../../../../app_common_views/text_view/text_view.dart';

class NotePageTopWidget extends StatelessWidget {
  const NotePageTopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 32, left: 26),
          child: TextView("Notes", weight: FontWeight.normal, size: 42, color: colorAccent,),),

        Spacer(),

        HeadingImage("assets/headings/note_heading.svg", isSlimWidget: true,),
      ],
    );
  }
}
