import 'package:flip_streak/presentation/library/widget/book_list/empty_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../business/string_list_converter.dart';
import '../../../../data/model/book_model.dart';
import '../../../../provider/book_list_provider.dart';
import '../list_item.dart';

class BookList extends ConsumerWidget {
  const BookList({super.key, required this.currentFilter});

  final String currentFilter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final files = ref.watch(bookListProvider);

    return Expanded(
      child: FutureBuilder(
          future: files,
          builder: (context, AsyncSnapshot snapshot) {

            if(snapshot.hasData){

              List data = snapshot.data;

              if(data.isNotEmpty ){
                //sort by add date
                data.sort((a, b) {
                  return b.addDate.compareTo(a.addDate);
                });

                return ListView.builder(
                    itemCount: getFilteredList(data, currentFilter).length,

                    itemBuilder: (context, index){
                      return ListItem(book: getFilteredList(data, currentFilter)[index]);
                    }
                );

              } else {
                return EmptyList(currentFilter: currentFilter,);
              }

            } else {

              return const Center(child: CircularProgressIndicator(),);
            }
          }
      ),
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
