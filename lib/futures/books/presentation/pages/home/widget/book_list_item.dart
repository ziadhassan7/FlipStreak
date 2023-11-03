import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/app_router.dart';
import '../../../../../app_common_views/book_thumbnail.dart';
import '../../../../../app_common_views/text_view/text_view.dart';
import '../../../../data/model/book_model.dart';
import '../../../dialog/delete_book/delete_book_dialoq.dart';
import '../../../managers/controllers/book_controller.dart';
import '../../details/screen/detail_page.dart';

class BookListItem extends ConsumerWidget {
  const BookListItem({Key? key,required this.bookModel}) : super(key: key);

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
          AppRouter
              .navigateTo(context, const DetailPage(),);
        });
      },

      /// Long Press
      onLongPress: () {
        //open dialog to delete book
        DeleteBookDialog(context, ref, bookId: bookModel.id, filePath: bookModel.path);
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
            child: customTextWidget(bookModel.id, true),
          ),
        ],
      ),
    );
  }


  Widget customTextWidget(String text, bool isTitle){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TextView(
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
