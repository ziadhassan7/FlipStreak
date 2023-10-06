import 'package:flip_streak/business/app_wise/controllers/page_controller.dart';
import 'package:flutter/material.dart';
import '../../../../../business/app_wise/controllers/book_controller.dart';
import '../../book_thumbnail.dart';
import '../../text_inria_sans.dart';

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

          TextInriaSans(page, weight: FontWeight.bold, color: Colors.black54,),
        ],
      ),
    );
  }
}
