import 'package:flip_streak/business/app_wise/controllers/book_controller.dart';
import 'package:flip_streak/business/route_util.dart';
import 'package:flip_streak/presentation/notes/presentation/pages/notes_in_book/screen/note_in_book.dart';
import 'package:flip_streak/presentation/views/text_inria_sans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app_constants/color_constants.dart';
import '../../../../provider/book_list_provider.dart';
import '../../../views/circular_button.dart';

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
                    RouteUtil.navigateTo(context, NotesInBookPage(bookName: bookModel.id));
                  },
                  color: colorAccent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.sticky_note_2_outlined, color: Colors.white, size: 24,),
                      TextInriaSans("Notes", color: Colors.white, size: 12,),
                    ],
                  )
              ),
            );
          }
      ),
    );
  }
}
