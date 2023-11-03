import 'package:flip_streak/futures/books/presentation/dialog/rename/manager/state_manager/rename_book_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../notes/presentation/manager/state_manager/note_list_provider.dart';
import '../../../../../data/model/book_model.dart';
import '../../../../managers/controllers/book_controller.dart';
import '../../../../managers/state_manager/book_list_provider.dart';

class RenameManager {

  static Future<bool> _isDuplicate(String fileName) async {
    List<BookModel> all = await bookClient.readAllElements();

    for(int i =0; i<all.length; i++) {
      if (all[i].id == fileName) return true;
    }

    return false;
  }


  static changeBookName(BuildContext context, WidgetRef ref,
      {required BookModel oldBook,
      required TextEditingController controller}) async {

    String newName = controller.text;

    //make sure there is a new name
    if(newName.isNotEmpty){

      _isDuplicate(newName).then((isDuplicate) {
        if(isDuplicate){
          //show status message: "No duplicates"
          ref.read(renameStatusMessageProvider.notifier).show();

        } else {
          //hide status message
          ref.read(renameStatusMessageProvider.notifier).hide();
          //rename book
          ref.read(bookListProvider.notifier).renameBook(newName, oldBook);
          //rename book for all notes associated
          ref.read(noteListProvider.notifier).renameBookForAllNotes(oldBook.id, newName);
          //clear dialog old text
          controller.clear();
          //close Dialog
          Navigator.pop(context);
        }
      });

    }
  }

}