import 'package:flip_streak/futures/app_common_views/text_view/text_view.dart';
import 'package:flip_streak/futures/app_common_views/z_dialog/z_dialog.dart';
import 'package:flip_streak/futures/books/presentation/managers/state_manager/bookmark_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RemoveBookmarkDialog {

  final BuildContext context;
  final WidgetRef ref;

  RemoveBookmarkDialog(this.context, this.ref, String page) {
    ZDialog(
      context,

      mainButtonTitle: "Remove",
      mainButtonFunction: () => removeBookmark(page),

      child: const TextView("Remove this page from bookmarks?"),
    );
  }


  removeBookmark(String page){
    ref.read(bookmarkListProvider.notifier).removePageFromBookmark(page);
  }

}


