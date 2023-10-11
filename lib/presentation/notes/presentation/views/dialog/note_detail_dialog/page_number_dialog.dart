import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flip_streak/presentation/notes/presentation/manager/riverpod/note_detail_provider/page_number_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../views/dialoq/dialoq_widget.dart';
import '../../../manager/controller/note_controller.dart';


class PageNumberDialog {

  BuildContext context;
  WidgetRef ref;

  PageNumberDialog(this.context, this.ref) {

    DialogWidget(
      context,
      dominantButtonTitle: "Save",
      dominantButtonColor: colorOrange,

      dominantButtonFunction: ()=> _save(ref),

      child: TextFormField(
        controller: NoteController.pageNumber,
        decoration: const InputDecoration(labelText: "Book name"),
      ),

    ).showAlert();
  }


  _save(WidgetRef ref){
    ref.read(pageNumberProvider.notifier).updateValue(NoteController.pageNumber.text);
  }

}