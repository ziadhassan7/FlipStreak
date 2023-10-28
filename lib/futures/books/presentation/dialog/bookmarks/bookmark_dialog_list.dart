import 'package:flutter/material.dart';
import '../../../../app_common_views/book_thumbnail.dart';
import '../../../../app_common_views/text_view/text_view.dart';
import '../../managers/controllers/book_controller.dart';
import '../../managers/controllers/page_controller.dart';

class BookmarkDialogList extends StatelessWidget {
  const BookmarkDialogList({Key? key, required this.dialogContext, required this.page}) : super(key: key);

  final BuildContext dialogContext;
  final String page;

  @override
  Widget build(BuildContext context) {
    return InkWell(

      // click handler
      onTap: () {
        pdfController.setPage(int.parse(page));
        Navigator.pop(dialogContext);
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
