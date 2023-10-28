import 'package:flutter/material.dart';
import '../../../../../../core/constants/color_constants.dart';
import '../../../../../../core/styles/padding.dart';
import '../../../../../app_common_views/text_view/text_view.dart';
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
                    const TextView("pg.", color: Colors.white, size: 12,),
                    TextView(pageNumber, color: Colors.white, size: 12,),
                  ],
                )),

            const SizedBox(width: 40,)
          ],
        ),
      );
  }
}
