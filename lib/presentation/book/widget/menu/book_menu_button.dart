import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app_constants/color_constants.dart';
import '../../../../business/app_wise/controllers/book_controller.dart';
import '../../../../provider/bright_mode_provider.dart';
import '../../../views/dialoq/bookmark_dialog/bookmarks_dialog.dart';
import '../../../views/menu/menu_widget.dart';
import '../../../views/text_inria_sans.dart';
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
                  child: TextInriaSans("Bookmarked", color: foregroundColor,),
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
