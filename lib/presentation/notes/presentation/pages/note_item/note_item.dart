import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flip_streak/business/route_util.dart';
import 'package:flip_streak/presentation/styles/padding.dart';
import 'package:flip_streak/presentation/views/dialoq/delete_dialog/delete_note_dialog.dart';
import 'package:flip_streak/presentation/views/text_inria_sans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../styles/box_decoration.dart';
import '../../../../styles/device_screen.dart';
import '../../../data/model/note_model.dart';
import '../../manager/controller/note_controller.dart';
import '../note_edit/screen/note_edit.dart';

class NoteItem extends ConsumerWidget {
  const NoteItem({Key? key, required this.note,}) : super(key: key);

  final NoteModel note;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Padding(
      padding: const CustomPadding(horizontal: 18, vertical: 15),

      child: InkWell(
        //Tap
        onTap: (){
          NoteController.noteTitle.text = note.noteTitle ?? "";
          NoteController.noteBody.text = note.noteBody;
          RouteUtil.navigateTo(context, const NoteEdit());
        },

        //Long Press
        onLongPress: (){

          //open dialog
          DeleteNoteDialog(context, ref, noteId: note.noteId);
        },


        //Widget
        child: Container(
            width: DeviceScreen(context).width,
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 36),

            decoration: CustomDecoration(
              backgroundColor: Colors.white,
              borderColor: colorAccent.withOpacity(0.4),
              radius: 20,
              borderWidth: 2,
            ),


            child: Column(
              children: [
                Text(note.noteBody),
              ],
            )
        ),
      ),
    );
  }

  Widget customText(String text, {required bool isTitle}) {
    return TextInriaSans(
      text,
      weight: isTitle? FontWeight.bold : FontWeight.normal,
      color: isTitle? colorAccent : Colors.black,
      size: isTitle? 17 : 16,
      maxLine: isTitle? 1: 10,
      overflow: TextOverflow.ellipsis,
    );
  }
}
