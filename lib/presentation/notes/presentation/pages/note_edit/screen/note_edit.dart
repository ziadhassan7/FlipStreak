import 'package:flip_streak/presentation/notes/presentation/manager/controller/note_controller.dart';
import 'package:flip_streak/presentation/notes/presentation/views/dialog/discard_dialog.dart';
import 'package:flip_streak/presentation/styles/padding.dart';
import 'package:flutter/material.dart';
import '../widget/editing_window.dart';
import '../widget/note_app_bar.dart';
import '../widget/note_bottom_bar.dart';

class NoteEdit extends StatelessWidget {
  const NoteEdit({super.key, this.currentNoteId});

   final String? currentNoteId;

  final Color fillColor = Colors.black26;
  static const double _padding = 40;

  Future<bool> _onWillPop(BuildContext context) async {

    //Only if text is changed
    //And either title or body is not empty
    //Open discard dialog
    if (EditingWindow.isChanged){
      if(NoteController.noteBody.text.isNotEmpty ||
          NoteController.noteTitle.text.isNotEmpty){
        DiscardDialog(context,);
      }
    }

    //Close Screen
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: ()=> _onWillPop(context),

      child:  Scaffold(

        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ///                                                               / Back , Share
              const NoteAppBar(),

              ///                                                               / Editing Space
              const Expanded(
                child: Padding(
                  padding: CustomPadding(horizontal: _padding),
                  child: EditingWindow(),
              )),


              ///                                                               / Book name, Page number, Save
              Padding(
                padding: const CustomPadding(horizontal: _padding,
                    vertical: _padding-20),
                child: NoteBottomBar(currentNoteId: currentNoteId,),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
