import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flip_streak/futures/app_common_views/text_view/text_view.dart';
import 'package:flip_streak/futures/books/presentation/dialog/rename/rename_dialog.dart';
import 'package:flutter/material.dart';

class BookNameTextInput extends StatelessWidget {
  const BookNameTextInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        alignmentSpace(),

        const TextView("Rename Book", size: 16, color: colorAccent,),

        alignmentSpace(),

        TextFormField(
          //settings
          controller: RenameDialog.controller,
          textCapitalization: TextCapitalization.words,

          //hint
          decoration: const InputDecoration(
            hintText: "Enter new name",
            hintStyle: TextStyle(color: Colors.black38, fontSize: 14, fontWeight: FontWeight.normal),
            focusColor: colorAccent
          ),),
      ],
    );
  }

  Widget alignmentSpace(){
    return const SizedBox(height: 10,);
  }
}
