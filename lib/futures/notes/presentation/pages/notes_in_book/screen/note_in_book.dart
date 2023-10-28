import 'package:flip_streak/core/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/constants/color_constants.dart';
import '../../../../../../core/styles/padding.dart';
import '../../../../../app_common_views/text_view/text_view.dart';
import '../../../../data/model/note_model.dart';
import '../../../manager/controller/note_controller.dart';
import '../../../manager/state_manager/note_detail_provider/book_name_provider.dart';
import '../../../manager/state_manager/note_list_provider.dart';
import '../../empty_notes_widget.dart';
import '../../note_edit/screen/note_edit.dart';
import '../../note_item/note_item.dart';

class NotesInBookPage extends ConsumerWidget {
  const NotesInBookPage({Key? key, required this.bookName}) : super(key: key);

  final String bookName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final currentBookNotes = getFilteredList(ref.watch(noteListProvider));

    return Scaffold(

      /// App Bar
      appBar: AppBar(
        title: TextView(
          bookName,
          size: 18,
          overflow: TextOverflow.ellipsis,
          weight: FontWeight.bold,
          color: colorAccent,
        ),
        elevation: 0,
        foregroundColor: colorAccent,
        //backgroundColor: _backgroundColor,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),


      /// List
      body: SafeArea(

        child:
        currentBookNotes.isNotEmpty
        ? ListView.builder(
            itemCount: currentBookNotes.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const CustomPadding(horizontal: 16),

                child: NoteItem(note: currentBookNotes[index]),
              );
            }
          )

        : Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            EmptyNotesWidget(currentBook: bookName,),
          ],
        ),
      ),

      /// Fab
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(255, 227, 224, 1.0),
        foregroundColor: colorBrown,

        onPressed: (){
          NoteController.bookName.text = bookName;
          ref.read(bookNameProvider.notifier).updateValue(bookName);
          AppRouter.navigateTo(context, const NoteEdit());
        },

        child: const Icon(Icons.add),
      ),
    );
  }


  List<NoteModel> getFilteredList(List<NoteModel> allNotes){
    List<NoteModel> filteredList = [];

    for(var item in allNotes){
      if(item.noteBookName == bookName){
        filteredList.add(item);
      }
    }

    return filteredList;
  }
}
