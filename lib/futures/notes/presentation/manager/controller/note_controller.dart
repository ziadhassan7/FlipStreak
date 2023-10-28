import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/model/note_model.dart';
import '../state_manager/note_detail_provider/book_name_provider.dart';
import '../state_manager/note_detail_provider/page_number_provider.dart';
import '../state_manager/note_list_provider.dart';

class NoteController {

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //Title, Body
  static final TextEditingController noteTitle = TextEditingController();
  static final TextEditingController noteBody = TextEditingController();
  //Book name, Page Number
  static final TextEditingController bookName = TextEditingController();
  static final TextEditingController pageNumber = TextEditingController();

  void saveNote(WidgetRef ref, String? currentNoteId) {
    //Get Title
    String? title;
    if(noteTitle.text.isNotEmpty) title = noteTitle.text;

    //Get Body
    String body = noteBody.text;

    //Get Book name , page number
    String bookName = ref.watch(bookNameProvider);
    String pageNumber = ref.watch(pageNumberProvider);

    //Save Note
    if(currentNoteId == null){
      saveNew(ref, title, body, bookName, pageNumber);
    } else {
      updateNote(ref, currentNoteId, title, body, bookName, pageNumber);
    }

    //Start fresh next time
    _clearAllValues(ref);
  }

  void saveNew(
      WidgetRef ref,
      String? title, String body, String bookName, String pageNumber){

    //Update current Note, and refresh providers
    ref.read(noteListProvider.notifier).addNote(
        NoteModel(
            noteId: DateTime.now().toString(),
            noteTitle: title,
            noteBody: body,
            // book details
            notePage: pageNumber,
            noteBookName: bookName));

  }

  void updateNote(
      WidgetRef ref, String currentNoteId,
      String? title, String body, String bookName, String pageNumber){

    //Add new Note, and refresh providers
    ref.read(noteListProvider.notifier).updateNote(
        NoteModel(
            noteId: currentNoteId,
            noteTitle: title,
            noteBody: body,
            // book details
            notePage: pageNumber,
            noteBookName: bookName));

  }

  void _clearAllValues(WidgetRef ref){
    //clear note details
    noteTitle.clear();
    noteBody.clear();

    //clear book related details
    bookName.clear();
    pageNumber.clear();
    ref.read(bookNameProvider.notifier).clear();
    ref.read(pageNumberProvider.notifier).clear();
  }
}