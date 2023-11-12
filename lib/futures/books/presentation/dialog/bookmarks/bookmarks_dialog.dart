import 'package:flip_streak/futures/books/presentation/managers/state_manager/book_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app_common_views/z_dialog/z_dialog.dart';
import '../../managers/controllers/book_controller.dart';
import 'bookmark_view.dart';

class BookmarksDialog {

  BuildContext context;
  WidgetRef ref;

  BookmarksDialog(this.context, this.ref) {
    ZDialog.custom(
        context,

        view: view()

    );
  }


  Widget view(){

    return Consumer(
      builder: (context, ref, _) {

        ref.watch(bookListProvider);

        return FutureBuilder(
          future: getBookmarkedPages(bookModel.id),
          builder: (context, AsyncSnapshot<List<String>> snapshot){

            if(snapshot.hasData){
              return BookmarkView(list: snapshot.data!);

            } else {
              return const Center(child: CircularProgressIndicator(),);
            }
          }
        );
      }
    );

  }

}
