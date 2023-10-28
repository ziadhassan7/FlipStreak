import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/constants/color_constants.dart';
import '../../../../../../core/app_router.dart';
import '../../note_edit/screen/note_edit.dart';

class AddNoteFab extends ConsumerWidget {
  const AddNoteFab({super.key,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton.small(
      heroTag: "btn2",
      onPressed: () => AppRouter.navigateTo(context, const NoteEdit()),

      backgroundColor: const Color.fromRGBO(255, 237, 230, 1.0), //Color.fromRGBO(255, 231, 220, 1.0),
      child: const Icon(Icons.add, color: colorBrown,),
    );
  }
}
