import 'package:flip_streak/presentation/notes/presentation/manager/controller/share_note_controller.dart';
import 'package:flip_streak/presentation/notes/presentation/pages/note_share/view/share_item.dart';
import 'package:flip_streak/presentation/styles/padding.dart';
import 'package:flip_streak/presentation/views/text_inria_sans.dart';
import 'package:flutter/material.dart';
import '../../../../../../app_constants/color_constants.dart';
import '../../../../../../business/share_util.dart';


class NoteSharePage extends StatefulWidget {
  const NoteSharePage({super.key});

  @override
  State<NoteSharePage> createState() => _NoteSharePageState();
}

class _NoteSharePageState extends State<NoteSharePage> {


  @override
  void initState() {
    super.initState();

    //Open share settings
    Future.delayed(const Duration(milliseconds: 100), () async {
      ShareUtil.shareImage(await NoteShareController.share());
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,


      /// App bar
      appBar: AppBar(

        foregroundColor: Colors.white,
        backgroundColor: colorAccent,

        actions: [
          TextButton(
              onPressed: () async {
                ShareUtil.shareImage(await NoteShareController.share());
              },

              child: Padding(
                padding: const CustomPadding(horizontal: 12),
                child: TextInriaSans(
                  "Share", size: 18,
                  color: Colors.white, weight: FontWeight.bold,
                ),
              ))
        ],
      ),



      /// Note Item , Loading
      body: const SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            ShareItem(),

            Center(child: CircularProgressIndicator(color: Colors.white,),)
          ],
        ),
      )),
    );
  }
}

