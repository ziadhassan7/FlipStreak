import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/constants/color_constants.dart';
import '../../../../../app_common_views/menu/menu_widget.dart';
import '../../../../../app_common_views/text_view/text_view.dart';
import '../../../../data/model/book_model.dart';
import '../../../dialog/category_attacher/category_attacher_dialog.dart';
import '../../../dialog/delete_book/delete_book_dialoq.dart';
import '../../../managers/controllers/book_controller.dart';
import '../../../managers/state_manager/book_list_provider.dart';
import '../../../managers/state_manager/last_book_provider.dart';

class LibraryMenuIcon extends ConsumerWidget {
  const LibraryMenuIcon({Key? key, required this.currentBook}) : super(key: key);

  final BookModel currentBook;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MenuWidget(
      //iconColor: Colors.black,

      menuItems: [
        const PopupMenuItem<int>(
          value: 0,
          child: TextView("Add category", color: colorAccent,),
        ),

        PopupMenuItem<int>(
          value: 1,
          child: TextView(getCompleteButtonText(), color: colorAccent,),
        ),

        const PopupMenuItem<int>(
          value: 2,
          child: TextView("Delete book", color: colorAccent,),
        ),
      ],

      functions: (value) {
        if(value == 0){
          CategoryAttacherDialog(context, ref, currentBook: currentBook);
        }

        if (value == 1) {
          ref.read(bookListProvider.notifier).toggleAsCompleted(currentBook);

          // Also change it in the last book widget
          if(bookModel.isComplete == 1){
            ref.read(lastBookProvider.notifier).updateLastPage(bookModel, bookModel.totalPages);
          } else {
            ref.read(lastBookProvider.notifier).updateLastPage(bookModel, 0);
          }

        }

        if (value == 2) {
          DeleteBookDialog(context, ref, bookId: currentBook.id,);
        }
      }
    );
  }

  String getCompleteButtonText() {
    int isCompleted = currentBook.isComplete;

    if(isCompleted == 1){
      return "Mark As Not Complete";

    } else {
      return "Mark As Completed";
    }
  }
}
