import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/constants/color_constants.dart';
import '../../../../../app_common_views/menu/menu_widget.dart';
import '../../../../../app_common_views/text_view/text_view.dart';
import '../../../dialog/edit_last_page/edit_last_page_dialoq.dart';
import '../../../dialog/rename/rename_dialog.dart';
import '../../../managers/controllers/book_controller.dart';
import '../../../managers/state_manager/book_list_provider.dart';
import '../../../managers/state_manager/last_book_provider.dart';

class DetailsMenuIcon extends StatelessWidget {
  const DetailsMenuIcon({Key? key}) : super(key: key);

  static Function(Function())? _updateState;

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, _) {

          return MenuWidget(
              menuItems: [
                const PopupMenuItem<int>(
                  value: 0,
                  child: TextView("Rename", color: colorAccent,),
                ),

                const PopupMenuItem<int>(
                  value: 1,
                  child: TextView("Edit Last Page", color: colorAccent,),
                ),

                PopupMenuItem<int>(
                  value: 2,
                  child: StatefulBuilder(
                    builder: (context, Function(Function()) setState) {
                      _updateState = setState;
                      return TextView(getCompleteButtonText(), color: colorAccent,);
                    }
                  ),
                ),
              ],

              functions: (value) {
                if(value == 0){
                  //open Dialog to rename book
                  RenameDialog(context, ref, book: bookModel);
                }

                if(value == 1){
                  //open Dialog showing list of bookmarks
                  EditLastPageDialog(context, ref);
                }

                if (value == 2) {
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
