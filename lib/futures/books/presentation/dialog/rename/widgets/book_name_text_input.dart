import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flip_streak/futures/app_common_views/text_view/text_view.dart';
import 'package:flip_streak/futures/books/presentation/dialog/rename/manager/state_manager/rename_book_provider.dart';
import 'package:flip_streak/futures/books/presentation/dialog/rename/rename_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookNameTextInput extends StatelessWidget {
  const BookNameTextInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        alignmentSpace(),

        const TextView("Rename Book", size: 16, weight: FontWeight.bold,),

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

        const SizedBox(height: 2,),
        _customStatusMessage(),

      ],
    );
  }

  Widget alignmentSpace(){
    return const SizedBox(height: 6,);
  }

  static Widget _customStatusMessage(){
    return Consumer(
      builder: (context, ref, _){
        final showMessage = ref.watch(renameStatusMessageProvider);

        return Visibility(
          visible: showMessage,

          child: const TextView(
            "A book with this name already exists",
            size: 12,
            color: Colors.red,
          ),
        );
      }
    );
  }
}
