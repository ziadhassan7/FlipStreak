import 'package:flip_streak/presentation/views/dialoq/note_dialog/add_note_dialog.dart';
import 'package:flutter/material.dart';
import '../../text_inria_sans.dart';

class NoteView extends StatelessWidget {
  const NoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const Color fillColor = Colors.black26;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        TextInriaSans("Add Note"),

        const SizedBox(height: 20,),

        TextFormField(
          controller: AddNoteDialog.noteTitleController,
          decoration: const InputDecoration(
              fillColor: fillColor,
              border: InputBorder.none,
              hintText: 'Note Title',
              hintStyle: TextStyle(
                  color: Colors.black45
              )
          ),
        ),

        Expanded(
          child: Form(
            key: AddNoteDialog.formKey,

            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Note can't be empty";
                }

                return null;
              },
              controller: AddNoteDialog.noteBodyController,
              expands: true,
              maxLines: null,
              decoration: const InputDecoration(
                  fillColor: fillColor,
                  border: InputBorder.none,
                  hintText: 'Note Body',
                  hintStyle: TextStyle(
                      color: Colors.black45
                  )
              ),
            ),
          ),
        ),
      ],
    );
  }
}
