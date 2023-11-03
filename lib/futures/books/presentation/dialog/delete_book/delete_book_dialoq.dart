import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/shared_pref/hive_client.dart';
import '../../../../../../core/utils/file_util.dart';
import '../../../../app_common_views/z_dialog/z_dialog.dart';
import '../../../../app_common_views/text_view/text_view.dart';
import '../../managers/state_manager/book_list_provider.dart';
import '../../managers/state_manager/last_book_provider.dart';


class DeleteBookDialog {

  BuildContext context;
  WidgetRef ref;
  String bookId;
  String filePath;

  HiveClient hiveClient = HiveClient();

  DeleteBookDialog( this.context, this.ref, {required this.bookId, required this.filePath}) {

    ZDialog(
        context,
        dominantButtonTitle: "Delete",
        dominantButtonColor: const Color.fromRGBO(140, 0, 0, 1),

        dominantButtonFunction: (){
          deleteBook();
        },

        child: const TextView("Delete this book?", weight: FontWeight.bold, color: colorDark,)

    );
  }

  Future<void> deleteBook() async {
    bool isDeleted = await FileUtility.deleteFile(bookId, filePath);


    if(isDeleted) {
      //delete book from lastBookWidget
      deleteLastBookWidget();
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