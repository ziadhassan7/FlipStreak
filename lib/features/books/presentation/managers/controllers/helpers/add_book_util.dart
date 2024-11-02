import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_epub_viewer/flutter_epub_viewer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:pdfx/pdfx.dart';
import '../../../../../../index_page/nav_bar_provider.dart';
import '../../../../data/model/book_model.dart';
import '../../state_manager/book_list_provider.dart';
import '../../../../../../core/utils/file_util.dart';
import '../../../../../../core/app_router.dart';
import '../book_controller.dart';

enum ShareIntentStatus {
  success,
  alreadyAdded,
  failure
}

class AddBookUtil {

  static late BookModel model;

  static void importBookFromSystem(WidgetRef ref, {String? currentCategory}) {

    //pick file
    AppRouter.pickFiles().then((files) async {
      //upon success open picker page

      if(files != null){

        for(PlatformFile file in files) { //add each book in list
          addBook(ref, file.path);
        }

      }

      // Open library page, when adding books
    }).whenComplete(() {
      ref.read(navBarProvider.notifier).changeIndex(1);
    });
  }


  static Future<ShareIntentStatus> addBook(WidgetRef ref, String? filePath) async {

    // dismiss if filePath is empty
    if(filePath == null) return ShareIntentStatus.failure;


    //--------------
    String fileName = basename(filePath).replaceAll(".pdf", "");

    // check for duplicates
    if(await _isDuplicate(fileName) == false) {
      String newPath = await FileUtil.copyFile(File(filePath));

      model = BookModel(
          id: fileName,
          path: newPath,
          bookmarks: null,
          lastPage: 0,
          totalPages: await _getTotalPages(newPath),
          category: "[]",
          addDate: DateTime.now().toString(),
          completeDate: null,
          isComplete: 0,
          lastReadDate: null
      );

      bookClient.createItem(model);
      ref.read(bookListProvider.notifier).listFiles();

      return ShareIntentStatus.success;

    } else {
      return ShareIntentStatus.alreadyAdded;
    }
  }

  static Future<bool> _isDuplicate(String fileName) async {
    List<BookModel> all = await bookClient.readAllElements();

    for(int i =0; i<all.length; i++) {
      if (all[i].id == fileName) return true;
    }

    return false;
  }

  static Future<int> _getTotalPages(String filePath) async {
    int pageCount = 0;

    // Check if the file is a PDF or EPUB and initialize accordingly
    if (filePath.endsWith('.pdf')) {
      PdfDocument document = await PdfDocument.openFile(filePath);
      pageCount = document.pagesCount - 1;

    } else if (filePath.endsWith('.epub')) {
      final EpubController epubController = EpubController();
      EpubViewer(epubController: epubController, epubSource: EpubSource.fromFile(File(filePath)));

      // The number of chapters can be counted by checking the number of items in the spine (or Table of Contents).
      pageCount = epubController.getChapters().length; //TODO: we get the chapters count
    }

    return pageCount;
  }

}