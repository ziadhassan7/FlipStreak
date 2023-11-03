import '../../../../data/model/book_model.dart';
import '../../../managers/controllers/book_controller.dart';

class RenameManager {

  static Future<bool> isDuplicate(String fileName) async {
    List<BookModel> all = await bookClient.readAllElements();

    for(int i =0; i<all.length; i++) {
      if (all[i].id == fileName) return true;
    }

    return false;
  }

}