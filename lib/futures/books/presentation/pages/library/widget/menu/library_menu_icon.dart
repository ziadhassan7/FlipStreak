import 'package:flip_streak/futures/books/presentation/dialog/rename/rename_dialog.dart';
import 'package:flip_streak/futures/confetti/state_manager/confetti_library_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../../core/constants/color_constants.dart';
import '../../../../../../app_common_views/menu/menu_widget.dart';
import '../../../../../../app_common_views/text_view/text_view.dart';
import '../../../../../data/model/book_model.dart';
import '../../../../dialog/category/category_attacher/category_attacher_dialog.dart';
import '../../../../dialog/delete_book/delete_book_dialoq.dart';
import '../../../../managers/controllers/book_controller.dart';
import '../../../../managers/state_manager/book_list_provider.dart';
import '../../../../managers/state_manager/last_book_provider.dart';

class LibraryMenuIcon extends ConsumerWidget {
  const LibraryMenuIcon({Key? key, required this.selectedBook}) : super(key: key);

  final BookModel selectedBook;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MenuWidget(
      //iconColor: Colors.black,

      menuItems: [
        const PopupMenuItem<int>(
          value: 0,
          child: TextView("Rename", color: colorAccent,),
        ),

        const PopupMenuItem<int>(
          value: 1,
          child: TextView("Add category", color: colorAccent,),
        ),

        PopupMenuItem<int>(
          value: 2,
          child: TextView(getCompleteButtonText(), color: colorAccent,),
        ),

        const PopupMenuItem<int>(
          value: 3,
          child: TextView("Delete book", color: colorAccent,),
        ),
      ],

      functions: (value) {

        //Rename
        if(value == 0){
          RenameDialog(context, ref, book: selectedBook);
        }

        //Add Category
        if(value == 1){
          CategoryAttacherDialog(context, ref, currentBook: selectedBook);
        }

        //Mark As Complete
        if (value == 2) {
          ref.read(bookListProvider.notifier).toggleAsCompleted(selectedBook);

          // Also change it in the last book widget
          if(bookModel.isComplete == 1){
            ref.read(lastBookProvider.notifier).updateLastPage(bookModel, bookModel.totalPages);
            ref.read(confettiLibraryProvider.notifier).showConfetti();
          } else {
            ref.read(lastBookProvider.notifier).updateLastPage(bookModel, 0);
            ref.read(confettiLibraryProvider.notifier).hideConfetti();
          }

        }

        //Delete
        if (value == 3) {
          DeleteBookDialog(context, ref, bookId: selectedBook.id, filePath: selectedBook.path);
        }
      }
    );
  }

  String getCompleteButtonText() {
    int isCompleted = selectedBook.isComplete;

    if(isCompleted == 1){
      return "Mark As Not Complete";

    } else {
      return "Mark As Completed";
    }
  }
}
