import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flip_streak/features/notes/presentation/dialog/details_toolbar/book_name/view/book_dialog_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../app_common_views/z_dialog/z_dialog.dart';
import '../../../manager/controller/note_controller.dart';
import '../../../manager/state_manager/note_detail_provider/book_name_provider.dart';


class BookNameDialog {

  BuildContext context;
  WidgetRef ref;


  BookNameDialog(this.context, this.ref) {

    ZDialog(
      context,
      mainButtonTitle: "Save",
      mainButtonColor: colorOrange,

      mainButtonFunction: ()=> _save(ref),

      child: BookDialogView(),

    );
  }

  _save(WidgetRef ref){
    ref.read(bookNameProvider.notifier).updateValue(NoteController.bookName.text);
  }

}