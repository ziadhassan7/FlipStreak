import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../managers/state_manager/book_list_provider.dart';
import '../../../../managers/state_manager/categories_provider.dart';
import '../../../../managers/state_manager/filter_provider.dart';


class EditCheckboxItemState extends ConsumerWidget {
  const EditCheckboxItemState(this.itemTitle, this.itemIndex,
      {Key? key, required this.updateState, required this.currentCategory}) : super(key: key);

  final String itemTitle;
  final int itemIndex;
  final Function() updateState;
  final String currentCategory;

  static final TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    editingController.text = itemTitle;

    /// OnTap
    return Row(
      children: [

        IconButton(
            onPressed: () async {
              //delete item
              await ref.read(categoriesProvider.notifier)
                  .deleteCategoryItem(itemTitle);

              //refresh list
              await ref.read(bookListProvider.notifier)
                  .deleteCatFromAllBooks(itemTitle);

              //if current category got deleted, go back to All list
              if (currentCategory == itemTitle) {
                ref.read(filterProvider.notifier)
                    .updateCategory("All");
              }

              //call setState on widget
              updateState();
            },
            icon: const Icon(Icons.delete_rounded, color: Colors.black, size: 20,)
        ),

        Expanded(
          child: TextFormField(
            controller: editingController,
          ),
        ),

        IconButton(
            onPressed: () async {
              await ref.read(categoriesProvider.notifier).updateCategoryItem(
                  index: itemIndex,
                  oldTitle: itemTitle,
                  newTitle: editingController.text);

              //refresh list
              await ref.read(bookListProvider.notifier)
                  .updateAllBooksWithNewCat(itemTitle, editingController.text);

              if(currentCategory == itemTitle){
                ref.read(filterProvider.notifier)
                    .updateCategory(editingController.text);
              }

              updateState();
            },
            icon: const Icon(Icons.done_rounded, color: Colors.black, size: 20,)
        )
      ],
    );
  }
}
