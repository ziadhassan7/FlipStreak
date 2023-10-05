import 'package:flip_streak/presentation/book/screen/book_page.dart';
import 'package:flutter/material.dart';
import '../../../../business/app_wise/controllers/book_controller.dart';
import '../../../../business/route_util.dart';
import '../../../views/book_thumbnail.dart';
import '../../../views/text_inria_sans.dart';

class BookmarkListItem extends StatelessWidget {
  const BookmarkListItem({Key? key, required this.page}) : super(key: key);

  final String page;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      width: 170,
      child: Stack(
        children: [

          Column(
            children: [
              Expanded(
                child: BookThumbnail(
                    filePath: bookModel.path,
                    page: int.parse(page),
              ),),

              const SizedBox(height: 10,),

              TextInriaSans(page, weight: FontWeight.bold, color: Colors.black54,),
            ],
          ),

          /// Click Handler
          clickHandler(context),
        ],
      ), //This package starts page 1 with 0
    );
  }

  Widget clickHandler(BuildContext context) {

    return GestureDetector(
      behavior: HitTestBehavior.translucent,

      onTap: () {
        //Open Book, with current page
        RouteUtil.navigateTo(context, BookPage(initialPage: int.parse(page),));
      }
    );

  }
}
