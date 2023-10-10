import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flip_streak/business/route_util.dart';
import 'package:flip_streak/presentation/notes/presentation/styles/custom_format.dart';
import 'package:flip_streak/presentation/styles/padding.dart';
import 'package:flip_streak/presentation/notes/presentation/views/dialog/delete_note_dialog.dart';
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
      padding: const CustomPadding(horizontal: 18, vertical: 12),

      child: InkWell(
        ///                                                                     / Handle taps
        //Tap
        onTap: (){
          NoteController.noteTitle.text = note.noteTitle ?? "";
          NoteController.noteBody.text = note.noteBody;
          RouteUtil.navigateTo(context, const NoteEdit());
        },

        //Long Press
        onLongPress: (){
          //open delete dialog
          DeleteNoteDialog(context, ref, noteId: note.noteId);
        },


        ///                                                                     / Widgets
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
                    Visibility(
                      visible: note.noteTitle != null,
                      child: Column(
                        children: [
                          Text(
                            note.noteTitle??"",
                            style: CustomFormat.normalText(color: Colors.black,
                                isBold: true, size: 18),
                          ),

                          const SizedBox(height: 20,),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: getHeight(),
                      child: Text(
                        note.noteBody,
                        style: CustomFormat.normalText(
                            color: Colors.brown.shade900, size: 16),
                      ),
                    ),
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }

  double? getHeight(){
    return (note.noteBody.length > 150)
        ? 200 //maximum height
        : null; //adaptive
  }
}
