import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../../core/app_router.dart';
import '../../../../../../app_common_views/book_thumbnail.dart';
import '../../../../../../app_common_views/text_view/text_view.dart';
import '../../../../dialog/remove_bookmark/remove_bookmark_dialog.dart';
import '../../../../managers/controllers/book_controller.dart';
import '../../../book/screen/book_page.dart';

class BookmarkListItem extends ConsumerWidget {
  const BookmarkListItem({Key? key, required this.page}) : super(key: key);

  final String page;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      width: 170,

      child: InkWell(
        onTap: () {
          //Open Book, with current page
          AppRouter.navigateTo(context, BookPage(initialPage: int.parse(page),));
        },
        onLongPress: (){
          RemoveBookmarkDialog(context, ref, page);
        },

        child: Column(
          children: [
            Expanded(
              child: BookThumbnail(
                  filePath: bookModel.path,
                  page: int.parse(page),
            ),),

            const SizedBox(height: 10,),

            TextView(page, weight: FontWeight.bold, color: Colors.black54,),
          ],
        ),
      ), //This package starts page 1 with 0
    );
  }
}
