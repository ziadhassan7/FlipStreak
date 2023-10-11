import 'package:flip_streak/presentation/notes/presentation/manager/riverpod/note_detail_provider/book_name_provider.dart';
import 'package:flip_streak/presentation/notes/presentation/manager/riverpod/note_detail_provider/page_number_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/model/note_model.dart';
import '../riverpod/note_list_provider.dart';

class NoteController {

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //Title, Body
  static final TextEditingController noteTitle = TextEditingController();
  static final TextEditingController noteBody = TextEditingController();
  //Book name, Page Number
  static final TextEditingController bookName = TextEditingController();
  static final TextEditingController pageNumber = TextEditingController();

  void saveNote(WidgetRef ref,) {
    //Get Title
    String? title;
    if(noteTitle.text.isNotEmpty) title = noteTitle.text;

    //Get Body
    String body = noteBody.text;

    //Get Book name , page number
    String bookName = ref.watch(bookNameProvider);
    String pageNumber = ref.watch(pageNumberProvider);

    //Add new Note, and refresh providers
    ref.read(noteListProvider.notifier).addNote(
        NoteModel(
            noteId: DateTime.now().toString(),
            noteTitle: title,
            noteBody: body,
            // book details
            notePage: pageNumber,
            noteBookName: bookName));
  }
}