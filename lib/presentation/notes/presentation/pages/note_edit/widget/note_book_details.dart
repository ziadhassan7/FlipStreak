import 'package:flip_streak/presentation/notes/presentation/manager/riverpod/note_detail_provider/book_name_provider.dart';
import 'package:flip_streak/presentation/notes/presentation/manager/riverpod/note_detail_provider/page_number_provider.dart';
import 'package:flip_streak/presentation/notes/presentation/views/dialog/note_detail_dialog/book_name_dialog.dart';
import 'package:flip_streak/presentation/notes/presentation/views/dialog/note_detail_dialog/page_number_dialog.dart';
import 'package:flip_streak/presentation/styles/device_screen.dart';
import 'package:flip_streak/presentation/styles/padding.dart';
import 'package:flip_streak/presentation/views/text_inria_sans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../app_constants/color_constants.dart';
import '../../../../../styles/box_decoration.dart';


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
        SizedBox(
          width: getBookNameWidth(context, bookName),
          child: customViewButton(
            onPressed: () => BookNameDialog(context, ref),
            color: bookName == "" ? Colors.black38 : colorAccent.withOpacity(opacity),
            text: bookName == "" ? "Book name" : bookName,
          ),
        ),

        ///                                                                     / Page Number
        SizedBox(
          width: getPageNumberWidth(context, pageNumber),
          child: customViewButton(
            onPressed: () => PageNumberDialog(context, ref),
            color: pageNumber == "" ? Colors.black38 : colorAccent.withOpacity(opacity),
            text: pageNumber == "" ? "Page number" : "pg. $pageNumber",
          ),
        ),
      ],
    );
  }

  Widget customViewButton({
    required Function()? onPressed,
    required Color color,
    required String text,
  }){

    return InkWell(
      onTap: onPressed,

      child: Padding(
        padding: const CustomPadding(right: 12),

        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: CustomDecoration(
              backgroundColor: Colors.white,
              radius: 30,
              borderColor: color
          ),

          child: TextInriaSans(text, color: color),
          ),
        ),
    );
  }


  double? getBookNameWidth(BuildContext context, String text){
    double screenWidth = DeviceScreen(context).width;

    if(text.length > screenWidth/7){
      return screenWidth * 0.4;
    }

    return null;
  }

  double? getPageNumberWidth(BuildContext context, String text){
    double screenWidth = DeviceScreen(context).width;

    if(text.length > screenWidth/20){
      return screenWidth * 0.28;
    }

    return null;
  }
}
