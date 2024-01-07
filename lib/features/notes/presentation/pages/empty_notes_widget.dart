import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/app_router.dart';
import '../../../app_common_views/text_view/text_view.dart';
import '../manager/controller/note_controller.dart';
import '../manager/state_manager/note_detail_provider/book_name_provider.dart';
import '../pages/note_edit/screen/note_edit.dart';

class EmptyNotesWidget extends ConsumerWidget {
  const EmptyNotesWidget({Key? key, this.currentBook}) : super(key: key);

  final String? currentBook;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    double screenSize = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(25),

      child: Column(
        children: [

          Visibility(
              visible: screenSize > 500, //hide when screen rotates
              child: InkWell(
                  onTap: () {
                    if(currentBook != null){
                      NoteController.bookName.text = currentBook!;
                      ref.read(bookNameProvider.notifier).
                      updateValue(currentBook!);
                    }
                    AppRouter.navigateTo(context, const NoteEdit());
                  },
                  child: SvgPicture.asset("assets/illustrations/note_ill.svg"))),

          _verticalPadding(40),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _customText(context, "Still Empty!", color: colorAccent, isBold: true,),
              const SizedBox(width: 8,),
              _customText(context, "Add Some Notes", color: colorAccent,),
            ],
          ),

          _verticalPadding(20),

          _customText(context, "While reading, you can save some notes or memos,"
              " and they should appear here!",
            color: const Color.fromRGBO(169, 139, 136, 1),),

        ],),
    );
  }

  static Widget _customText(BuildContext context, String text, {required Color color, bool isBold = false,}){

    return TextView(
      text,

      size: 16,
      maxLine: 4,
      textAlign: TextAlign.center,

      color: color,
      weight: isBold ? FontWeight.bold : FontWeight.normal,
    );
  }

  static Widget _verticalPadding(double amount){
    return SizedBox(height: amount,);
  }
}
