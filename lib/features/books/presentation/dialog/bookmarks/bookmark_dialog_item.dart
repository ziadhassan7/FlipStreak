import 'package:flip_streak/features/books/presentation/pages/book/viewer_engine/controller/reader_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app_common_views/book_thumbnail.dart';
import '../../../../app_common_views/text_view/text_view.dart';
import '../../managers/controllers/book_controller.dart';
import '../remove_bookmark/remove_bookmark_dialog.dart';

class BookmarkDialogItem extends ConsumerWidget {
  const BookmarkDialogItem({Key? key, required this.dialogContext, required this.page}) : super(key: key);

  final BuildContext dialogContext;
  final String page;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(

      // click handler
      onTap: () {
        ReaderController.setCurrentPage(int.parse(page));
        Navigator.pop(dialogContext);
      },
      onLongPress: (){
        RemoveBookmarkDialog(context, ref, page);
      },

      // widget
      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          Expanded(
            child: BookThumbnail(
              filePath: bookModel.path,
              page: int.parse(page) - 1, //This package starts page 1 with 0
            ),
          ),

          const SizedBox(height: 8,),

          TextView(page, weight: FontWeight.bold, color: Colors.black54,),
        ],
      ),
    );
  }
}
