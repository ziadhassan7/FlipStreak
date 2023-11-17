import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flip_streak/futures/notes/presentation/dialog/details_toolbar/page_number/view/page_dialog_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../app_common_views/z_dialog/z_dialog.dart';
import '../../../manager/controller/note_controller.dart';
import '../../../manager/state_manager/note_detail_provider/page_number_provider.dart';


class PageNumberDialog {

  BuildContext context;
  WidgetRef ref;

  PageNumberDialog(this.context, this.ref) {

    ZDialog(
      context,
      mainButtonTitle: "Save",
      mainButtonColor: colorOrange,

      mainButtonFunction: ()=> _save(ref),

      child: const PageDialogView(),

    );
  }


  _save(WidgetRef ref){
    ref.read(pageNumberProvider.notifier).updateValue(NoteController.pageNumber.text);
  }

}