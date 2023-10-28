import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app_common_views/dialoq_widget.dart';
import '../../../app_common_views/text_view/text_view.dart';
import '../manager/state_manager/note_list_provider.dart';


class DeleteNoteDialog {

  BuildContext context;
  WidgetRef ref;
  String noteId;

  DeleteNoteDialog( this.context, this.ref, {required this.noteId}) {

    DialogWidget(
        context,
        dominantButtonTitle: "Delete",
        dominantButtonColor: const Color.fromRGBO(140, 0, 0, 1),

        dominantButtonFunction: (){
          deleteNote(ref, noteId);
        },

        child: const TextView("Delete this item?", weight: FontWeight.bold, color: colorDark,)

    ).showStandardDialog();
  }

  void deleteNote(WidgetRef ref, String noteId) {
    //delete note
    ref.read(noteListProvider.notifier).deleteNote(noteId);
  }

}