import 'package:flutter/cupertino.dart';
import '../../../../app_common_views/z_dialog/z_dialog.dart';
import 'bookmark_view.dart';

class BookmarksDialog {

  BookmarksDialog(BuildContext context, List bookmarks) {
    ZDialog(
        context,

        isDisableButtons: true,

        child: BookmarkView(list: bookmarks)

    ).showStandardDialog();
  }

}
