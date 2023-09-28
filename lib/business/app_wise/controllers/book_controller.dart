import 'dart:async';
import 'package:flip_streak/business/string_list_converter.dart';
import '../../../data/local_db/book_client.dart';
import '../../../data/model/book_model.dart';

BookClient bookClient = BookClient.instance;

// Initial Book model    // static instance - sensitive to global changes
BookModel bookModel = BookModel(
    id: "id", path: "path", bookmarks: null,
    lastPage: 0, totalPages: 0,
    category: null,
    addDate: "0", completeDate: "0",
    isComplete: 0,
);


///Globalize BookModel
//Get Current Book model, and
// make it accessible throughout the whole application
Future<void> globalizeCurrentBookModel(BookModel currentBook) async {
  bookModel = currentBook;
}


/// Update Values
// update all values
void updateBookDetails () {
  bookClient.updateItem(bookModel);
}


///                                                                             / Completed Books
//returns a list of completed books
List<BookModel> getCompletedOnly(List allBooks) {

  List<BookModel> completed = [];

  //Iterate through all books, and add the completed
  for (BookModel element in allBooks) {
    if (element.isComplete == 1) {
      completed.add(element);
    }
  }

  //Sort by complete date
  completed.sort((a, b) {
    return b.completeDate!.compareTo(a.completeDate!);
  });

  return completed;
}



///                                                                             / Bookmark
// get bookmark
Future<List<String>> getBookmarkedPages (String id) async {
  BookModel book = await bookClient.readOneElement(id);

  return getListFromString(book.bookmarks ?? "");
}


///                                                                             / Last Page
// get last Page
Future<int> getLastPage (String id) async {
  BookModel book = await bookClient.readOneElement(id);
  return book.lastPage;
}


///                                                                             / Total Pages
// get total pages
int getTotalPages () {
  return bookModel.totalPages;
}

///                                                                             / Book Category
// get Book Category or label
Future<List<String>> getCategoryList (String id) async {
  BookModel book = await bookClient.readOneElement(id);

  return getListFromString(book.category ?? "");
}

///                                                                             / Book Completion
// get is book complete?
Future<int> getCompletionState (String id) async {
  BookModel book = await bookClient.readOneElement(id);
  return book.isComplete;
}

//mark book as completed
markAsComplete ({BookModel? book}) {

  book ??= bookModel;

  bookModel = book.copyWith(
    completeDate: DateTime.now().toString(), //<-- update completion date
    isComplete: 1, //<-- update completion state
    lastPage: book.totalPages
  );

  updateBookDetails();
}

//mark book as incomplete
markAsIncomplete ({BookModel? book}) {

  book ??= bookModel;

  bookModel = book.copyWith(
    completeDate: null, //<-- update completion date
    isComplete: 0, //<-- update completion state
    lastPage: 0
  );

  updateBookDetails();
}


///                                                                             / Last Time Read
updateLastReadDate ({BookModel? book}) {

  book ??= bookModel;

  bookModel = book.copyWith(
      lastReadDate: DateTime.now().toString()
  );

  updateBookDetails();
}


