import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flutter/material.dart';
import '../../../../views/text_inria_sans.dart';
import '../../../../views/dialoq/dialoq_widget.dart';
import '../../manager/controller/note_controller.dart';


class DiscardDialog {

  BuildContext context;

  DiscardDialog(this.context,) {

    DialogWidget(
        context,
        dominantButtonTitle: "Discard",
        dominantButtonColor: colorOrange,

        dominantButtonFunction: (){
          exit();
        },

        child: TextInriaSans("You will lose your note..", color: colorDark, size: 16,)

    ).showAlert();
  }

  void exit() {
    Navigator.pop(context);
    // Clean Text Fields
    NoteController.noteTitle.clear();
    NoteController.noteBody.clear();
  }

}