import 'package:flip_streak/business/app_wise/controllers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../app_constants/color_constants.dart';
import '../../../business/print_debug.dart';
import '../../../provider/bookmark_list_provider.dart';

class BookmarkFab extends ConsumerWidget {
  const BookmarkFab(this.isBright, {Key? key,}) : super(key: key);

  final bool isBright;
  static bool? isBookmarked = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final Color backgroundColor = isBright ? dominateColor : darkPrimary;
    final Color foregroundColor = isBright ? subColor : darkSecondary;

    //listen for bookmarks list
    List<String> allBookmarks = ref.watch(bookmarkListProvider);
    //check if current page is bookmarked
    isBookmarked = allBookmarks.contains(currentPage.toString());

    return Positioned.directional(
      start: 15,
      bottom: 30,
      textDirection: TextDirection.rtl,

      child: FloatingActionButton(
        onPressed: () async {

          PrintDebug("What The Fuck Is going: pressed", currentPage);

          ref.read(bookmarkListProvider.notifier)
              .updateList(currentPage.toString(), allBookmarks);
        },

        elevation: 5,
        backgroundColor: backgroundColor,
        child: isBookmarked! ?
            SvgPicture.asset('assets/icons/bookmark_remove.svg', color: foregroundColor,)
            : SvgPicture.asset('assets/icons/bookmark_add.svg', color: foregroundColor,)

      ),
    );
  }
}
