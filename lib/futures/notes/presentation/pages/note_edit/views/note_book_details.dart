import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/constants/color_constants.dart';
import '../../../../../../core/styles/box_decoration.dart';
import '../../../../../../core/styles/padding.dart';
import '../../../../../app_common_views/text_view/text_view.dart';
import '../../../dialog/book_name/book_name_dialog.dart';
import '../../../dialog/page_number/page_number_dialog.dart';
import '../../../manager/controller/bottom_bar_controller.dart';
import '../../../manager/state_manager/note_detail_provider/book_name_provider.dart';
import '../../../manager/state_manager/note_detail_provider/page_number_provider.dart';


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
          width: BottomBarController
              .getBookNameWidth(context, bookName),

          child: customViewButton(
            onPressed: () => BookNameDialog(context, ref),
            color: bookName == "" ? Colors.black38 : colorAccent.withOpacity(opacity),
            text: bookName == "" ? "Book name" : bookName,
          ),
        ),

        ///                                                                     / Page Number
        SizedBox(
          width: BottomBarController
              .getPageNumberWidth(context, pageNumber),

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

          child: TextView(text, color: color),
          ),
        ),
    );
  }
}
