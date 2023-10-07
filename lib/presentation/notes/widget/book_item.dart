import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flip_streak/data/model/note_model.dart';
import 'package:flip_streak/presentation/notes/screen/book_note_page/single_book_note_page.dart';
import 'package:flutter/material.dart';
import '../../../business/route_util.dart';
import '../../views/text_inria_sans.dart';
import 'note_item.dart';

class BookItem extends StatelessWidget {
  const BookItem(this.bookName, this.notesList, {Key? key}) : super(key: key);

  final String bookName;
  final List<NoteModel> notesList;

  @override
  Widget build(BuildContext context) {

    List<NoteModel> currentList = [];

    for(NoteModel note in notesList) {
      if(note.noteBookName == bookName) {
        currentList.add(note);
      }
    }

    currentList.sort((a, b) => b.noteId.compareTo(a.noteId));

    return SizedBox(
      height: 300,
      width: MediaQuery.of(context).size.width,

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12),

            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,

                  child: TextInriaSans(
                    bookName,
                    size: 18,
                    overflow: TextOverflow.ellipsis,
                    weight: FontWeight.bold,
                    color: colorAccent,
                  ),
                ),

                const Spacer(),

                IconButton(
                  onPressed: (){
                    RouteUtil.navigateTo(context,
                        SingleBookNotePage(notesList: currentList));
                  },
                  icon: const Icon(Icons.arrow_forward, color: colorAccent,)
                )
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: currentList.length,
              itemBuilder: (context, index){
              return SizedBox(
                  width: 210, height: 160,
                  child: NoteItem(note: currentList[index]));
            }),
          )
        ],
      ),
    );
  }
}
