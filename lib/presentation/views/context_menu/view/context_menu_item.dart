import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app_constants/color_constants.dart';
import '../../../styles/padding.dart';
import '../../dialoq/note_dialog/add_note_dialog.dart';
import '../../dialoq/translate_dialog/translate_dialog.dart';
import '../../text_inria_sans.dart';
import 'context_menu_view.dart';

class ContextMenuItem extends StatelessWidget {
  const ContextMenuItem(this.ref, {Key? key, required this.currentItem, required this.selectedText}) : super(key: key);

  final WidgetRef ref;
  final MenuItem currentItem;
  final String selectedText;

  @override
  Widget build(BuildContext context,) {
    return Center(
      child: Padding(
        padding: const CustomPadding(hor: 15),

        child: InkWell(
          /// Functions
            onTap: (){
              switch (currentItem){
                // Handle Copy
                case MenuItem.Copy:
                  Clipboard.setData(ClipboardData(text: selectedText));
                  break;

                // Handle Note
                case MenuItem.Note:
                  AddNoteDialog(context, ref, selectedText: selectedText,);
                  break;

                // Handle Translate
                case MenuItem.Translate:
                  TranslateDialog(context, ref, selectedText);
                  break;
              }
            },

            /// Widget
            child: TextInriaSans(currentItem.name, color: colorAccent, size: 16,)),
      ),
    );
  }
}
