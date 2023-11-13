import 'package:flip_streak/futures/books/presentation/dialog/category/category_attacher/view/save_buttons.dart';
import 'package:flip_streak/futures/books/presentation/managers/state_manager/category_save_button_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../../core/constants/color_constants.dart';
import '../../../../../../../core/styles/device_screen.dart';
import '../../../../../../app_common_views/text_view/text_view.dart';
import '../../../../../data/model/book_model.dart';
import '../../../../managers/state_manager/categories_provider.dart';
import '../../../category/add_item_button.dart';
import 'attacher_category_menu_item.dart';

class AttacherView extends ConsumerStatefulWidget {
  const AttacherView({Key? key, required this.currentBook}) : super(key: key);

  final BookModel currentBook;

  @override
  ConsumerState<AttacherView> createState() => _AttacherViewState();
}

class _AttacherViewState extends ConsumerState<AttacherView> {
  static const double _paddingInBetween = 20;

  @override
  void initState() {
    super.initState();
    //wait till widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(categorySaveButtonProvider.notifier).hideSaveButton();
    });
  }

  @override
  Widget build(BuildContext context,) {

    final categoriesList = ref.watch(categoriesProvider);

    return SizedBox(
      height: getHeight(context),
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
            ListView.separated(
              itemCount: categoriesList.length,
              itemBuilder: (context, index){

                return AttacherCategoryMenuItem(
                  categoriesList[index], index,
                  currentBook: widget.currentBook,);
              },

              separatorBuilder: (BuildContext context, int index)
              => const Divider(color: Colors.black12,) ,),
          ),



          /// (Cancel-Save) Buttons
          // show when adding new category to a book
          SaveButtons(currentBook: widget.currentBook),
        ],
      ),
    );
  }

  //category height
  double getHeight(BuildContext context){
    double screenHeight = AppScreen(context).height;
    if(screenHeight>450) return 450;

    return screenHeight - 60;
  }
}
