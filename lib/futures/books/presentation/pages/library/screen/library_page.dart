import 'package:flip_streak/futures/confetti/binding/confetti_library_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/constants/color_constants.dart';
import '../../../managers/state_manager/search_filter_provider.dart';
import '../widget/add_book_fab.dart';
import '../widget/book_list/book_list.dart';
import '../widget/filter_bar.dart';
import '../widget/top_widget.dart';

class LibraryPage extends ConsumerWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final String currentFilter = ref.watch(searchFilterProvider);

    return Scaffold(
      backgroundColor: colorPrimary.withOpacity(0.4),

      body: SafeArea(
        child: Column(
          children: [
            /// Topbar (Name & Search)
            const TopWidget(),

            /// Category Widget
            SearchFilterBar(currentFilter: currentFilter,),

            const SizedBox(height: 10,),

            /// Books
            BookList(currentFilter: currentFilter,),

            ///Confetti - Congratulations
            const Align(
                alignment: Alignment.topCenter,
                child: ConfettiLibraryPage(),)
          ],
        ),
      ),

      /// FAB - Add Book
      floatingActionButton: AddBookFab(currentFilter: currentFilter,),
    );
  }



}
