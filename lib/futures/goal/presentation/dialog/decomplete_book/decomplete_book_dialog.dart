import 'package:flip_streak/core/constants/color_constants.dart';
import 'package:flip_streak/futures/app_common_views/dialoq_widget.dart';
import 'package:flip_streak/futures/books/presentation/managers/state_manager/book_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app_common_views/text_view/text_view.dart';
import '../../../../books/data/model/book_model.dart';


class DecompleteBookDialog {

  final BuildContext context;
  final WidgetRef ref;
  final BookModel bookItem;

  DecompleteBookDialog( this.context, this.ref, this.bookItem) {


    DialogWidget(
        context,
        dominantButtonTitle: "Remove",
        dominantButtonColor: Colors.red,

        dominantButtonFunction: (){
          ref.read(bookListProvider.notifier).toggleAsCompleted(bookItem);
        },

        child: const TextView("Remove from completed?", weight: FontWeight.bold, color: colorDark,)

    ).showStandardDialog();
  }

}