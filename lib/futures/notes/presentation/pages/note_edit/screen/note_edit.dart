import 'package:flip_streak/core/styles/device_screen.dart';
import 'package:flip_streak/core/utils/system_util.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/styles/padding.dart';
import '../../../manager/controller/back_controller.dart';
import '../views/editing_window.dart';
import '../views/note_app_bar.dart';
import '../views/note_bottom_bar.dart';

class NoteEdit extends StatefulWidget {
  const NoteEdit({super.key, this.currentNoteId});

   final String? currentNoteId;

  static const double _padding = 40;

  @override
  State<NoteEdit> createState() => _NoteEditState();
}

class _NoteEditState extends State<NoteEdit> {
  final Color fillColor = Colors.black26;

  @override
  void dispose() {
    super.dispose();
    SystemUtil.setScreenAllOrientation();
  }

  @override
  Widget build(BuildContext context) {

    //disable rotate if screen is thin,
    // (rotating with keyboard open, causes render issues)
    disableRotate(context);

    return WillPopScope(

      onWillPop: ()=> BackController.onSystemBack(context),

      child:  Scaffold(

        body: SafeArea(
          child: Column(
            children: [
              ///                                                               / Back , Share
              const NoteAppBar(),

              ///                                                               / Editing Space
              const Expanded(
                child: Padding(
                  padding: CustomPadding(horizontal: NoteEdit._padding),
                  child: EditingWindow(),
              )),


              ///                                                               / Book name, Page number, Save
              Padding(
                padding: const CustomPadding(horizontal: NoteEdit._padding,
                    vertical: NoteEdit._padding-20),
                child: NoteBottomBar(currentNoteId: widget.currentNoteId,),
              ),
            ],
          ),
        ),
      ),
    );
  }


  //Rotate, only if screen is wider than 400
  disableRotate(BuildContext context){
    double screenWidth = AppScreen(context).width;

    if(screenWidth < 500){
      SystemUtil.setScreenOnlyPortrait();
    }
  }
}
