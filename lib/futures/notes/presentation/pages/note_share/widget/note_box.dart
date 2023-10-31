import 'package:flutter/material.dart';
import '../../../../../../core/constants/color_constants.dart';
import '../../../../../../core/styles/box_decoration.dart';
import '../../../../../../core/styles/device_screen.dart';
import '../../../../../../core/styles/padding.dart';
import '../../../../../app_common_views/text_view/text_view.dart';
import '../../../manager/controller/note_controller.dart';
import '../../../styles/custom_format.dart';

class NoteBox extends StatelessWidget {
  const NoteBox({super.key});

  @override
  Widget build(BuildContext context) {

    //variables
    final title = NoteController.noteTitle.text;
    final body = NoteController.noteBody.text;
    final bookName = NoteController.bookName.text;
    final pageNumber = NoteController.pageNumber.text;
    //checkers
    final isPageNumberEmpty = (pageNumber == "");


    return Container(
      //Settings
        width: AppScreen(context).width,
        padding: CustomPadding(horizontal: 28, bottom: 12,
          top: isPageNumberEmpty? 18 : 45,
        ),

        decoration: CustomDecoration(
          backgroundColor:  const Color(0xFFFFF5F2),
          borderColor: colorAccent.withOpacity(0.4),
          radius: 24,
          borderWidth: 2,
        ),

        //View
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///                                                                 / Note Title
            Visibility(
              visible: title != "",
              child: Column(
                children: [
                  Text(
                    title,
                    style: CustomFormat.tinos(
                        color: Colors.black,
                        isBold: true, size: 24),
                  ),

                  const SizedBox(height: 20,),
                ],
              ),
            ),

            ///                                                                 / Note Body
            Text(
              body,
              style: CustomFormat.tinos(
                  color: Colors.brown.shade900, size: 16),
            ),

            const SizedBox(height: 20,),

            TextView(getFormattedBookName(bookName), color: colorAccent, size: 12,),
          ],
        )
    );
  }

  String getFormattedBookName(String name){
    if(name == ""){
      return "";
    }
    return "- $name";
  }

  double? getHeight(String text){
    return (text.length > 400)
        ? 200 //maximum height
        : null; //adaptive
  }
}
