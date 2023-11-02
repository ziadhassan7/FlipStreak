import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/shared_pref/hive_client.dart';
import '../state_manager/bookmark_list_provider.dart';
import '../../../data/local_db/book_client.dart';
import '../../../data/model/book_model.dart';
import 'book_controller.dart';

HiveClient hiveClient = HiveClient();
late PDFViewController pdfController;


/// Jump to page
void jumpToPage(int page){
  pdfController.setPage(page);
}


/// Check Fab on page change
void checkFab(WidgetRef ref,) {

  // update FAB bookmark button
  ref.read(bookmarkListProvider.notifier)
      .toggleBookmarkButton();

}

/// Update Last page
updateLastPage({required int pageNumber}) {

  // update Book Model
  bookModel = bookModel.copyWith(lastPage: pageNumber,);

  hiveClient.updateLastPage(pageNumber);

  // update last page
  updateBookDetails();
}

/// Update Last page - from hive - updates on last widget
refreshLastPageFromHiveAndGetBook(BookModel model) async {
  BookClient bookClient = BookClient.instance;
  int savedPageNumber = await hiveClient.getLastPage();


  if(savedPageNumber != 0) {
    model = model.copyWith(lastPage: savedPageNumber);
    await bookClient.updateItem(model); //update item
  }

  return model;
}

