import 'package:flip_streak/futures/books/presentation/managers/controllers/book_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/utils/converters/string_list_converter.dart';
import '../../../data/local_db/book_client.dart';
import '../../../data/model/book_model.dart';

final bookListProvider = StateNotifierProvider<BookProvider, Future<List<BookModel>>>((ref) {

  return BookProvider();
});


class BookProvider extends StateNotifier<Future<List<BookModel>>>{
  final BookClient _bookClient = BookClient.instance;

  BookProvider() : super(Future(() => [])) {
    listFiles();
  }


  /// State Function
  updateNotifier() {
    state = _bookClient.readAllElements();
  }
  /// ---------------------------------------------------------------


  /// Returns All Items
  void listFiles() async {
    //Get List of all books
    await updateNotifier();
  }

  /// Add/Remove Item to Completed, and Return All Items
  void toggleAsCompleted(BookModel oldModel) async {

    oldModel.isComplete == 0
        ? markAsComplete(book: oldModel,) //if false, make it true (1)
        : markAsIncomplete(book: oldModel); //else , make it false (0)

    //Get List of all books
    await updateNotifier();
  }


  /// Edit last page
  void editLastPage(int newLastPage) async {

    BookModel newModel;

    //adjust model
    if(newLastPage == bookModel.totalPages){ //if last page, mark as complete
      newModel = bookModel.copyWith(lastPage: newLastPage, isComplete: 1);
      bookModel = newModel;
    } else {
      newModel = bookModel.copyWith(lastPage: newLastPage);
      bookModel = newModel;
    }

    //update item
    _bookClient.updateItem(newModel); //Update item in database

    //Get List of all books
    await updateNotifier();
  }


  /// update book Categories
  void updateBookCategories(BookModel currentBook, List newCatList){
    BookModel newModel = currentBook.copyWith(category: newCatList.toString());
    _bookClient.updateItem(newModel);
    updateNotifier();
  }

  /// update Last Time read
  void updateLastTimeRead(){
    updateLastReadDate();
    updateNotifier();
  }

  /// Update / Delete from all books
  Future<void> updateAllBooksWithNewCat(String oldCatItem, String newCatItem) async {
    List<BookModel> list = await bookClient.readAllElements();

    //For each book
    for(BookModel book in list) {
      if(book.category != null) {

        //if book contains this old category
        if (book.category!.contains(oldCatItem)) {

          // get the list categories from that book
          List categories = getListFromString(book.category!);

          //remove old item, and add new one
          categories.remove(oldCatItem);
          categories.add(newCatItem);

          //update book
          BookModel newBook = book.copyWith(category: categories.toString());
          bookClient.updateItem(newBook);

          //refresh
          updateNotifier();
        }
      }
    }
  }

  Future<void> deleteCatFromAllBooks(String deletedItem,) async {
    List<BookModel> list = await bookClient.readAllElements();

    //For each book
    for(BookModel book in list) {
      if(book.category != null){

        // get the list categories from that book
        List categories = getListFromString(book.category!);

        //if item exist, delete it
        if(categories.contains(deletedItem)) categories.remove(deletedItem);

        //update book
        BookModel newBook = book.copyWith(category: categories.toString());
        bookClient.updateItem(newBook);

        //refresh
        updateNotifier();
      }
    }
  }
}