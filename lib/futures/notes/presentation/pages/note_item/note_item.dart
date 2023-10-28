import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flip_streak/core/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/styles/box_decoration.dart';
import '../../../../../core/styles/device_screen.dart';
import '../../../../../core/styles/padding.dart';
import '../../../../app_common_views/text_view/text_view.dart';
import '../../../data/model/note_model.dart';
import '../../dialog/delete_note_dialog.dart';
import '../../manager/controller/bottom_bar_controller.dart';
import '../../manager/controller/note_controller.dart';
import '../../manager/state_manager/note_detail_provider/book_name_provider.dart';
import '../../manager/state_manager/note_detail_provider/page_number_provider.dart';
import '../../styles/custom_format.dart';
import '../note_edit/screen/note_edit.dart';

class NoteItem extends ConsumerWidget {
  const NoteItem({Key? key, required this.note,}) : super(key: key);

  final NoteModel note;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Padding(
      padding: const CustomPadding(horizontal: 18, vertical: 12),

      child: InkWell(
        /// Handle taps
        //Tap
        onTap: (){
          NoteController.noteTitle.text = note.noteTitle ?? "";
          NoteController.noteBody.text = note.noteBody;
          NoteController.bookName.text = note.noteBookName;
          NoteController.pageNumber.text = note.notePage;
          ref.read(bookNameProvider.notifier).updateValue(note.noteBookName);
          ref.read(pageNumberProvider.notifier).updateValue(note.notePage);
          AppRouter.navigateTo(context, NoteEdit(currentNoteId: note.noteId,));
        },

        //Long Press
        onLongPress: (){
          //open delete dialog
          DeleteNoteDialog(context, ref, noteId: note.noteId);
        },


        /// Widgets
        child: Container(
          //Settings
            width: DeviceScreen(context).width,
            padding: const CustomPadding(horizontal: 28, vertical: 28),

            decoration: CustomDecoration(
              backgroundColor: Colors.white,
              borderColor: colorAccent.withOpacity(0.4),
              radius: 18,
              borderWidth: 2,
            ),

          //View
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///                                                         / Note Title
                    Visibility(
                      visible: note.noteTitle != null,
                      child: Column(
                        children: [
                          Text(
                            note.noteTitle??"",
                            style: CustomFormat.tinos(
                                color: Colors.black,
                                isBold: true, size: 18),
                          ),

                          const SizedBox(height: 20,),
                        ],
                      ),
                    ),

                    ///                                                         / Note Body
                    SizedBox(
                      height: getHeight(),
                      child: Text(
                        note.noteBody,
                        style: CustomFormat.tinos(
                            color: Colors.brown.shade900, size: 16),
                      ),
                    ),

                    ///                                                         / Bar (Book name , Page number)
                    Padding(
                      padding: const CustomPadding(top: 14),

                      child: Row(
                        children: [
                          /// Book name
                          SizedBox(
                            width: BottomBarController
                                .getBookNameWidth(context, note.noteBookName),

                            child: TextView(note.noteBookName,
                              weight: FontWeight.bold,
                              size: 14, color: colorAccent,),
                          ),

                          const Spacer(),

                          /// Page number
                          SizedBox(
                            width: BottomBarController
                                .getPageNumberWidth(context, note.notePage),

                            child: TextView(getPageNumber(note.notePage),
                              weight: FontWeight.bold,
                              size: 14, color: colorAccent,),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }

  String getPageNumber(String text){
    if(text == ""){
      return "";
    }
    return "pg. $text";
  }

  double? getHeight(){
    return (note.noteBody.length > 400)
        ? 200 //maximum height
        : null; //adaptive
  }
}
