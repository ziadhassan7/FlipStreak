import 'package:flip_streak/features/notes/presentation/manager/controller/note_controller.dart';
import 'package:flutter/material.dart';
import '../../dialog_text_input.dart';

class PageDialogView extends StatefulWidget {
  const PageDialogView({super.key,});

  @override
  State<PageDialogView> createState() => _PageDialogViewState();
}

class _PageDialogViewState extends State<PageDialogView> {

  @override
  Widget build(BuildContext context) {

    return DialogTextInput(
      labelText: "Enter page number",
      textController: NoteController.pageNumber,
      isNumericValue: true,
    );
  }
}
