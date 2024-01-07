import 'package:flutter/material.dart';
import '../../../manager/controller/note_controller.dart';
import '../../../styles/custom_format.dart';

class EditingWindow extends StatelessWidget {
  const EditingWindow({super.key});

  static bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: 'Tinos',
    ),

      child: Column(
        children: [
          ///                                                                   / Title
          TextFormField(
            controller: NoteController.noteTitle,

            style: CustomFormat.formField(isTitle: true),
            textCapitalization: TextCapitalization.sentences,
            maxLines: null,

            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Title',
            ),

            onChanged: (text){
              isChanged = true;
            },
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
                textCapitalization: TextCapitalization.sentences,

                style: CustomFormat.formField(isTitle: false),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Body',
                ),

                onChanged: (text){
                  isChanged = true;
                },
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
