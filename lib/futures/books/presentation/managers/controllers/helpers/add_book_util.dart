import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:pdfx/pdfx.dart';
import '../../../../../../index_page/nav_bar_provider.dart';
import '../../../../data/model/book_model.dart';
import '../../state_manager/book_list_provider.dart';
import '../../../../../../core/utils/file_util.dart';
import '../../../../../../core/app_router.dart';
import '../book_controller.dart';

class AddBookUtil {

  static late BookModel model;

  static void addBook(WidgetRef ref, {String? currentCategory}) {

    //pick file
    AppRouter.pickFiles().then((files) async {
      //upon success open picker page

      if(files != null){

        for(PlatformFile file in files){ //add each book in list

          if(await _isDuplicate(basename(file.path!)) == false) {
            String newPath = await FileUtility.copyFile(File(file.path!));

            model = BookModel(id: basename(file.path!),
                path: newPath,
                thumbnail: null,
                bookmarks: null,
                lastPage: 0,
                totalPages: await _getTotalPages(newPath),
                category: "[$currentCategory]",
                addDate: DateTime.now().toString(),
                completeDate: null,
                isComplete: 0,
                lastReadDate: null
            );

            bookClient.createItem(model);
            ref.read(bookListProvider.notifier).listFiles();
          }
        }


      }

      // Open library page, when adding books
    }).whenComplete(() {
      ref.read(navBarProvider.notifier).changeIndex(1);
    });
  }


  static Future<bool> _isDuplicate(String fileName) async {
    List<BookModel> all = await bookClient.readAllElements();

    for(int i =0; i<all.length; i++) {
      if (all[i].id == fileName) return true;
    }

    return false;
  }

  static Future<int> _getTotalPages(String filePath) async {
    PdfDocument document = await PdfDocument.openFile(filePath);
    int page = document.pagesCount - 1;

    return page;
  }

}