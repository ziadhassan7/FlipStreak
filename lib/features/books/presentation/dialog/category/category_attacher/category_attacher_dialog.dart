import 'package:flip_streak/features/books/presentation/dialog/category/category_attacher/view/attacher_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/shared_pref/hive_client.dart';
import '../../../../../app_common_views/z_dialog/z_dialog.dart';
import '../../../../data/local_db/book_client.dart';
import '../../../../data/model/book_model.dart';
import '../../../managers/controllers/book_controller.dart';

class CategoryAttacherDialog {

  static final TextEditingController textController = TextEditingController();
  final BookClient bookClient = BookClient.instance;
  HiveClient hiveHelper = HiveClient();

  static List currentCategories = [];

  CategoryAttacherDialog(BuildContext context, WidgetRef ref,
      {required BookModel currentBook}) {

    getBookCategories(currentBook);

    ZDialog.custom(
        context,

        disableTintColor: true,

        view: AttacherView(currentBook: currentBook,)

    );
  }

  static Future<List> getBookCategories(BookModel currentBook) async {
    currentCategories = await getCategoryList(currentBook.id);
    return currentCategories;
  }

}