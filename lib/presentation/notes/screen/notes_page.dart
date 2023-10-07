import 'package:flip_streak/data/model/note_model.dart';
import 'package:flip_streak/presentation/notes/widget/add_note_fab.dart';
import 'package:flip_streak/presentation/notes/widget/book_item.dart';
import 'package:flip_streak/presentation/notes/widget/empty_notes_widget.dart';
import 'package:flip_streak/presentation/notes/widget/top_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app_constants/color_constants.dart';
import '../../../provider/note_list_provider.dart';

class NotesPage extends ConsumerWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<NoteModel> notes = ref.watch(noteListProvider);

    Set bookNames = {};

    for (NoteModel note in notes) {
      bookNames.add(note.noteBookName);
    }


   return Scaffold(
     backgroundColor: colorPrimary.withOpacity(0.4), //0.2

      body: Column(
        children: [

          /// Title
          const NotePageTopWidget(),

          /// Screen Body (Notes / Empty Notes)
          bookNames.isNotEmpty
          ? Expanded(
            child: ListView.builder(
                itemCount: bookNames.length,
                itemBuilder: (context, index){
                  return BookItem(bookNames.elementAt(index), notes);
                }
            ),
          )

          : const Expanded(
            child: Column(
              children: [
                Spacer(),
                EmptyNotesWidget(),
                Spacer(),
              ],
            ),
          ),

        ],
      ),

     floatingActionButton: const AddNoteFab(),
    );
  }

}
