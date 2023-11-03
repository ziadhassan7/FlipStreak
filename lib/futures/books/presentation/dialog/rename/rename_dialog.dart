import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flip_streak/futures/app_common_views/z_dialog/z_dialog.dart';
import 'package:flip_streak/futures/books/presentation/dialog/rename/manager/controller/rename_manager.dart';
import 'package:flip_streak/futures/books/presentation/dialog/rename/widgets/book_name_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/model/book_model.dart';


class RenameDialog {

  final BuildContext context;
  final WidgetRef ref;

  final BookModel book;
  static final TextEditingController controller = TextEditingController();

  RenameDialog(this.context, this.ref, {required this.book}) {

    controller.text = book.id; //set initial value to old name

    ZDialog(
        context,
        dominantButtonTitle: "Save",
        dominantButtonColor: colorAccent,

        closeOnDominateButton: false,

        dominantButtonFunction: ()=>
          RenameManager.changeBookName(context, ref, oldBook: book, controller: controller),

        child: const BookNameTextInput(),

    );
  }


}