import 'package:flip_streak/presentation/notes/data/model/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../app_constants/color_constants.dart';
import '../../../manager/riverpod/note_list_provider.dart';
import '../../note_item/view/note_item.dart';
import '../widget/add_note_fab.dart';
import '../../../views/empty_notes_widget.dart';
import '../widget/top_widget.dart';

class NoteIndexPage extends ConsumerWidget {
  const NoteIndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<NoteModel> notes = ref.watch(noteListProvider);


   return Scaffold(
     backgroundColor: colorPrimary.withOpacity(0.4), //0.2

      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          /// Title
          const NotePageTopWidget(),

          /// Screen Body (Notes / Empty Notes)
          notes.isNotEmpty
            ? Expanded(
              child: ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index){
                    return NoteItem(note: notes[index],);
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
