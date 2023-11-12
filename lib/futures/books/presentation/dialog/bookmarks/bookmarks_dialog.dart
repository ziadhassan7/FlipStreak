import 'package:flip_streak/futures/books/presentation/managers/state_manager/bookmark_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app_common_views/z_dialog/z_dialog.dart';
import 'bookmark_view.dart';

class BookmarksDialog {

  BuildContext context;

  BookmarksDialog(this.context,) {
    ZDialog.custom(
        context,

        view: view()

    );
  }


  Widget view(){

    return Consumer(
      builder: (context, ref, _) {

        return BookmarkView(list: ref.watch(bookmarkListProvider));
      }
    );

  }

}
