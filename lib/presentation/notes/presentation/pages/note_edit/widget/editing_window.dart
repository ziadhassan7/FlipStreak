import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../manager/controller/note_controller.dart';
import '../../../styles/custom_format.dart';

class EditingWindow extends StatelessWidget {
  const EditingWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textTheme: GoogleFonts.tinosTextTheme() //inriaSerifTextTheme,
    ),

      child: Column(
        children: [
          ///                                                                   / Title
          TextFormField(
            controller: NoteController.noteTitle,

            style: CustomFormat.formField(isTitle: true),
            textCapitalization: TextCapitalization.sentences,

            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Title',
            ),
          ),


          ///                                                                   / Body
          Expanded(
            child: Form(
              key: NoteController.formKey,

              child: TextFormField(
                controller: NoteController.noteBody,
                validator: _validator,

                expands: true,
                maxLines: null,
                textAlign: TextAlign.justify,
                textCapitalization: TextCapitalization.sentences,

                style: CustomFormat.formField(isTitle: false),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Body',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? _validator(String? value){
    if (value == null || value.isEmpty) {
      return "Note can't be empty";
    }

    return null;
  }
}
