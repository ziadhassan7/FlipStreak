import 'package:flip_streak/futures/books/presentation/managers/controllers/book_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../../core/styles/padding.dart';
import '../../../../managers/state_manager/bookmark_list_provider.dart';
import '../../../../../../app_common_views/text_view/text_view.dart';
import '../../../../../data/local_db/book_client.dart';
import 'bookmark_list_item.dart';

class BookmarkList extends ConsumerWidget {
  BookmarkList({Key? key}) : super(key: key);

  final BookClient bookClient = BookClient.instance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //Get Bookmarks
    final List<String> bookmarks = ref.watch(bookmarkListProvider);

    return Padding(
      padding: const CustomPadding(horizontal: 10),

      child:
        (bookmarks.isNotEmpty)
        ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Text
            const Padding(
              padding: CustomPadding(top: 40, horizontal: 30),
              child: TextView("Bookmarks:", size: 18, color: Colors.black54,),
            ),

            const SizedBox(width: 10,),

            /// List
            Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bookmarks.length,
                    itemBuilder: (context, index){

                      return BookmarkListItem(page: bookmarks[index]);
                    })
              ),
          ],
        )

          : const Center(child: TextView("Your bookmarks are empty"),),

    );
  }

  Future<List> getData() async {
    List bookmarks = await getBookmarkedPages(bookModel.id);
    return bookmarks;
  }

}
