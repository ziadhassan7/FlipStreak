import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flip_streak/futures/notes/presentation/dialog/note_detail_dialog/view/detail_dialog_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app_common_views/dialoq_widget.dart';
import '../../manager/controller/note_controller.dart';
import '../../manager/state_manager/note_detail_provider/book_name_provider.dart';


class BookNameDialog {

  BuildContext context;
  WidgetRef ref;


  BookNameDialog(this.context, this.ref) {

    DialogWidget(
        context,
        dominantButtonTitle: "Save",
        dominantButtonColor: colorOrange,

        dominantButtonFunction: ()=> _save(ref),

        child: DetailDialogView(
          label: "Enter book name",
          controller: NoteController.bookName,
          isNumericValue: false,
        ),

    ).showStandardDialog();
  }

  _save(WidgetRef ref){
    ref.read(bookNameProvider.notifier).updateValue(NoteController.bookName.text);
  }

}