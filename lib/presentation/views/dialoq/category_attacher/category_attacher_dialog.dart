import 'package:flip_streak/data/local_db/book_client.dart';
import 'package:flip_streak/presentation/views/dialoq/category_attacher/attacher_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../business/app_wise/controllers/book_controller.dart';
import '../../../../data/model/book_model.dart';
import '../../../../data/shared_pref/hive_client.dart';
import '../../../../provider/book_list_provider.dart';
import '../dialoq_widget.dart';

class CategoryAttacherDialog {

  static final TextEditingController textController = TextEditingController();
  final BookClient bookClient = BookClient.instance;
  HiveClient hiveHelper = HiveClient();

  static List currentCategories = [];

  CategoryAttacherDialog(BuildContext context, WidgetRef ref,
      {required BookModel currentBook}) {

    getBookCategories(currentBook);

    DialogWidget(
        context,

        disableTintColor: true,
        dominantButtonFunction: (){
          //Update book labels
          ref.read(bookListProvider.notifier)
              .updateBookCategories(currentBook, currentCategories);
        },

        child: AttacherView(currentBook: currentBook,)

    ).showStandardDialog();
  }

  static Future<List> getBookCategories(BookModel currentBook) async {
    currentCategories = await getCategoryList(currentBook.id);
    return currentCategories;
  }

}