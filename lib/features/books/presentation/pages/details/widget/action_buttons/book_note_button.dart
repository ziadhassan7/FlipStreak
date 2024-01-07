import 'package:flip_streak/features/books/presentation/managers/controllers/book_controller.dart';
import 'package:flip_streak/core/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../../core/constants/color_constants.dart';
import '../../../../../../app_common_views/circular_button.dart';
import '../../../../../../app_common_views/text_view/text_view.dart';
import '../../../../../../notes/presentation/pages/notes_in_book/screen/note_in_book.dart';
import '../../../../managers/state_manager/book_list_provider.dart';

class BookNotesButton extends StatelessWidget {
  const BookNotesButton({Key? key, required this.size}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),

      child: Consumer(
          builder: (context, ref, _) {

            ref.watch(bookListProvider);

            return SizedBox(
              height: size,
              width: size,
              child: CircularButton.child(
                  onPressed: () {
                    AppRouter.navigateTo(context, NotesInBookPage(bookName: bookModel.id));
                  },
                  color: colorAccent,
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.sticky_note_2_outlined, color: Colors.white, size: 24,),
                      TextView("Notes", color: Colors.white, size: 12,),
                    ],
                  )
              ),
            );
          }
      ),
    );
  }
}
