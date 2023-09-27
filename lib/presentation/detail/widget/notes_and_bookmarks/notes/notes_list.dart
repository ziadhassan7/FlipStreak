import 'package:flip_streak/data/model/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../business/app_wise/controllers/book_controller.dart';
import '../../../../../provider/note_list_provider.dart';
import '../../../../views/text_inria_sans.dart';
import 'note_item.dart';

class NotesList extends ConsumerWidget {
  const NotesList({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //Get list of note, and reverse list
    final List notes = getCurrentBookNotes(
        ref.watch(noteListProvider)).reversed.toList();

    return (notes.isNotEmpty)

        ? ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: notes.length,
        itemBuilder: (context, index) {

          return SizedBox(
              width: 210, height: 160,
              child: NoteItem(note: notes[index],));
        })

        : Center(child: TextInriaSans("Nothing here"),);
  }


  ///--                                                                         / Functions
  //returns a list of only the current book notes
  List<NoteModel> getCurrentBookNotes(List allNotes) {

    List<NoteModel> currentNotes = [];

    //Iterate through all books, and save the favourites
    for (NoteModel element in allNotes) {
      if (element.noteBookName == bookModel.id) {
        currentNotes.add(element);
      }
    }

    return currentNotes;
  }
}
