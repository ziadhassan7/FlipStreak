import 'package:flip_streak/futures/books/presentation/dialog/category/category_attacher/view/save_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../../core/constants/color_constants.dart';
import '../../../../../../app_common_views/text_view/text_view.dart';
import '../../../../../data/model/book_model.dart';
import '../../../../managers/state_manager/categories_provider.dart';
import '../../../category/add_item_button.dart';
import 'attacher_category_menu_item.dart';

class AttacherView extends ConsumerStatefulWidget {
  const AttacherView({Key? key, required this.currentBook}) : super(key: key);

  final BookModel currentBook;
  static const double _paddingInBetween = 20;

  @override
  ConsumerState<AttacherView> createState() => _AttacherViewState();
}

class _AttacherViewState extends ConsumerState<AttacherView> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {

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
          const AddItemButton(paddingInBetween: AttacherView._paddingInBetween),


          Expanded(
            child:
            ListView.separated(
              itemCount: categoriesList.length,
              itemBuilder: (context, index){

                return AttacherCategoryMenuItem(
                    categoriesList[index], index,
                    currentBook: widget.currentBook,
                    saveButtonState: showSaveButton);
              },

              separatorBuilder: (BuildContext context, int index)
              => const Divider(color: Colors.black12,) ,),
          ),



          /// (Cancel-Save) Buttons
          // show when adding new category to a book
          Visibility(
              visible: isVisible,
              child: SaveButtons(currentBook: widget.currentBook)),
        ],
      ),
    );
  }

  void showSaveButton(){
    setState(() {
      isVisible = true;
    });
  }
}
