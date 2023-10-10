import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flip_streak/presentation/notes/presentation/manager/riverpod/note_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../business/file_util.dart';
import '../../../../data/shared_pref/hive_client.dart';
import '../../../../provider/book_list_provider.dart';
import '../../../../provider/last_book_provider.dart';
import '../../text_inria_sans.dart';
import '../dialoq_widget.dart';


class DeleteBookDialog {

  BuildContext context;
  WidgetRef ref;
  String bookId;

  HiveClient hiveClient = HiveClient();

  DeleteBookDialog( this.context, this.ref, {required this.bookId}) {

    DialogWidget(
        context,
        dominantButtonTitle: "Delete",
        dominantButtonColor: const Color.fromRGBO(140, 0, 0, 1),

        dominantButtonFunction: (){
          deleteBook();
        },

        child: TextInriaSans("Delete this book?", weight: FontWeight.bold, color: colorDark,)

    ).showAlert();
  }

  Future<void> deleteBook() async {
    bool isDeleted = await FileUtility.deleteFile(bookId);


    if(isDeleted) {
      //delete book from lastBookWidget
      deleteLastBookWidget();
      //Delete all book's note
      ref.read(noteListProvider.notifier).deleteAllNotesInBook(bookId);
      //Refresh List
      ref.refresh(bookListProvider);
      print('delete successful');
    } else {
      print('delete not successful');
    }
  }

  deleteLastBookWidget() async {
    String lastBookWidgetName = await hiveClient.getLastBook();
    if(lastBookWidgetName == bookId){
      ref.read(lastBookProvider.notifier).deleteData();
    }
  }

}