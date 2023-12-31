import 'package:flip_streak/core/styles/device_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/constants/color_constants.dart';
import '../../../../data/model/note_model.dart';
import '../../../manager/state_manager/note_list_provider.dart';
import '../../empty_notes_widget.dart';
import '../../note_item/note_item.dart';
import '../widget/add_note_fab.dart';
import '../widget/top_widget.dart';

class NoteIndexPage extends ConsumerWidget {
  const NoteIndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<NoteModel> notes = ref.watch(noteListProvider);


   return Scaffold(
     resizeToAvoidBottomInset: false, //to prevent keyboard from missing with the layout
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

            : Expanded(
              child: SingleChildScrollView(child: Column(
                children: [
                  SizedBox(height: AppScreen(context).height * 0.1,),
                  const EmptyNotesWidget(),
                ],
              ))
              ),

        ],
      ),

     floatingActionButton: const AddNoteFab(),
    );
  }

}
