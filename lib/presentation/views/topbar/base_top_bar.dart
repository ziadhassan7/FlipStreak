import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../business/app_wise/controllers/book_controller.dart';
import '../../../business/app_wise/exit_book_util.dart';
import '../../book/widget/menu/menu_button.dart';
import '../text_inria_sans.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key, required this.backgroundColor, required this.foregroundColor, }) : super(key: key);

  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      color: backgroundColor,


      child: Row(
        children: [
          /// arrow
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Consumer(
              builder: (context, ref, _) {
                return IconButton(
                  onPressed: () {
                    ExitBookHandler.closeBook(ref);
                    //navigate back and close
                    Navigator.pop(context);
                  },

                  icon: const Icon(Icons.arrow_back_ios_new, size: 17),
                  color: foregroundColor,);
              }
            ),
          ),


          /// Book Name
          SizedBox(
              width: MediaQuery.of(context).size.width /2,
              child: TextInriaSans(
                bookModel.id.replaceAll(".pdf", ""), //book name
                size: 18,
                overflow: TextOverflow.ellipsis,
                maxLine: 2,
                color: foregroundColor,
                weight: FontWeight.bold,)
          ),

          const Spacer(),


          /*/// PageCount Box
          Container(
            decoration: const BoxDecoration(
                color: colorSecondary,
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 25),
            child: TextInriaSans("1/5", color: colorAccent, weight: FontWeight.bold,),
          ),*/

          /// More Button
          const MenuButton(),
        ],
      ),
    );
  }
}
