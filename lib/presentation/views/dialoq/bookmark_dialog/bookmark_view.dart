import 'package:flip_streak/presentation/views/dialoq/bookmark_dialog/bookmark_dialog_list.dart';
import 'package:flutter/material.dart';
import '../../text_inria_sans.dart';

class BookmarkView extends StatelessWidget {
  const BookmarkView({Key? key, required this.list}) : super(key: key);

  final List list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width *0.8,
      height: MediaQuery.of(context).size.height *0.6,

      child: Column(
        children: [

          TextInriaSans("Saved Bookmarks"),

          const SizedBox(height: 20,),

          Expanded(
            child: GridView.builder(

                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 100,
                    childAspectRatio: 2/3.5,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),

                itemCount: list.length,
                itemBuilder: (context, index) {

                  return BookmarkDialogList(dialogContext: context, page: list[index]);
                }
            ),
          ),
        ],
      ),
    );
  }
}
