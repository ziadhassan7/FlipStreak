import 'package:flip_streak/presentation/library/widget/add_book_fab.dart';
import 'package:flip_streak/presentation/library/widget/filter_bar.dart';
import 'package:flip_streak/presentation/library/widget/list_item.dart';
import 'package:flip_streak/presentation/library/widget/top_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app_constants/color_constants.dart';
import '../../../business/string_list_converter.dart';
import '../../../data/model/book_model.dart';
import '../../../provider/book_list_provider.dart';
import '../../../provider/filter_provider.dart';

class LibraryPage extends ConsumerWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final files = ref.watch(bookListProvider);
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

            Expanded(
              child: FutureBuilder(
                  future: files,
                  builder: (context, AsyncSnapshot snapshot) {

                    if(snapshot.hasData){

                      List date = snapshot.data;

                      //sort by add date
                      date.sort((a, b) {
                        return b.addDate.compareTo(a.addDate);
                      });

                      return ListView.builder(
                          itemCount: getFilteredList(date, currentFilter).length,

                          itemBuilder: (context, index){
                            return ListItem(book: getFilteredList(date, currentFilter)[index]);
                          }
                      );

                    } else {

                      return const Center(child: CircularProgressIndicator(),);
                    }
                  }
              ),
            ),
          ],
        ),
      ),

      /// FAB - Add Book
      floatingActionButton: AddBookFab(currentFilter: currentFilter,),
    );
  }


  List getFilteredList(List allBooks, String filter) {
    List filteredList = [];

    /// Return all list, if "All"
    if(filter == "All") {
      filteredList = allBooks;
      return filteredList;
    }

    //Iterate through all books, and filter
    for (BookModel element in allBooks) {
      /// Filter for categories
      if (element.category != null) {
        List bookCategories = getListFromString(element.category!);

        // if book has that category
        if(bookCategories.contains(filter)) filteredList.add(element);
      }

      /// Filter for search
      if(element.id.toLowerCase().contains(filter.toLowerCase())) {
        if(!filteredList.contains(element)){
          filteredList.add(element);
        }
      }
    }

    return filteredList; //return filtered list
  }
}
