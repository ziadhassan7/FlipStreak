import 'package:flutter/material.dart';
import '../../../../../../app_constants/color_constants.dart';
import '../../../../../views/text_inria_sans.dart';
import '../../../../data/model/note_model.dart';
import '../../note_item/note_item.dart';

class NotesInBookPage extends StatelessWidget {
  const NotesInBookPage({Key? key, required this.notesList}) : super(key: key);

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
                    child: NoteItem(note: notesList[index])),
              );
            }
        ),
      ),
    );
  }
}
