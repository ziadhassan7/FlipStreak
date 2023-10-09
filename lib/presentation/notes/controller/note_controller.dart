import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/model/note_model.dart';
import '../../../provider/note_list_provider.dart';

class NoteController {

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static final TextEditingController noteTitle = TextEditingController();
  static final TextEditingController noteBody = TextEditingController();

  void saveNote(WidgetRef ref,) {
    //Get Title
    String? title;
    if(noteTitle.text.isNotEmpty) title = noteTitle.text;

    //Get Body
    String body = noteBody.text;

    //Add new Note, and refresh providers
    ref.read(noteListProvider.notifier).addNote(
        NoteModel(
            noteId: DateTime.now().toString(),
            noteTitle: title,
            noteBody: body,
            /// todo
            notePage: 0,
            noteBookName: ""));
  }
}