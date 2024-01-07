import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../dialog/discard_dialog.dart';
import '../../pages/note_edit/views/editing_window.dart';
import 'note_controller.dart';

class BackController {


  static onBackPressed(BuildContext context, WidgetRef ref){

    if(_shouldOpenDialog()){
      DiscardDialog(context, ref);

    } else {
      NoteController.clearAndRefresh(ref);
      Navigator.pop(context);
    }
  }

  static Future<bool> onSystemBack(BuildContext context, WidgetRef ref) async{

    if (_shouldOpenDialog()){
      DiscardDialog(context, ref);

    } else {
      NoteController.clearAndRefresh(ref);
    }

    //Close Screen
    return true;
  }

  static _shouldOpenDialog(){
    //Only if
    //text is changed, and either title or body is not empty
    return EditingWindow.isChanged &&
        (NoteController.noteBody.text.isNotEmpty ||
        NoteController.noteTitle.text.isNotEmpty);
  }
}