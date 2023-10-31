import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import '../../../app_common_views/z_dialog/z_dialog.dart';
import '../../../app_common_views/text_view/text_view.dart';
import '../manager/controller/note_controller.dart';
import '../pages/note_edit/views/editing_window.dart';


class DiscardDialog {

  BuildContext context;

  DiscardDialog(this.context,) {

    ZDialog(
        context,
        dominantButtonTitle: "Discard",
        dominantButtonColor: colorOrange,

        dominantButtonFunction: (){
          exit();
        },

        child: const TextView("Discard changes?", size: 16,)

    ).showStandardDialog();
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