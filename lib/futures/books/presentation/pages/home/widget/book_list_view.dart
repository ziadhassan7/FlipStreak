import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'book_list_item.dart';

class BookListView extends ConsumerWidget {
  const BookListView({Key? key, required this.list}) : super(key: key);

  final List list;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),

      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),

        itemCount: list.length,
        //I should be using sliver so I don't have to call NeverScrollableScrollPhysics()
        // for better performance.
        // NeverScrollableScrollPhysics() for small lists as it lay off the whole list at once
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2 / 3.3,
            crossAxisSpacing: 25,
            mainAxisSpacing: 15),

        itemBuilder: (BuildContext context, int index) {
          String name = basename(list[index].id); //removes .pdf
          return BookListItem(
            bookName: name,
            bookModel: list[index]
          );
        },
      ),
    );
  }
}
