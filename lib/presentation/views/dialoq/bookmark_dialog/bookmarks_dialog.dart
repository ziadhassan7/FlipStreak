import 'package:flip_streak/presentation/views/dialoq/bookmark_dialog/bookmark_view.dart';
import 'package:flutter/material.dart';
import '../dialoq_widget.dart';

class BookmarksDialog {

  BookmarksDialog(BuildContext context, List bookmarks) {
    DialogWidget(
        context,

        isDisableButtons: true,

        child: BookmarkView(list: bookmarks)

    ).showStandardDialog();
  }

}
