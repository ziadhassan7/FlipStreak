import 'package:flip_streak/presentation/notes/presentation/manager/riverpod/note_detail_provider/book_name_provider.dart';
import 'package:flip_streak/presentation/notes/presentation/manager/riverpod/note_detail_provider/page_number_provider.dart';
import 'package:flip_streak/presentation/styles/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../app_constants/color_constants.dart';
import '../../../../../styles/box_decoration.dart';
import '../../../styles/custom_format.dart';

class NoteBookDetails extends ConsumerWidget {
  const NoteBookDetails({super.key});

  static const double opacity = 0.7;


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    String bookName = ref.watch(bookNameProvider);
    String pageNumber = ref.watch(pageNumberProvider);

    return Row(
      children: [
        ///                                                                     / Book Name
        customViewButton(bookName),

        ///                                                                     / Page Number
        customViewButton(pageNumber),
      ],
    );
  }

  Widget customViewButton(String text){
    return Padding(
      padding: const CustomPadding(right: 12),

      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: CustomDecoration(
            backgroundColor: Colors.white,
            radius: 30,
            borderColor: colorAccent.withOpacity(opacity)
        ),

        child: Text(text, style: CustomFormat.textInriaSans(
            color: colorAccent.withOpacity(opacity)),
        ),
      ),
    );
  }
}
