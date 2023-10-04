import 'package:flip_streak/data/model/book_model.dart';
import 'package:flip_streak/presentation/views/menu/menu_widget.dart';
import 'package:flip_streak/provider/last_book_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app_constants/color_constants.dart';
import '../../../business/app_wise/controllers/book_controller.dart';
import '../../../provider/book_list_provider.dart';
import '../../views/dialoq/category_attacher/category_attacher_dialog.dart';
import '../../views/dialoq/delete_dialog/delete_book_dialoq.dart';
import '../../views/text_inria_sans.dart';

class LibraryMenuIcon extends ConsumerWidget {
  const LibraryMenuIcon({Key? key, required this.currentBook}) : super(key: key);

  final BookModel currentBook;
  static Function(Function())? _updateState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MenuWidget(
      //iconColor: Colors.black,

      menuItems: [
        PopupMenuItem<int>(
          value: 0,
          child: TextInriaSans("Add category", color: colorAccent,),
        ),

        PopupMenuItem<int>(
          value: 1,
          child: StatefulBuilder(
              builder: (context, Function(Function()) setState) {
                _updateState = setState;
                return TextInriaSans(getCompleteButtonText(), color: colorAccent,);
              }
          ),
        ),

        PopupMenuItem<int>(
          value: 2,
          child: TextInriaSans("Delete book", color: colorAccent,),
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

          _updateState!((){});
        }

        if (value == 2) {
          DeleteBookDialog(context, ref, bookId: currentBook.id,);
        }
      }
    );
  }

  String getCompleteButtonText() {
    int isCompleted = bookModel.isComplete;

    if(isCompleted == 1){
      return "Mark As Not Complete";

    } else {
      return "Mark As Completed";
    }
  }
}
