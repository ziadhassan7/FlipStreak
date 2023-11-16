import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app_common_views/z_dialog/z_dialog.dart';
import '../../../app_common_views/text_view/text_view.dart';
import '../manager/controller/note_controller.dart';
import '../pages/note_edit/views/editing_window.dart';


class DiscardDialog {

  BuildContext context;
  WidgetRef ref;

  DiscardDialog(this.context, this.ref) {

    ZDialog(
        context,
        dominantButtonTitle: "Discard",
        dominantButtonColor: colorOrange,

        dominantButtonFunction: (){
          exit();
        },

        child: const TextView("Discard changes?", size: 16,)

    );
  }

  void exit() {
    Navigator.pop(context);
    // Clean Text Fields
    NoteController.clearAndRefresh(ref);
    //reset FormFields state
    EditingWindow.isChanged = false;
  }

}