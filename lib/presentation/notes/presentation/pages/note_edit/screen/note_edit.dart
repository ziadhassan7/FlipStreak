import 'package:flip_streak/presentation/styles/padding.dart';
import 'package:flutter/material.dart';
import '../widget/editing_window.dart';
import '../widget/note_app_bar.dart';
import '../widget/note_bottom_bar.dart';

class NoteEdit extends StatelessWidget {
  const NoteEdit({super.key});

  final Color fillColor = Colors.black26;
  static const double _padding = 40;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ///                                                                 / Back , Share
            NoteAppBar(),

            ///                                                                 / Editing Space
            Expanded(
              child: Padding(
                padding: CustomPadding(horizontal: _padding),
                child: EditingWindow(),
            )),


            ///                                                                 / Book name, Page number, Save
            Padding(
              padding: CustomPadding(horizontal: _padding, vertical: _padding-20),
              child: NoteBottomBar(),
            ),
          ],
        ),
      ),
    );
  }

}
