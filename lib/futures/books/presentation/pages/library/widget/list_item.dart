import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/app_router.dart';
import '../../../../../app_common_views/book_thumbnail.dart';
import '../../../../../app_common_views/text_view/text_view.dart';
import '../../../../data/model/book_model.dart';
import '../../../managers/controllers/book_controller.dart';
import '../../details/screen/detail_page.dart';
import 'menu/library_menu_icon.dart';

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
              AppRouter
                  .navigateTo(context, const DetailPage(),);
            });
          },

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              /// Thumbnail Book
              SizedBox(
                height: 90,
                width: 70,
                child: BookThumbnail(filePath: book.path)),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 60,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Title
                      TextView(
                        book.id,
                        weight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const Spacer(),

                      /// Last Page
                      TextView(
                        "pg. ${book.lastPage.toString()}",
                        weight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
              ),

              /// menu Icon
              Theme(
                data: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: colorAccent),),

                child: LibraryMenuIcon(selectedBook: book,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
