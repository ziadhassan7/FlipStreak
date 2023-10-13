import 'package:flutter/cupertino.dart';
import '../../pages/note_edit/widget/editing_window.dart';
import '../../views/dialog/discard_dialog.dart';
import 'note_controller.dart';

class BackController {


  static onBackPressed(BuildContext context){

    if(_shouldOpenDialog()){
      DiscardDialog(context,);

    } else {
      Navigator.pop(context);
    }
  }

  static Future<bool> onSystemBack(BuildContext context) async{

    if (_shouldOpenDialog()){
      DiscardDialog(context,);
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