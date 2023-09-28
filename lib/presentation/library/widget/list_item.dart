import 'package:flip_streak/presentation/detail/screen/detail_page.dart';
import 'package:flip_streak/presentation/views/book_thumbnail.dart';
import 'package:flip_streak/presentation/views/text_inria_sans.dart';
import 'package:flutter/material.dart';
import '../../../business/app_wise/controllers/book_controller.dart';
import '../../../business/route_util.dart';
import '../../../data/model/book_model.dart';
import 'library_menu_icon.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.book}) : super(key: key);

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 22),

      child: Theme(

        data: ThemeData(useMaterial3: false,), // to prevent inkwell splash after return

        child: InkWell(

          onTap: () async {
            // Globalize new bookModel data
            await globalizeCurrentBookModel(book).then((value) {
              // Open Details Page
              RouteUtil
                  .navigateTo(context, const DetailPage(),);
            });
          },

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              /// Thumbnail Book
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 90,
                  child: BookThumbnail(filePath: book.path)),
              ),

              Expanded(
                flex: 7,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 60,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Title
                      TextInriaSans(
                        book.id,
                        weight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const Spacer(),

                      /// Last Page
                      TextInriaSans(
                        "pg. ${book.lastPage.toString()}",
                        weight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
              ),



              /// Category Icon
              Theme(
                data: ThemeData(useMaterial3: true),

                child: Expanded(
                  flex: 1,
                  child: LibraryMenuIcon(currentBook: book,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
