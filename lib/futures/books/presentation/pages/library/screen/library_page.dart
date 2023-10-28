import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/constants/color_constants.dart';
import '../../../managers/state_manager/filter_provider.dart';
import '../widget/add_book_fab.dart';
import '../widget/book_list/book_list.dart';
import '../widget/filter_bar.dart';
import '../widget/top_widget.dart';

class LibraryPage extends ConsumerWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final String currentFilter = ref.watch(filterProvider);

    return Scaffold(
      backgroundColor: colorPrimary.withOpacity(0.4),

      body: SafeArea(
        child: Column(
          children: [
            /// Topbar (Name & Search)
            const TopWidget(),

            /// Category Widget
            FilterBar(currentFilter: currentFilter,),

            const SizedBox(height: 10,),

            BookList(currentFilter: currentFilter,),
          ],
        ),
      ),

      /// FAB - Add Book
      floatingActionButton: AddBookFab(currentFilter: currentFilter,),
    );
  }



}
