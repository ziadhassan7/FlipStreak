import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../app_constants/color_constants.dart';
import '../../../../business/route_util.dart';
import '../../../views/text_inria_sans.dart';
import '../pages/note_edit/screen/note_edit.dart';

class EmptyNotesWidget extends ConsumerWidget {
  const EmptyNotesWidget({Key? key}) : super(key: key);

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
                  onTap: () => RouteUtil.navigateTo(context, const NoteEdit()),
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

    return TextInriaSans(
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
