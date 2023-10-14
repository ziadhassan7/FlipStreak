import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flip_streak/presentation/detail/screen/detail_page.dart';
import 'package:flip_streak/presentation/views/dialoq/decomplete_book/decomplete_book_dialog.dart';
import 'package:flip_streak/presentation/views/text_inria_sans.dart';
import 'package:flip_streak/presentation/views/book_thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../business/app_wise/controllers/book_controller.dart';
import '../../../business/route_util.dart';
import '../../../data/model/book_model.dart';

class CompletedBookItem extends ConsumerWidget {
  const CompletedBookItem({Key? key, required this.bookName, required this.bookModel}) : super(key: key);

  final String? bookName;
  static int selectedCard = -1;

  final BookModel bookModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return InkWell(
      /// Tap --------------
      onTap: () async {
        // Globalize new bookModel data
        await globalizeCurrentBookModel(bookModel).then((value) {
          // Open Details Page
          RouteUtil
              .navigateTo(context, const DetailPage(),);
        });
      },

      /// Long Press
      onLongPress: () {
        //open dialog to delete book
        DecompleteBookDialog(context, ref, bookModel);
      },


      /// Widget ------------
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: BookThumbnail(filePath: bookModel.path,)),

          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: customTextWidget(bookName ?? "No Name", true),
          ),
        ],
      ),
    );
  }


  Widget customTextWidget(String text, bool isTitle){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TextInriaSans(
        text,
        size: 15,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        weight: isTitle ? FontWeight.bold : FontWeight.normal,
        color: isTitle ? colorDark : Colors.black45,
      ),
    );
  }
}
