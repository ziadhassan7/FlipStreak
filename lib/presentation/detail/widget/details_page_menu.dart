import 'package:flip_streak/provider/last_book_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app_constants/color_constants.dart';
import '../../../business/app_wise/controllers/book_controller.dart';
import '../../../provider/book_list_provider.dart';
import '../../views/dialoq/edit_last_page_dialog/edit_last_page_dialoq.dart';
import '../../views/menu/menu_widget.dart';
import '../../views/text_inria_sans.dart';

class DetailsPageMenu extends StatelessWidget {
  const DetailsPageMenu({Key? key}) : super(key: key);

  static Function(Function())? _updateState;

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, _) {

          return MenuWidget(
              menuItems: [
                PopupMenuItem<int>(
                  value: 0,
                  child: TextInriaSans("Edit Last Page", color: colorAccent,),
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
              ],

              functions: (value) {
                if(value == 0){
                  //open Dialog showing list of bookmarks
                  EditLastPageDialog(context, ref);
                }

                if (value == 1) {
                  ref.read(bookListProvider.notifier).toggleAsCompleted(bookModel);

                  // Also change it in the last book widget
                  if(bookModel.isComplete == 1){
                    ref.read(lastBookProvider.notifier).updateLastPage(bookModel, bookModel.totalPages);
                  } else {
                    ref.read(lastBookProvider.notifier).updateLastPage(bookModel, 0);
                  }

                  _updateState!((){});
                }
              }
          );
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
