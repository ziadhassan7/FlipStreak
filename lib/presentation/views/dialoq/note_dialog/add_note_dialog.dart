import 'package:flip_streak/presentation/views/dialoq/note_dialog/note_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../business/app_wise/controllers/book_controller.dart';
import '../../../../data/local_db/note_client.dart';
import '../../../../data/model/note_model.dart';
import '../../../../provider/note_list_provider.dart';
import '../dialoq_widget.dart';

class AddNoteDialog {

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static final TextEditingController noteTitleController = TextEditingController();
  static final TextEditingController noteBodyController = TextEditingController();

  final NoteClient noteClient = NoteClient.instance;


  AddNoteDialog(BuildContext context, WidgetRef ref, {String? selectedText}) {

    if(selectedText != null) noteBodyController.text = selectedText; //Get selected text

    DialogWidget(
        context,

        dominantButtonFunction: () async {
          if (formKey.currentState!.validate()) {
            saveNote(ref);
            noteTitleController.clear();
            noteBodyController.clear();
          }
        },

        child: const NoteView(),

    ).showAlert();
  }

  void saveNote(WidgetRef ref,) {
    //Get Title
    String? title;
    if(noteTitleController.text.isNotEmpty) title = noteTitleController.text;

    //Get Body
    String body = noteBodyController.text;

    //Add new Note, and refresh providers
    ref.read(noteListProvider.notifier).addNote(
        NoteModel(
          noteId: DateTime.now().toString(),
          noteTitle: title,
          noteBody: body,
          notePage: bookModel.lastPage,
          noteBookName: bookModel.id));
  }

}
