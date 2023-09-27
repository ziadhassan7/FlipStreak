import 'package:flip_streak/data/model/note_model.dart';
import 'package:flip_streak/presentation/views/text_inria_sans.dart';
import 'package:flutter/material.dart';
import '../../../../app_constants/color_constants.dart';
import '../../../detail/widget/notes_and_bookmarks/notes/note_item.dart';

class SingleBookNotePage extends StatelessWidget {
  const SingleBookNotePage({Key? key, required this.notesList}) : super(key: key);

  final List<NoteModel> notesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// App Bar
      appBar: AppBar(
        title: TextInriaSans(
          notesList.first.noteBookName,
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


      body: SafeArea(

        child: ListView.builder(
          itemCount: notesList.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.only(right: 24),

              child: SizedBox(
                  height: 340,
                  child: NoteItem(note: notesList[index], isBigView: true,)),
            );
          }
        ),
      ),
    );
  }
}
