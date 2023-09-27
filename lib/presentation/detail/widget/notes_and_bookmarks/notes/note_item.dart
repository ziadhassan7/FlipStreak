import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flip_streak/presentation/styles/padding.dart';
import 'package:flip_streak/presentation/views/dialoq/delete_dialog/delete_note_dialog.dart';
import 'package:flip_streak/presentation/views/dialoq/note_dialog/add_note_dialog.dart';
import 'package:flip_streak/presentation/views/text_inria_sans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../data/model/note_model.dart';
import '../../../../styles/box_decoration.dart';
import '../../../../styles/device_screen.dart';

class NoteItem extends ConsumerWidget {
  const NoteItem({Key? key, required this.note, this.isBigView = false}) : super(key: key);

  final NoteModel note;
  final bool isBigView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 20, left: 30),

      child: InkWell(
        //Tap
          onTap: (){
            AddNoteDialog.noteTitleController.text = note.noteTitle ?? "";
            AddNoteDialog.noteBodyController.text = note.noteBody;
            AddNoteDialog(context, ref);
          },

          //Long Press
          onLongPress: (){

            //open dialog
            DeleteNoteDialog(context, ref, noteId: note.noteId);
          },


          //Widget
          child: Stack(
            children: [
              Expanded(
                child: Container(
                  width: DeviceScreen(context).width,
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: isBigView?36:25),

                  decoration: CustomDecoration(
                    backgroundColor: Colors.white,
                    borderColor: colorAccent.withOpacity(0.4),
                    radius: 20,
                    borderWidth: 2,
                  ),


                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      Visibility(
                        visible: note.noteTitle != null,
                        child: customText(
                            note.noteTitle ?? "",
                            isTitle: true),
                      ),

                      const SizedBox(height: 15,),

                      Expanded(
                        child: customText(
                            note.noteBody,
                            isTitle: false),
                      ),
                    ],
                  ),
                ),
              ),


              /// Page indicator
              Visibility(
                  visible: isBigView,
                  child: Row(
                      children: [
                      const Spacer(),
                  Container(
                     padding: const CustomPadding(ver: 4, hor: 10),
                      decoration: const BoxDecoration(
                        color: colorAccent,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(40.0),
                            bottomLeft: Radius.circular(40.0)),),

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextInriaSans("pg.", color: Colors.white, size: 12,),
                      TextInriaSans("${note.notePage}", color: Colors.white, size: 12,),
                    ],
                  )),

              const SizedBox(width: 40,)
            ],
          )),
      ],
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

