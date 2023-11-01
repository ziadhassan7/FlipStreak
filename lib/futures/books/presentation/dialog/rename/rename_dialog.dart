import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flip_streak/futures/app_common_views/z_dialog/z_dialog.dart';
import 'package:flip_streak/futures/books/presentation/dialog/rename/widgets/book_name_text_input.dart';
import 'package:flip_streak/futures/books/presentation/managers/state_manager/book_list_provider.dart';
import 'package:flip_streak/futures/notes/presentation/manager/state_manager/note_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/model/book_model.dart';


class RenameDialog {

  final BuildContext context;
  final WidgetRef ref;

  final BookModel book;
  static final TextEditingController controller = TextEditingController();

  RenameDialog(this.context, this.ref, {required this.book}) {


    ZDialog(
        context,
        dominantButtonTitle: "Save",
        dominantButtonColor: colorAccent,

        dominantButtonFunction: (){
          changeBookName();
        },

        child: const BookNameTextInput(),

    );
  }


  changeBookName(){
    BookModel oldBook = book;
    String newName = controller.text;

    //make sure there is a new name
    if(newName.isNotEmpty){
      //rename book
      ref.read(bookListProvider.notifier).renameBook(newName, oldBook);
      //rename book for all notes associated
      ref.read(noteListProvider.notifier).renameBookForAllNotes(oldBook.id, newName);
      //clear dialog old text
      controller.clear();
    }
  }

}