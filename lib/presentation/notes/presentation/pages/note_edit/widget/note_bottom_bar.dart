import 'package:flip_streak/presentation/views/circular_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../manager/controller/note_controller.dart';
import 'note_book_details.dart';

class NoteBottomBar extends ConsumerWidget {
  const NoteBottomBar({super.key});

  static final NoteController _controller = NoteController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [

        ///                                                                     / (Book name, Page number)
        const NoteBookDetails(),

        const Spacer(),

        ///                                                                     / Save Button
        CircularButton(
          onPressed: () => _onSave(context, ref),
          size: 42,
          icon: const Icon(Icons.done, color: Colors.white,),
        ),
      ],
    );
  }


  void _onSave(BuildContext context, WidgetRef ref){
    if (NoteController.formKey.currentState!.validate()) {
      _controller.saveNote(ref);
      NoteController.noteTitle.clear();
      NoteController.noteBody.clear();

      Navigator.pop(context);
    }
  }
}
