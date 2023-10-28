import 'package:flip_streak/futures/books/presentation/dialog/category_attacher/widget/checkbox_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app_common_views/text_view/text_view.dart';
import '../../../data/model/book_model.dart';
import '../../managers/state_manager/categories_provider.dart';

class AttacherView extends ConsumerWidget {
  const AttacherView({Key? key, required this.currentBook}) : super(key: key);

  final BookModel currentBook;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final categoriesList = ref.watch(categoriesProvider);

    return SizedBox(
      height: MediaQuery.of(context).size.height *0.4,
      width: MediaQuery.of(context).size.width *0.8,

      child: Column(
        children: [
          Expanded(
            child:
            categoriesList.isEmpty
            ? const Center(child: TextView("You haven't created any categories yet!"))
            : ListView.separated(
              itemCount: categoriesList.length,
              itemBuilder: (context, index){

                return CheckboxItem(
                    catTitle: categoriesList[index],
                    currentBook: currentBook);
              },

              separatorBuilder: (BuildContext context, int index)
              => const Divider(color: Colors.black12,) ,),
          ),
        ],
      ),
    );
  }
}
