import 'package:flip_streak/presentation/notes/controller/note_controller.dart';
import 'package:flutter/material.dart';
import '../../views/text_inria_sans.dart';

class NoteEdit extends StatelessWidget {
  const NoteEdit({super.key});

  final Color fillColor = Colors.black26;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            TextInriaSans("Add Note"),

            const SizedBox(height: 20,),

            TextFormField(
              controller: NoteController.noteTitle,
              decoration: InputDecoration(
                  fillColor: fillColor,
                  border: InputBorder.none,
                  hintText: 'Note Title',
                  hintStyle: const TextStyle(
                      color: Colors.black45
                  )
              ),
            ),

            Expanded(
              child: Form(
                key: NoteController.formKey,

                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Note can't be empty";
                    }

                    return null;
                  },
                  controller: NoteController.noteBody,
                  expands: true,
                  maxLines: null,
                  decoration: InputDecoration(
                      fillColor: fillColor,
                      border: InputBorder.none,
                      hintText: 'Note Body',
                      hintStyle: const TextStyle(
                          color: Colors.black45
                      )
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

/*
if (NoteController.formKey.currentState!.validate()) {
            controller.saveNote(ref);
            NoteController.noteTitle.clear();
            NoteController.noteBody.clear();
          }
 */
