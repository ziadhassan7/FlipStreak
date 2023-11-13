import 'package:flip_streak/futures/books/presentation/dialog/category_attacher/widget/checkbox_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/constants/color_constants.dart';
import '../../../../app_common_views/text_view/text_view.dart';
import '../../../data/model/book_model.dart';
import '../../managers/state_manager/categories_provider.dart';
import '../category_menu/view/widget/add_item_button.dart';

class AttacherView extends ConsumerWidget {
  const AttacherView({Key? key, required this.currentBook}) : super(key: key);

  final BookModel currentBook;
  static const double _paddingInBetween = 20;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final categoriesList = ref.watch(categoriesProvider);

    return SizedBox(
      height: MediaQuery.of(context).size.height *0.4,
      width: MediaQuery.of(context).size.width *0.8,

      child: Column(
        children: [

          /// Dialog Title
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: TextView("Categories", color: colorAccent, size: 30,),
          ),

          /// Add new menu item -  Button
          const AddItemButton(paddingInBetween: _paddingInBetween),


          Expanded(
            child:
            categoriesList.isEmpty
            ? const Center(child: TextView("",))
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
