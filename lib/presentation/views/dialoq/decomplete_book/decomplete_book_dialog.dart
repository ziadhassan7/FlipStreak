import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flip_streak/presentation/views/dialoq/dialoq_widget.dart';
import 'package:flip_streak/provider/book_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/model/book_model.dart';
import '../../text_inria_sans.dart';


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

        child: TextInriaSans("Remove from completed?", weight: FontWeight.bold, color: colorDark,)

    ).showStandardDialog();
  }

}