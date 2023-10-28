import 'package:flutter/cupertino.dart';
import '../../../../app_common_views/dialoq_widget.dart';
import 'bookmark_view.dart';

class BookmarksDialog {

  BookmarksDialog(BuildContext context, List bookmarks) {
    DialogWidget(
        context,

        isDisableButtons: true,

        child: BookmarkView(list: bookmarks)

    ).showStandardDialog();
  }

}
