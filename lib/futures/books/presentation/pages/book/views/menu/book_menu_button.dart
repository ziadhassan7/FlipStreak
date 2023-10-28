import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../../core/constants/color_constants.dart';
import '../../../../../../app_common_views/menu/menu_widget.dart';
import '../../../../../../app_common_views/text_view/text_view.dart';
import '../../../../dialog/bookmarks/bookmarks_dialog.dart';
import '../../../../managers/controllers/book_controller.dart';
import '../../../../managers/state_manager/bright_mode_provider.dart';
import 'color_picker.dart';

class BookMenuButton extends StatelessWidget {
  const BookMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, _) {

          final isBright = ref.watch(brightModeProvider);

          final Color backgroundColor = isBright ? dominateColor : darkPrimary;
          final Color foregroundColor = isBright ? darkPrimary : darkSecondary;

          return MenuWidget(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,

              menuItems: [
                PopupMenuItem<int>(
                  value: 0,
                  child: TextView("Bookmarked", color: foregroundColor,),
                ),

                ColorPicker.list(ref),
              ]
              ,
              functions: (value) async{
                if(value == 0){
                  //open Dialog showing list of bookmarks
                  BookmarksDialog(context,
                      await getBookmarkedPages(bookModel.id));
                }
              }

          );
        }
    );
  }
}
