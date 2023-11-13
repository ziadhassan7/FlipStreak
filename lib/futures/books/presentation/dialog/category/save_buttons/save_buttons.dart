import 'package:flip_streak/futures/books/presentation/dialog/category/category_attacher/category_attacher_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/constants/color_constants.dart';
import '../../../../../app_common_views/text_view/text_view.dart';
import '../../../../data/model/book_model.dart';
import '../../../managers/state_manager/book_list_provider.dart';

class SaveButtons extends ConsumerWidget {
  const SaveButtons({super.key, required this.currentBook});

  final BookModel currentBook;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [

        const Spacer(),

        /// Cancel Button
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const TextView('Cancel', color: colorDark,),
        ),

        /// Confirm Button
        ElevatedButton(
            onPressed: (){
              //Update book labels
              ref.read(bookListProvider.notifier).updateBookCategories(
                  currentBook, CategoryAttacherDialog.currentCategories);
              //close window
              Navigator.pop(context);
            },

            style: ButtonStyle(
              //color
              backgroundColor: MaterialStateProperty.all(colorAccent),),
              //text
              child: const TextView("Save", color: Colors.white,)
        ),
      ],
    );
  }
}
