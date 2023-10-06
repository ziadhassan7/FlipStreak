import 'package:flip_streak/presentation/library/widget/add_book_fab.dart';
import 'package:flip_streak/presentation/library/widget/book_list/book_list.dart';
import 'package:flip_streak/presentation/library/widget/filter_bar.dart';
import 'package:flip_streak/presentation/library/widget/top_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app_constants/color_constants.dart';
import '../../../provider/filter_provider.dart';

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
