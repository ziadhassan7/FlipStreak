import 'package:flip_streak/business/route_util.dart';
import 'package:flutter/material.dart';
import '../../../manager/controller/note_controller.dart';
import '../../../views/dialog/discard_dialog.dart';
import '../../note_share/screen/note_share_page.dart';
import 'editing_window.dart';

class NoteAppBar extends StatelessWidget {
  const NoteAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),

      child: Row(
        children: [
          ///                                                                   / Back Button
          IconButton(
            onPressed: (){
              //if text is changed, and either title or body is not empty
              //Open discard dialog
              if(EditingWindow.isChanged &&
              NoteController.noteBody.text.isNotEmpty ||
                  NoteController.noteTitle.text.isNotEmpty){

                DiscardDialog(context,);

              } else {
                Navigator.pop(context);
              }
            },

            icon: const Icon(Icons.arrow_back_ios)),

          const Spacer(),

          ///                                                                   / Share Button

          IconButton(
            onPressed: ()=> _onShare(context),
            icon: const Icon(Icons.share_outlined)
          )

        ],
      ),
    );
  }

  Future<void> _onShare(BuildContext context) async {
    RouteUtil.navigateTo(context, const NoteSharePage());
  }
}
