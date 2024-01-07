import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/book_controller.dart';

final bookmarkListProvider = StateNotifierProvider<BookmarkListProvider, List<String>>((ref) {

  return BookmarkListProvider();
});


class BookmarkListProvider extends StateNotifier<List<String>> {

  BookmarkListProvider() : super([]) {
    listFiles();
  }


  /// State Function
  updateNotifier() async {
    state = await getBookmarkedPages(bookModel.id);
  }

  /// ---------------------------------------------------------------


  /// Returns All Items
  Future<void> listFiles() async {
    //Get List of all bookmarks
    await updateNotifier();
  }

  /// Add New Page
  Future<void> updateList(String currentPage, List<String> allBookmarks) async {
    //Add / Remove
    if (!allBookmarks.contains(currentPage)) {
      // add page to bookmarks
      allBookmarks.add(currentPage);
      //update BookModel
      bookModel = bookModel.copyWith(bookmarks: allBookmarks.toString(),);

    } else {
      // remove bookmarked page
      allBookmarks.remove(currentPage);
      //update BookModel
      bookModel = bookModel.copyWith(bookmarks: allBookmarks.toString(),);
    }

    //Update Database
    bookClient.updateItem(bookModel);

    //Get List of all bookmarks
    await updateNotifier();
  }

  /// Remove Page
  void removePageFromBookmark(String page) async {

    //get list of bookmarks from current book
    List<String> allBookmarks = await getBookmarkedPages(bookModel.id);

    // remove bookmarked page
    allBookmarks.remove(page);
    //update BookModel
    bookModel = bookModel.copyWith(bookmarks: allBookmarks.toString(),);

    //Update Database
    bookClient.updateItem(bookModel);

    //Get List of all bookmarks
    await updateNotifier();
  }


  /// Refresh Fab
  Future<void> toggleBookmarkButton() async {
    //Get List of all bookmarks
    await updateNotifier();
  }

}