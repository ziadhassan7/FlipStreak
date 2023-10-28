import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/shared_pref/hive_client.dart';
import '../../../data/model/book_model.dart';

//Initialize Hive
HiveClient hive = HiveClient();
//



final lastBookProvider = StateNotifierProvider<LastBookProvider, BookModel?>((ref) {

  return LastBookProvider();
});


class LastBookProvider extends StateNotifier<BookModel?>{


  LastBookProvider() : super(null);

  void updateWidget(BookModel bookModel) {

    hive.saveLastBook(bookModel.id);
    state = bookModel;
  }

  void updateLastPage(BookModel bookModel, int page){
    bookModel = bookModel.copyWith(lastPage: page);
    state = bookModel;
  }

  void deleteData() {
    hive.deleteLastBook();
    state = null;
  }
}