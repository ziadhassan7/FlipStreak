import 'package:flutter/material.dart';
import '../../../../../../app_constants/color_constants.dart';
import '../../../../../styles/padding.dart';
import '../../../../../views/text_inria_sans.dart';
import '../../../manager/controller/note_controller.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key});

  @override
  Widget build(BuildContext context) {

    final pageNumber = NoteController.pageNumber.text;

    return /// Page indicator
      Visibility(
        visible: pageNumber != "",
        child: Row(
          children: [
            const Spacer(),
            Container(
                padding: const CustomPadding(vertical: 4, horizontal: 10),
                decoration: const BoxDecoration(
                  color: colorAccent,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40.0),
                      bottomLeft: Radius.circular(40.0)),
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextInriaSans("pg.", color: Colors.white, size: 12,),
                    TextInriaSans(pageNumber, color: Colors.white, size: 12,),
                  ],
                )),

            const SizedBox(width: 40,)
          ],
        ),
      );
  }
}
