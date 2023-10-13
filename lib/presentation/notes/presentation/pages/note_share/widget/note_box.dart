import 'package:flip_streak/presentation/views/text_inria_sans.dart';
import 'package:flutter/material.dart';
import '../../../../../../app_constants/color_constants.dart';
import '../../../../../styles/box_decoration.dart';
import '../../../../../styles/device_screen.dart';
import '../../../../../styles/padding.dart';
import '../../../manager/controller/note_controller.dart';
import '../../../styles/custom_format.dart';

class NoteBox extends StatelessWidget {
  const NoteBox({super.key});

  @override
  Widget build(BuildContext context) {

    final title = NoteController.noteTitle.text;
    final body = NoteController.noteBody.text;
    final bookName = NoteController.bookName.text;


    return Container(
      //Settings
        width: DeviceScreen(context).width,
        padding: const CustomPadding(horizontal: 28, top: 45, bottom: 12),

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
            SizedBox(
              height: getHeight(body),
              child: Text(
                body,
                style: CustomFormat.tinos(
                    color: Colors.brown.shade900, size: 16),
              ),
            ),

            const SizedBox(height: 20,),

            TextInriaSans(getFormattedBookName(bookName), color: colorAccent, size: 12,),
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
