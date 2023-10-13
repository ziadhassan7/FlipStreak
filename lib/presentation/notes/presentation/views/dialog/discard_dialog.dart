import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flutter/material.dart';
import '../../../../views/text_inria_sans.dart';
import '../../../../views/dialoq/dialoq_widget.dart';
import '../../manager/controller/note_controller.dart';
import '../../pages/note_edit/widget/editing_window.dart';


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

        child: TextInriaSans("Discard changes?", size: 16,)

    ).showAlert();
  }

  void exit() {
    Navigator.pop(context);
    // Clean Text Fields
    NoteController.noteTitle.clear();
    NoteController.noteBody.clear();
    //reset FormFields state
    EditingWindow.isChanged = false;
  }

}