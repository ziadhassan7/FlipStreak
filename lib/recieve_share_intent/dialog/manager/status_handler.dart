import 'package:flip_streak/core/app_router.dart';
import 'package:flip_streak/features/books/data/local_db/book_client.dart';
import 'package:flip_streak/features/books/presentation/managers/controllers/book_controller.dart';
import 'package:flip_streak/features/books/presentation/pages/details/screen/detail_page.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';


class StatusHandler {

  final BookClient _bookClient = BookClient.instance;



  openBook(BuildContext context, String filePath) {
    String bookId = basename(filePath).replaceAll(".pdf", "");

    //Get bookModel
    _bookClient.readOneElement(bookId).then((receivedBook) {

      //Globalize this book across application
      globalizeCurrentBookModel(receivedBook).then((value) {

        //Navigate to Details Page
        AppRouter.navigateTo(context, const DetailPage());
      });

    });

  }

}