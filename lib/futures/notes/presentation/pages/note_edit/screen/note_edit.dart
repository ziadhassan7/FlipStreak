import 'package:flutter/material.dart';
import '../../../../../../core/styles/padding.dart';
import '../../../manager/controller/back_controller.dart';
import '../views/editing_window.dart';
import '../views/note_app_bar.dart';
import '../views/note_bottom_bar.dart';

class NoteEdit extends StatelessWidget {
  const NoteEdit({super.key, this.currentNoteId});

   final String? currentNoteId;

  final Color fillColor = Colors.black26;
  static const double _padding = 40;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: ()=> BackController.onSystemBack(context),

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
