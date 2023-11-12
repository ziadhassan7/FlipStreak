import 'package:flip_streak/core/styles/padding.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app_common_views/text_view/text_view.dart';
import 'bookmark_dialog_item.dart';

class BookmarkView extends ConsumerWidget {
  const BookmarkView({Key? key, required this.list}) : super(key: key);

  final List list;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return SizedBox(
      width: MediaQuery.of(context).size.width *0.8,
      height: MediaQuery.of(context).size.height *0.6,

      child: Column(
        children: [

          const Padding(
            padding: CustomPadding(top: 8, bottom: 26),
            child: TextView("Saved Bookmarks", size: 16, weight: FontWeight.bold,),
          ),

          Expanded(
            child: GridView.builder(

                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 100,
                    childAspectRatio: 2/3.5,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),

                itemCount: list.length,
                itemBuilder: (context, index) {

                  return BookmarkDialogItem(dialogContext: context, page: list[index]);
                }
            ),
          ),
        ],
      ),
    );
  }
}
