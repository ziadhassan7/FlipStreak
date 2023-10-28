import 'package:flip_streak/futures/books/presentation/managers/controllers/book_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../goal/presentation/dialog/picker_dialog/picker_dialog.dart';
import '../../managers/state_manager/book_list_provider.dart';
import '../../managers/state_manager/last_book_provider.dart';


class EditLastPageDialog {

  final BuildContext context;
  final WidgetRef ref;

  EditLastPageDialog( this.context, this.ref,) {

    PickerDialog(
        context,
        title: "Edit Last Page",

        initialValue: bookModel.lastPage,
        maxValue: bookModel.totalPages,

        onSave: (value){
          ref.read(bookListProvider.notifier).editLastPage(value);
          // Also change it in the last book widget
          ref.read(lastBookProvider.notifier).updateLastPage(bookModel, value);
        });
  }

}