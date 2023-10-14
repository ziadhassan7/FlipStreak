import 'package:flip_streak/presentation/views/topbar/main_topbar/views/page_count_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../business/app_wise/controllers/book_controller.dart';
import '../../../../business/app_wise/exit_book_util.dart';
import '../../../book/views/menu/book_menu_button.dart';
import '../../text_inria_sans.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key, required this.backgroundColor, required this.foregroundColor, }) : super(key: key);

  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,

      child: Container(
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


            /// PageCount Box
            const PageCountBox(),

            /// More Button
            const BookMenuButton(),
          ],
        ),
      ),
    );
  }

}
