import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../manager/riverpod/note_list_provider.dart';
import '../../../../views/text_inria_sans.dart';
import '../../../../views/dialoq/dialoq_widget.dart';


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

        child: TextInriaSans("Delete this item?", weight: FontWeight.bold, color: colorDark,)

    ).showStandardDialog();
  }

  void deleteNote(WidgetRef ref, String noteId) {
    //delete note
    ref.read(noteListProvider.notifier).deleteNote(noteId);
  }

}